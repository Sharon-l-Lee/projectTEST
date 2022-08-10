package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.mylog.model.TeamMember;

public interface TeamMemberService {
	public List<TeamMember> myTeamList(HttpSession session);
	public List<TeamMember> myApplyTeamList(HttpSession session);
	
	public int applyTeamMember(HttpSession session, int tno);
	public int deleteApplyTeam(TeamMember teammember);
	public int permitApplyTeam(TeamMember teammember);
	
	public int joinTeamMember(HttpSession session, int tno);
	public List<TeamMember> teamApplyList(int tno);
	public int drawalTeamMember(TeamMember teammember);
	public List<TeamMember> teamMemberList(int tno);
	public int teamMemberTotCnt(int tno);
	
}
