package com.project.mylog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TeamTodoDao;
import com.project.mylog.model.TeamTodo;

@Service
public class TeamTodoServiceImpl implements TeamTodoService {

	@Autowired
	private TeamTodoDao teamTodoDao;
	
	@Override
	public List<TeamTodo> teamTodoList(int tno) {
		return teamTodoDao.teamTodoList(tno);
	}

	@Override
	public int writeTeamTodo(TeamTodo teamtodo) {
		return teamTodoDao.writeTeamTodo(teamtodo);
	}

	@Override
	public int deleteTeamTodo(int ttno) {
		return teamTodoDao.deleteTeamTodo(ttno);
	}

	@Override
	public int orderingTeamTodo(TeamTodo teamtodo) {
		return teamTodoDao.orderingTeamTodo(teamtodo);
	}

	@Override
	public int checkTeamTodo(TeamTodo teamtodo) {
		return teamTodoDao.checkTeamTodo(teamtodo);
	}

	@Override
	public int deleteTeamTodoList(int tno) {
		return teamTodoDao.deleteTeamTodoList(tno);
	}

}
