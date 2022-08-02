package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.TeamMember;

@Mapper
public interface TeamMemberDao {
	public int joinTeamMember(TeamMember teammember);
	public int drawalTeamMember(TeamMember teammember);
	public List<TeamMember> teamMemberList(int tno);
	public int teamMemberTotCnt(int tno);
}
