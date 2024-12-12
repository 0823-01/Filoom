package com.kh.filoom.member.controller;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.filoom.member.model.service.MemberService;
import com.kh.filoom.member.model.vo.Member;

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
	@PostMapping(value="login.me")
	public ModelAndView loginMember(Member m,
								    ModelAndView mv,
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
			session.setAttribute("alertMsg", "로그인 성공");
			
			mv.setViewName("redirect:/");
			
		} else { // 로그인 실패일 경우
			
			mv.addObject("errorMsg", "로그인 실패");
			
			mv.setViewName("common/errorPage");
		}
		
		return mv;
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
			
			return "redirect:/";
			
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
	@PostMapping(value="cert.do", 
				 produces="text/html; charset=UTF-8")
	public String sendCertNo(String email) {
		
		int random = (int)(Math.random() * 900000 + 100000);
		
		certNoList.put(email, String.valueOf(random));
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom("dahoon0823@gmail.com"); // 보여질 이메일 주소
		message.setSubject("[Filoom] 이메일 인증 번호입니다.");
		message.setText("인증 번호 : " + random);
		message.setTo(email);
		
		mailSender.send(message);
		
		return "인증번호 발급 완료";
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

}
























