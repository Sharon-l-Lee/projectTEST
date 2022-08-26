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
	public List<TeamTodo> teamTodoList(TeamTodo teamtodo) {
		return teamTodoDao.teamTodoList(teamtodo);
	}
	
	@Override
	public TeamTodo getTeamTodo(int ttno) {
		return teamTodoDao.getTeamTodo(ttno);
	}

	@Override
	public int makeTeamTodo(TeamTodo teamtodo) {
		return teamTodoDao.makeTeamTodo(teamtodo);
	}

	@Override
	public int deleteTeamTodo(int ttno) {
		return teamTodoDao.deleteTeamTodo(ttno);
	}

	@Override
	public int modifyTeamTodo(TeamTodo teamtodo) {
		return teamTodoDao.modifyTeamTodo(teamtodo);
	}
	
	@Override
	public int orderingTeamTodo(TeamTodo teamtodo) {
		return teamTodoDao.orderingTeamTodo(teamtodo);
	}

	@Override
	public int checkTeamTodo(TeamTodo teamtodo) {
		if(teamtodo.getTtcheck()==1) {
			teamtodo.setTtcheck(0);
		}else if(teamtodo.getTtcheck()==0) {
			teamtodo.setTtcheck(1);
		}
		return teamTodoDao.checkTeamTodo(teamtodo);
	}

	@Override
	public int deleteTeamTodoList(int tno) {
		return teamTodoDao.deleteTeamTodoList(tno);
	}

}
