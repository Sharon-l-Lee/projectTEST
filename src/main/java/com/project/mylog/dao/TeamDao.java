package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Team;

@Mapper
public interface TeamDao {
	public int makeTeam(Team team);
	public int getTno();
	public int deleteTeam(int tno);
	public int modifyTeam(Team team);
	public Team getTeamDetail(int tno);
	public List<Team> teamList(Team team);
	public int teamTotCnt();
	
}
