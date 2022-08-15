package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.project.mylog.model.Admin;

public interface AdminService {
	
	public int joinAdmin(Admin admin);
	
	public Admin getAdminDetail(String aid);
	
	public String loginAdmin(String aid, String apw, HttpSession httpSession);
	
	public List<Admin> listAdmin();
	
	public int deleteAdmin(String aid);
	
}
