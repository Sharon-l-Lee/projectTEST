package com.project.mylog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TeamMemberDao;
import com.project.mylog.model.TeamMember;

@Service
public class TeamMemberServiceImpl implements TeamMemberService {

	@Autowired
	private TeamMemberDao teamMemberDao;
	
	@Override
	public int joinTeamMember(TeamMember teammember) {
		return teamMemberDao.joinTeamMember(teammember);
	}

	@Override
	public int drawalTeamMember(TeamMember teammember) {
		return teamMemberDao.drawalTeamMember(teammember);
	}

	@Override
	public List<TeamMember> teamMemberList(int tno) {
		return teamMemberDao.teamMemberList(tno);
	}

	@Override
	public int teamMemberTotCnt(int tno) {
		return teamMemberDao.teamMemberTotCnt(tno);
	}

}
