package com.project.mylog.dao;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Admin;

@Mapper
public interface AdminDao {
	
	public int joinAdmin(Admin admin);
	
	public Admin getAdminDetail(String aid);
}
