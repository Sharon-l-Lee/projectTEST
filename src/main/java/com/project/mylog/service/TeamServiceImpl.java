package com.project.mylog.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TeamDao;
import com.project.mylog.model.Team;

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


}
