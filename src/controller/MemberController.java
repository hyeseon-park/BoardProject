package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Member;
import service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	//회원가입
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUp(Member member, Model model) {
		boolean result = memberService.signUpMember(member);
		String msg = "";
		if (result) {
			msg = "가입 성공했습니다.";
		} else {
			msg = "가입 실패했습니다.";
		}
		model.addAttribute("msg", msg);
		return "member/signInForm";
	}

	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String showSignUp() {
		return "member/signUpForm";
	}
	
	//로그인
	@RequestMapping(value = "/signIn", method = RequestMethod.POST)
	public String signIn(Model model, String mID, String mPass) {
		if (mPass.equals(memberService.getMemberByID(mID).getmPass())) {
			return "redirect:list";
		} else {
			model.addAttribute("msg", "로그인 실패했습니다.");
			return "member/signInForm";
		}
	}

	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String showSignIn() {
		return "member/signInForm";
	}
	
	//
	@RequestMapping(value = "/signOut")
	public String signOut(HttpSession session) {
		session.invalidate();
		return "redirect:signInForm";
	}
	
	@RequestMapping(value = "/noAuth")
	public String showNoAuth(HttpSession session, Model model) {
		return "member/noAuth";
	}
}
