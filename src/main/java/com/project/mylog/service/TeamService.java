package com.project.mylog.service;

import java.util.List;

import com.project.mylog.model.Team;

public interface TeamService {
	public int makeTeam(Team team);
	public int getTno();
	public int deleteTeam(int tno);
	public int modifyTeam(Team team);
	public Team getTeamDetail(int tno);
	public List<Team> teamList(String pageNum, Team team);
	public int teamTotCnt();
}
