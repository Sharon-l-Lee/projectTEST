package com.project.mylog.dao;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Member;

@Mapper
public interface MemberDao {

	public int joinMember(Member member);
	
	public int modifyMember(Member member);
	
	public int idCheck(String mid);
}
