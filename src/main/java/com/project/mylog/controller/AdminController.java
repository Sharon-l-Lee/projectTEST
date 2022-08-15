package com.project.mylog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.Admin;
import com.project.mylog.service.AdminService;

@Controller
@RequestMapping(value="admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="join", method = RequestMethod.GET)
	public String adminJoinView() {
		return "admin/join";
	}
	
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String adminJoin(Admin admin, Model model) {
		model.addAttribute("joinAdmin", adminService.joinAdmin(admin));
		return "admin/list";
	}
	
	@RequestMapping(value="loginView", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminLoginView() {
		return "admin/login";
	}
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String adminLogin(String aid, String apw, HttpSession httpSession, Model model) {
		model.addAttribute("loginResult", adminService.loginAdmin(aid, apw, httpSession));
		return "forward:../main.do";
	}
	
	@RequestMapping(value="logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminLogout(HttpSession httpSession, Model model) {
		httpSession.invalidate();
		model.addAttribute("logoutResult", "관리자 로그아웃 성공");
		return "forward:../main.do";
	}
	
	@RequestMapping(value="list", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminList(Model model) {
		model.addAttribute("adminList", adminService.listAdmin());
		return "admin/list";
	}
	
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String adminList(String aid, Model model) {
		System.out.println(aid);
		model.addAttribute("adminDelete", adminService.deleteAdmin(aid));
		return "forward:list.do";
	}
	
}
