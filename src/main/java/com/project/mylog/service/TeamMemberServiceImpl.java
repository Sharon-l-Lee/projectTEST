package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TeamMemberDao;
import com.project.mylog.model.Member;
import com.project.mylog.model.TeamMember;

@Service
public class TeamMemberServiceImpl implements TeamMemberService {

	@Autowired
	private TeamMemberDao teamMemberDao;
	
	@Override
	public List<TeamMember> myTeamList(HttpSession session) {
		TeamMember teamMember = new TeamMember();
		teamMember.setMid(((Member)session.getAttribute("member")).getMid());
		String mid = teamMember.getMid();
		return teamMemberDao.myTeamList(mid);
	}
	
	@Override
	public List<TeamMember> myApplyTeamList(HttpSession session) {
		TeamMember teamMember = new TeamMember();
		teamMember.setMid(((Member)session.getAttribute("member")).getMid());
		String mid = teamMember.getMid();
		return teamMemberDao.myApplyTeamList(mid);
	}
	
	@Override
	public int applyTeamMember(HttpSession session, int tno) {
		TeamMember teamMember = new TeamMember();
		teamMember.setMid(((Member)session.getAttribute("member")).getMid());
		teamMember.setTno(tno);
		return teamMemberDao.applyTeamMember(teamMember);
	}

	@Override
	public int deleteApplyTeam(TeamMember teammember) {
		return teamMemberDao.deleteApplyTeam(teammember);
	}

	@Override
	public int permitApplyTeam(TeamMember teammember) {
		return teamMemberDao.permitApplyTeam(teammember);
	}
	
	@Override
	public int joinTeamMember(HttpSession session, int tno) {
		TeamMember teamMember = new TeamMember();
		teamMember.setMid(((Member)session.getAttribute("member")).getMid());
		teamMember.setTno(tno);
		return teamMemberDao.joinTeamMember(teamMember);
	}

	@Override
	public List<TeamMember> teamApplyList(int tno) {
		return teamMemberDao.teamApplyList(tno);
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
