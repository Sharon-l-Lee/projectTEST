package com.project.mylog.service;

import com.project.mylog.model.Member;

public interface MemberService {

	public int joinMember(Member member, String tempmbirth);
	
	public int modifyMember(Member member);
	
	public int idCheck(String mid);
}
