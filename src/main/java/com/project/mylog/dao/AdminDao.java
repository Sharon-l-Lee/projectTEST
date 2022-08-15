package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Admin;

@Mapper
public interface AdminDao {
	
	public int joinAdmin(Admin admin);
	
	public Admin getAdminDetail(String aid);
	
	public List<Admin> listAdmin();
	
	public int deleteAdmin(String aid);
}
