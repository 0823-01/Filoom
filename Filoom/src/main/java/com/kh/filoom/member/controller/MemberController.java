package com.kh.filoom.member.controller;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.filoom.member.model.service.MemberService;
import com.kh.filoom.member.model.vo.History;
import com.kh.filoom.member.model.vo.Member;
import com.kh.filoom.member.model.vo.Reserve;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender mailSender; // 다형성 적용
	
	private Map<String, String> certNoList = Collections.synchronizedMap(new HashMap<>());
	
	/**
	 * 2024.12.10 김다훈
	 * 로그인 페이지 불러오기 컨트롤러 메소드
	 * @param mv
	 * @return
	 */
	@GetMapping("loginForm.me")
	public ModelAndView loginForm(ModelAndView mv) {
		
		mv.setViewName("member/loginForm");
		
		return mv;
	}
	
	/**
	 * 2024.12.10 김다훈
	 * 로그인 컨트롤러 메소드
	 * @param m
	 * @param mv
	 * @param session
	 * @param saveId
	 * @param response
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="login.me", produces = "text/plain; charset=UTF-8")
	public String loginMember(Member m,
								    HttpSession session,
								    String saveId,
								    HttpServletResponse response) {
		
		if(saveId != null && saveId.equals("y")) {

			// > 아이디값을 저장하는 Cookie 생성
			Cookie cookie = new Cookie("saveId", m.getUserId());
			
			cookie.setMaxAge(24 * 60 * 60 * 1); 
			// > 만료시간 1일
			
			response.addCookie(cookie);
			
		} else {
			
			// 키값이 중복되면 덮어씌워진다는 점을 이용해서 동일한 키값의 쿠키를 생성
			Cookie cookie = new Cookie("saveId", m.getUserId());
			
			// 만료시간 0초 (즉시제거)
			cookie.setMaxAge(0);
			
			response.addCookie(cookie);
		}
		
		// 암호화 작업
		Member loginUser = memberService.loginMember(m);
		
		if((loginUser != null) && 
			(bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd()))) { 
			// 로그인 성공일 경우
			
			session.setAttribute("loginUser", loginUser);
			
			return "로그인 성공";
			
		} else { // 로그인 실패일 경우
			
			return "아이디 또는 비밀번호를 잘못 입력했습니다.";
		}
	}
	
	/**
	 * 2024.12.10 김다훈
	 * 로그아웃 컨트롤러 메소드
	 * @param session
	 * @return
	 */
	@GetMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		session.setAttribute("alertMsg", "로그아웃 성공");
		
		return "redirect:/";
	}

	/**
	 * 2024.12.10 김다훈
	 * 회원가입 페이지 불러오기 컨트롤러 메소드
	 * @param mv
	 * @return
	 */
	@GetMapping("enrollForm.me")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		mv.setViewName("member/enrollForm");
		
		return mv;
	}
	
	/**
	 * 2024.12.10 김다훈
	 * 회원가입 요청 컨트롤러 메소드
	 * @param m
	 * @param model
	 * @param session
	 * @return
	 */
	@PostMapping("insert.me")
	public String insertMember(Member m, 
							   Model model,
							   HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		System.out.println("암호문 : " + encPwd);
		
		m.setUserPwd(encPwd);
		
		// GENDER 값이 빈 문자열이면 null로 설정
	    if (m.getGender() == null || m.getGender().isEmpty()) {
	        m.setGender(null);
	    }
		
		System.out.println(m); // 확인용
		
		int result = memberService.insertMember(m);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "회원가입 성공");
			
			return "redirect:/loginForm.me";
			
		} else { // 실패
			
			model.addAttribute("errorMsg", "회원가입 실패");
			
			return "common/errorPage";
		}
		
	}
	
	/**
	 * 2024.12.11 김다훈
	 * 아이디 중복 체크 요청
	 * @param checkId
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "idCheck.me", produces = "application/json; charset=UTF-8")
	public Map<String, String> idCheck(@RequestBody Map<String, String> request) {
		
		String userId = request.get("userId").toLowerCase(); // 입력값 소문자로 변환
	    
	    Map<String, String> response = new HashMap<>();
		
		// 비속어 필터링
        List<String> restrictedWords = Arrays.asList("admin", "fuck");
        
        if (restrictedWords.stream().anyMatch(userId::contains)) {
        	
            response.put("result", "invalid");
            
            return response;
        }
		
        // 아이디 중복 확인 로직 (예시)
        boolean isDuplicate = memberService.idCheck(userId); // DB에서 중복 확인
        
        if (isDuplicate) {
        	
            response.put("result", "duplicate");
            
        } else {
        	
            response.put("result", "available");
        }
        
        return response;
	}
	
	/**
	 * 2024.12.12 김다훈
	 * 인증번호 생성 후 이메일 전송 요청 메소드
	 * @param email
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "cert.do", produces = "text/html; charset=UTF-8")
	public String sendCertNo(String email) {
	    // 인증번호 생성
	    int random = (int) (Math.random() * 900000 + 100000);
	    certNoList.put(email, String.valueOf(random)); // 인증번호 저장

	    try {
	        // 이메일 생성
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, "utf-8");

	        // HTML 내용 생성
	        String htmlContent = 
        	    "<!DOCTYPE html>" +
        	    "<html lang=\"en\">" +
        	    "<head>" +
        	        "<meta charset=\"UTF-8\">" +
        	        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" +
        	        "<title>인증번호 이메일</title>" +
        	    "</head>" +
        	    "<body style=\"font-family: Arial, sans-serif; background-color: #f4f4f9; margin: 0; padding: 0;\">" +
        	        "<div style=\"max-width: 600px; margin: 20px auto; background-color: #ffffff; border-radius: 10px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); overflow: hidden;\">" +
        	            "<div style=\"background-color: #493628; color: #ffffff; text-align: center; padding: 20px; font-size: 24px; font-weight: bold;\">" +
        	                "Filoom 인증번호 안내" +
        	            "</div>" +
        	            "<div style=\"padding: 30px; color: #333333; line-height: 1.6;\">" +
        	                "<p>안녕하세요,</p>" +
        	                "<p>Filoom을 이용해 주셔서 감사합니다. 아래 인증번호를 입력하여 이메일 인증을 완료해 주세요:</p><br>" +
        	                "<div style=\"font-size: 24px; font-weight: bold; color: #493628; text-align: center; padding: 10px 10px 10px 25px; border: 2px solid #493628; border-radius: 5px; margin: 20px auto; width: fit-content; letter-spacing: 15px; white-space: nowrap;\">" +
        	                    random +
        	                "</div>" +
        	                "<p align=\"right\"><strong>중요: </strong>인증번호는 5분후에 만료됩니다.</p><br><br>" +
        	                "<p><strong>\"영화처럼 특별한 하루를 Filoom에서 만나보세요!\"</strong></p>" +
        	                "<p>Filoom by backlight</p>" +
        	            "</div>" +
        	            "<div style=\"text-align: center; background-color: #f4f4f9; color: #888888; padding: 20px; font-size: 14px;\">" +
        	                "&copy; 2024 Filoom. All rights reserved." +
        	            "</div>" +
        	        "</div>" +
        	    "</body>" +
        	    "</html>";



	        // 이메일 설정
	        helper.setFrom("dahoon0823@gmail.com");
	        helper.setTo(email);
	        helper.setSubject("[Filoom] 이메일 인증 번호입니다.");
	        helper.setText(htmlContent, true); // true는 HTML 형식임을 명시

	        // 이메일 전송
	        mailSender.send(message);

	        return "인증번호 발급 완료";

	    } catch (Exception e) {
	        e.printStackTrace();
	        return "인증번호 발급 중 오류가 발생했습니다.";
	    }
	}

	
	/**
	 * 2024.12.12 김다훈
	 * 인증번호 대조 요청 메소드
	 * @param email
	 * @param checkNo
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="validate.do",
				 produces="text/html; charset=UTF-8")
	public String validate(String email, String checkNo) {
		
		String result = "";
		
		if(certNoList.get(email) != null && 
				certNoList.get(email).equals(checkNo)) {
			
			result = "인증 성공";
			
		} else {
			
			result = "인증 실패";
		}
		
		certNoList.remove(email);
		
		return result;
	}
	
	/**
	 * 2024.12.15 김다훈
	 * 마이페이지 접속 요청
	 * @return
	 */
	@GetMapping("myPage.me")
	public String myPage() {
		
		return "member/myPage";
	}

	/**
	 * 2024.12.13 김다훈
	 * 마이페이지(내 정보 조회) 접속 요청
	 * @return
	 */
	@GetMapping("profile.me")
	public String profile() {
		
		return "member/profile";
	}
	
	/**
	 * 2024.12.13 김다훈
	 * 마이페이지(내 쿠폰 조회) 접속 요청
	 * @return
	 */
	@GetMapping("coupon.me")
	public String coupon() {
		
		return "member/coupon";
	}
	
//	/**
//	 * 2024.12.13 김다훈
//	 * 마이페이지(예매 내역 조회) 접속 요청
//	 * @return
//	 */
//	@GetMapping("reserve.me")
//	public String reserve() {
//		
//		return "member/reserve";
//	}
	
//	/**
//	 * 2024.12.13 김다훈
//	 * 마이페이지(내가 본 영화 조회) 접속 요청
//	 * @return
//	 */
//	@GetMapping("history.me")
//	public String history() {
//		
//		return "member/history";
//	}
	
	/**
	 * 2024.12.13 김다훈
	 * 마이페이지(보고싶은 영화 조회) 접속 요청
	 * @return
	 */
	@GetMapping("favorite.me")
	public String favorite() {
		
		return "member/favorite";
	}
	
	/**
	 * 2024.12.13 김다훈
	 * 마이페이지(내가 쓴 리뷰 조회) 접속 요청
	 * @return
	 */
	@GetMapping("review.me")
	public String review() {
		
		return "member/review";
	}
	
	/**
	 * 2024.12.13 김다훈
	 * 마이페이지(회원탈퇴) 접속 요청
	 * @return
	 */
	@GetMapping("withdrawal.me")
	public String withdrawal() {
		
		return "member/withdrawal";
	}
	
	
	
	/**
	 * 2024.12.14 김다훈
	 * 12.17 비밀변호 변경 성공 시 로그아웃 후 로그인폼으로 이동 로직 추가
	 * 비밀번호 변경 요청
	 * @param currentPwd
	 * @param newPwd
	 * @param session
	 * @param model
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "changePwd.me", produces="text/plain; charset=UTF-8")
	public String changePwd(@RequestParam("currentPwd") String currentPwd,
	                        @RequestParam("newPwd") String newPwd,
	                        HttpSession session, Model model) {
		
	    // 현재 로그인된 사용자 정보 가져오기
		Member loginUser = (Member) session.getAttribute("loginUser");

	    // 기존 비밀번호 확인
	    if (!bcryptPasswordEncoder.matches(currentPwd, loginUser.getUserPwd())) {
	    	
	        return "현재 비밀번호가 일치하지 않습니다.";
	    }

	    // 새 비밀번호 암호화
	    String encNewPwd = bcryptPasswordEncoder.encode(newPwd);
	    
	    loginUser.setUserPwd(encNewPwd);

	    // 서비스 호출하여 DB 업데이트
	    int result = memberService.changePwd(loginUser);

	    if (result > 0) {
	    	
	    	session.removeAttribute("loginUser");
	    	
	        return "비밀번호가 성공적으로 변경되었습니다. 로그인 페이지로 이동합니다.";
	        
	    } else {
	    	
			return "비밀번호 변경에 실패하였습니다.";
	    }
	}

	/**
	 * 2024.12.14 김다훈
	 * 아이디 찾기 페이지 접속 요청
	 * @return
	 */
	@GetMapping("findIdForm.me")
	public String findIdForm() {
		
		return "member/findIdForm";
	}
	
	/**
	 * 2024.12.14 김다훈
	 * 비밀번호 찾기 페이지 접속 요청
	 * @return
	 */
	@GetMapping("findPwdForm.me")
	public String findPwdForm() {
		
		return "member/findPwdForm";
	}

	/**
	 * 2024.12.15 김다훈
	 * 이름 변경 요청
	 * @param newName
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "changeName.me", produces = "text/plain; charset=UTF-8")
	public String changeName(@RequestParam("newName") String newName, HttpSession session) {
		
	    // 현재 로그인된 사용자 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");

	    // 사용자 이름 업데이트
	    loginUser.setUserName(newName);
	    
	    int result = memberService.changeName(loginUser);

	    if (result > 0) {
	        // 세션 정보 업데이트
	        session.setAttribute("loginUser", loginUser);
	        
	        return "이름이 성공적으로 변경되었습니다.";
	        
	    } else {
	    	
	        return "이름 변경에 실패하였습니다. 다시 시도해주세요.";
	    }
	}
	
	/**
	 * 2024.12.15 김다훈
	 * 성별 변경 요청
	 * @param gender
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "changeGender.me", produces = "text/plain; charset=UTF-8")
	public String changeGender(@RequestParam("gender") String gender, HttpSession session) {
	    
	    // 현재 로그인된 사용자 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    
	    // "선택 안함"일 경우 gender 값을 null로 설정
	    if (gender.isEmpty()) {
	        loginUser.setGender(null); // DB에 null 삽입
	    } else {
	        loginUser.setGender(gender); // 'M' 또는 'F'
	    }
	    
	    // 업데이트 서비스 호출
	    int result = memberService.changeGender(loginUser);

	    if (result > 0) {
	        // 세션 정보 업데이트
	        session.setAttribute("loginUser", loginUser);
	        return "성별이 성공적으로 변경되었습니다.";
	    } else {
	        return "성별 변경에 실패하였습니다. 다시 시도해주세요.";
	    }
	}
	
	/**
	 * 2024.12.15 김다훈
	 * 생년월일 변경 요청
	 * @param birthDate
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "changeBirth.me", produces = "text/plain; charset=UTF-8")
	public String changeBirth(@RequestParam("birthDate") String birthDate, HttpSession session) {
	    // 현재 로그인된 사용자 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");

	    // 생년월일 업데이트
	    loginUser.setBirth(birthDate);

	    int result = memberService.changeBirth(loginUser);

	    if (result > 0) {
	        // 세션 정보 업데이트
	        session.setAttribute("loginUser", loginUser);
	        return "생년월일이 성공적으로 변경되었습니다.";
	    } else {
	        return "생년월일 변경에 실패하였습니다. 다시 시도해주세요.";
	    }
	}
	
	/**
	 * 2024.12.15 김다훈
	 * 마케팅 활용 동의 변경 요청
	 * @param marketing
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "changeMarketing.me", produces = "text/plain; charset=UTF-8")
	public String changeMarketing(@RequestParam("marketing") String marketing, HttpSession session) {
	    // 현재 로그인된 사용자 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");

	    // 사용자 마케팅 정보 업데이트
	    loginUser.setMarketing(marketing);
	    
	    int result = memberService.changeMarketing(loginUser);

	    if (result > 0) {
	        // 세션 정보 업데이트
	        session.setAttribute("loginUser", loginUser);
	        return "성공적으로 업데이트되었습니다.";
	    } else {
	        return "업데이트 실패. 다시 시도해주세요.";
	    }
	}

	/**
	 * 2024.12.17 김다훈
	 * 회원탈퇴 비밀번호 확인용 컨트롤러
	 * @param currentPwd
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "checkPwd.me", produces = "text/plain; charset=UTF-8")
	public String checkPwd(@RequestParam("currentPwd") String currentPwd, HttpSession session) {
		
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    
	    if (bcryptPasswordEncoder.matches(currentPwd, loginUser.getUserPwd())) {
	    	
	        return "비밀번호 일치";
	    }
	    
	    return "비밀번호 불일치";
	}
	
	/**
	 * 2024.12.17 김다훈
	 * 회원 탈퇴 처리 컨트롤러
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "withdraw.me", produces = "text/plain; charset=UTF-8")
	public String withdrawMember(HttpSession session) {
		
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    
	    int result = memberService.withdrawMember(loginUser.getUserId());
	    
	    if (result > 0) {
	    	
	        session.invalidate();
	        
	        return "탈퇴 성공";
	    }
	    
	    return "탈퇴 실패";
	}

	/**
	 * 2024.12.17~19 김다훈
	 * 예매 내역, 예매 취소 내역 조회 컨트롤러
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/reserve.me")
    public String reserveList(HttpSession session, Model model) {
		
        // 로그인된 사용자 세션에서 가져오기
        Member loginUser = (Member) session.getAttribute("loginUser");
        
        // 예매 내역 조회
        List<Reserve> reserveList = memberService.reserveList(loginUser.getUserNo());
        // 예매 시 사용한 쿠폰 목록 조회
        List<Reserve> useCouponList = memberService.useCouponList(loginUser.getUserNo());
        // 예매 취소 내역 조회
        List<Reserve> cancelList = memberService.cancelList(loginUser.getUserNo());
        
        System.out.println("reserveList = " + reserveList);
        System.out.println("useCouponList = " + useCouponList);
        System.out.println("cancelList = " + cancelList);

        // 모델에 예매 내역 데이터 담기
        model.addAttribute("reserveList", reserveList);
        model.addAttribute("useCouponList", useCouponList);
        model.addAttribute("cancelList", cancelList);
        
        return "member/reserve"; // 예매 내역 화면으로 이동
    }
	
	@GetMapping("/history.me")
    public String historyList(HttpSession session, Model model) {
		
        // 로그인된 사용자 세션에서 가져오기
        Member loginUser = (Member) session.getAttribute("loginUser");
        
        // 영화 기록 조회
        List<History> historyList = memberService.historyList(loginUser.getUserNo());
        
        System.out.println("historyList = " + historyList);

        // 모델에 영화 기록 목록 데이터 담기
        model.addAttribute("historyList", historyList);
        
        return "member/history"; // 예매 내역 화면으로 이동
    }




}
























