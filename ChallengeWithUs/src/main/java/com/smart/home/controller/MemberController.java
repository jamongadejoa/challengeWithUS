package com.smart.home.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.smart.home.dto.MemberDTO;
import com.smart.home.service.MemberService;

@Controller
@RequestMapping("/yj")
public class MemberController {

	@Autowired
	MemberService service;

	@Autowired
	private JavaMailSender mailSender;

	// 회원가입 폼으로 이동 -> 완료
	@GetMapping("/MemberRegForm")
	public String MemberRegForm() {
		return "yj/MemberRegForm";
	}

	// 회원가입 확인 -> 완료
	@PostMapping("MemberRegOk")
	public ModelAndView MemberRegOk(MemberDTO dto) {
		int result = 0;
		System.out.println(dto);
		try {
			result = service.MemberInsert(dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원가입실패" + e.getMessage());
		}

		ModelAndView mav = new ModelAndView();
		if (result > 0) {
			mav.setViewName("home");
		} else {
			mav.setViewName("yj/MemberResult");
		}
		return mav;
	}

	// 로그인 화면으로 이동 -> 완료
	@GetMapping("/login")
	public String login() {
		return "yj/login";
	}

	// 로그인 -> 완료
	@PostMapping("/loginOk")
	public ModelAndView loginOk(String memberId, String memberPwd, HttpSession session) {
		System.out.println(memberId + memberPwd + "hi");
		ModelAndView mav = new ModelAndView();
		try {
			MemberDTO dto = service.loginOk(memberId, memberPwd);
			session.setAttribute("logId", dto.getMemberId());
			session.setAttribute("logName", dto.getMemberName());
			session.setAttribute("logStatus", "Y");
			mav.setViewName("home");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:login");
		}
		return mav;

	}

	// 로그아웃 -> 완료
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}

	// 아이디 찾기 화면으로 이동 -> 완료
	@GetMapping("/findIdForm")
	public String findIdForm() {
		return "yj/findIdForm";
	}

	// 아이디 찾아서 아이디만 반환 -> 완료
	@PostMapping("/idSearchOk")
	public ModelAndView findId(String memberName, String memberEmail) {
		String memberId = null;
		ModelAndView mav = new ModelAndView();

		try {
			memberId = service.findId(memberName, memberEmail);
			System.out.println(memberId);
			mav.addObject("MemberId", memberId);
			mav.setViewName("yj/returnMemberId");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("yj/returnMemberId");
			return mav;
		}
	}

	// 아이디 중복 체크 -> 완료
	@GetMapping("/dupChk")
	@ResponseBody
	public Integer dupChk(String id) {
		Integer result = 0;
		String dupId = null;

		try {
			dupId = service.dupChk(id);
			if (dupId == null) {
				result = 0;
			} else {
				result = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 비밀번호 찾기 페이지 이동 -> 완료
	@GetMapping("/findPwdForm")
	public String findPwdForm() {
		return "yj/findPwd";
	}

	// 비밀번호 찾기 -> 완료
	@PostMapping("/findPwd")
	@ResponseBody
	public int findPwd(String memberId, String memberEmail) {
		String pwd = null;
		int result = 0;
		try {
			pwd = service.findPwd(memberId, memberEmail);
			if (pwd == null) {
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String setFrom = "winterer601@naver.com";
		String toMail = memberEmail;
		String title = "비밀번호 찾기 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "회원님의 비밀번호는 " + pwd + "입니다.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			result = 1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 회원수정 폼으로 이동
	@PostMapping("/memberUpdateForm")
	public ModelAndView memeberUpdateForm(String logId) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = null;
		try {
			dto = service.getMember(logId);
			mav.addObject("dto", dto);
			mav.setViewName("yj/memberUpdateForm");
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(dto.toString());
		return mav;
	}

	// 회원가입 확인 -> 완료
	@PostMapping("MemberUpdateOk")
	public ModelAndView MemberUpdateOk(MemberDTO dto) {
		int result = 0;
		System.out.println(dto);
		try {
			result = service.memberUpdate(dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정실패" + e.getMessage());
		}

		ModelAndView mav = new ModelAndView();
		if (result > 0) {
			mav.setViewName("home");
		} else {
			mav.setViewName("yj/MemberResult");
		}
		return mav;
	}

}
