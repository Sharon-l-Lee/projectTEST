package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.mylog.model.Member;

public interface MemberService {

	public int joinMember(Member member, String tempmbirth);
	
	public int modifyMember(Member member, String tempmbirth);
	
	public int idCheck(String mid);
	
	public int deleteMember(String mid);
	
	public int recoverMember(String mid);
	
	public List<Member> memberList(String pageNum);
	
	public int countMember();
	
	public Member getMember(HttpSession session);
	
	public String loginCheck(String mid, String mpw, HttpSession session);
	
	public String searchIdPw(String mname, String memail);
	
	public Member getMemberForEmail(String memail);
	
	public int emailCheck(String memail);
	
	public List<Member> findFriend(HttpSession session, String mname);
}
