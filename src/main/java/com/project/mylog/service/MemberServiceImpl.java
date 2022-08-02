package com.project.mylog.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.MemberDao;
import com.project.mylog.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int joinMember(Member member, String tempmbirth) {
		if ("".equals(tempmbirth)) {
			member.setMbirth(null);
		} else {
			member.setMbirth(Date.valueOf(tempmbirth));
		}
		return memberDao.joinMember(member);
	}

	@Override
	public int modifyMember(Member member) {
		return memberDao.modifyMember(member);
	}

	@Override
	public int idCheck(String mid) {
		return memberDao.idCheck(mid);
	}

}
