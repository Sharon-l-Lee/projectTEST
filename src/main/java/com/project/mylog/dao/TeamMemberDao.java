package com.project.mylog.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.TeamMember;

@Mapper
public interface TeamMemberDao {
	public List<TeamMember> myTeamList(String mid);
	public List<TeamMember> myApplyTeamList(String mid);
	public int applyTeamMember(TeamMember teammember);
	public int deleteApplyTeam(TeamMember teammember);
	public int permitApplyTeam(TeamMember teammember);
	public int joinTeamMember(TeamMember teammember);
	public List<TeamMember> teamApplyList(int tno);
	public int drawalTeamMember(TeamMember teammember);
	public List<TeamMember> teamMemberList(int tno);
	public int teamMemberTotCnt(int tno);
	public TeamMember getTeamMemberDetail(TeamMember teammember);
	public int deleteTeamMember(int tno);
}
