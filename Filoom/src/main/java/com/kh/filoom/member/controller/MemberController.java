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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.filoom.member.model.service.MemberService;
import com.kh.filoom.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	

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
	
	/**
	 * 2024.12.13 김다훈
	 * 마이페이지(예매 내역 조회) 접속 요청
	 * @return
	 */
	@GetMapping("reserve.me")
	public String reserve() {
		
		return "member/reserve";
	}
	
	/**
	 * 2024.12.13 김다훈
	 * 마이페이지(내가 본 영화 조회) 접속 요청
	 * @return
	 */
	@GetMapping("history.me")
	public String history() {
		
		return "member/history";
	}
	
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
	
	
	
	
	@ResponseBody
	@PostMapping(value="changePassword.me",
				 produces = "application/json; charset=UTF-8")
	public Map<String, String> changePassword(@RequestBody Map<String, String> requestData,
	                                          HttpSession session) {

	    String currentPassword = requestData.get("currentPassword");
	    String newPassword = requestData.get("newPassword");

	    Member loginUser = (Member) session.getAttribute("loginUser");
	    String encPwd = loginUser.getUserPwd();

	    Map<String, String> response = new HashMap<>();

	    if (!bcryptPasswordEncoder.matches(currentPassword, encPwd)) {
	        response.put("result", "mismatch");
	        return response;
	    }

	    String newEncPwd = bcryptPasswordEncoder.encode(newPassword);
	    loginUser.setUserPwd(newEncPwd);

	    int result = memberService.updatePassword(loginUser);
	    if (result > 0) {
	        session.setAttribute("loginUser", loginUser);
	        response.put("result", "success");
	    } else {
	        response.put("result", "error");
	    }

	    return response;
	}




}
























