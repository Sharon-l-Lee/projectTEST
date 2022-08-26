package com.project.mylog.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TeamDao;
import com.project.mylog.model.Team;
import com.project.mylog.util.Paging;

@Service
public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamDao teamDao;

	@Override
	public int makeTeam(Team team) {
		return teamDao.makeTeam(team);
	}

	@Override
	public int getTno() {
		return teamDao.getTno();
	}
	
	@Override
	public int deleteTeam(int tno) {
		return teamDao.deleteTeam(tno);
	}

	@Override
	public int modifyTeam(Team team) {
		return teamDao.modifyTeam(team);
	}

	@Override
	public Team getTeamDetail(int tno) {
		return teamDao.getTeamDetail(tno);
	}

	@Override
	public List<Team> teamList(String pageNum, Team team) {
		int teamTotCnt = teamDao.teamTotCnt();
		Paging paging = new Paging(teamTotCnt, pageNum, 12, 5);
		team.setStartRow(paging.getStartRow());
		team.setEndRow(paging.getEndRow());
		return teamDao.teamList(team);
	}

	@Override
	public int teamTotCnt() {
		return teamDao.teamTotCnt();
	}


}
