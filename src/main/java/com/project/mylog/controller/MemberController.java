package com.project.mylog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.Member;
import com.project.mylog.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="joinView", method = {RequestMethod.GET, RequestMethod.POST})
	public String joinView() {
		return "member/join";
	}
	
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String joinMember(@ModelAttribute("member") Member member, String tempmbirth, Model model) {
		model.addAttribute("joinResult", memberService.joinMember(member, tempmbirth));
		return "forward:main.do";
	}
	
	
	@RequestMapping(value="idCheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String idCheck(String mid, Model model) {
		String msg;
		if (memberService.idCheck(mid) == 1) {
			msg = "중복된 아이디입니다";
		} else {
			msg = "사용가능한 아이디입니다";
		}
		model.addAttribute("result", msg);
		return "member/idCheck";
	}
}
