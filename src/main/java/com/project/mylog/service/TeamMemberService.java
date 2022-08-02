package com.project.mylog.service;

import java.util.List;

import com.project.mylog.model.TeamMember;

public interface TeamMemberService {
	public int joinTeamMember(TeamMember teammember);
	public int drawalTeamMember(TeamMember teammember);
	public List<TeamMember> teamMemberList(int tno);
	public int teamMemberTotCnt(int tno);
}
