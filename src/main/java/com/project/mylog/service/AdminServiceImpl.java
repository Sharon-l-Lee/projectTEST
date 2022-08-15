package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.AdminDao;
import com.project.mylog.model.Admin;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public int joinAdmin(Admin admin) {
		
		return adminDao.joinAdmin(admin);
	}

	@Override
	public Admin getAdminDetail(String aid) {
		return adminDao.getAdminDetail(aid);
	}
	
	@Override
	public String loginAdmin(String aid, String apw, HttpSession httpSession) {
		String result = "관리자 로그인 성공";
		Admin admin = adminDao.getAdminDetail(aid);
		if(admin == null) {
			result = "유효하지 않은 아이디입니다";
		}else if(! admin.getApw().equals(apw)) {
			result = "비밀번호가 맞지 않습니다";
		}else {
			// 로그인 성공
			httpSession.setAttribute("admin", admin);
			httpSession.setAttribute("aid", aid);
		}
		System.out.println("관리자 로그인 : "+result);
		return result;
	}

	@Override
	public List<Admin> listAdmin() {
		// TODO Auto-generated method stub
		return adminDao.listAdmin();
	}

	@Override
	public int deleteAdmin(String aid) {
		// TODO Auto-generated method stub
		return adminDao.deleteAdmin(aid);
	}

}
