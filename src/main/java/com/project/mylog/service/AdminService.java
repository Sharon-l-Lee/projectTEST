package com.project.mylog.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.project.mylog.model.Admin;

public interface AdminService {
	
	public int joinAdmin(Admin admin);
	
	public Admin getAdminDetail(String aid);
	
	public String loginAdmin(String aid, String apw, HttpSession httpSession);
	
}
