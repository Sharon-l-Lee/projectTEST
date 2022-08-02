package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.TeamTodo;

@Mapper
public interface TeamTodoDao {
	public List<TeamTodo> teamTodoList(int tno);
	public int writeTeamTodo(TeamTodo teamtodo);
	public int deleteTeamTodo(int ttno);
	public int orderingTeamTodo(TeamTodo teamtodo);
	public int checkTeamTodo(TeamTodo teamtodo);
	public int deleteTeamTodoList(int tno);
}
