package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Todo;

@Mapper
public interface TodoDao {
	public List<Todo> todoList(Todo todo);
	public Todo getTodo(int tdno);
	public int todoMake(Todo todo);
	public int todoModify(Todo todo);
	public int todoDelayMake(Todo todo);
	public int todoChange(Todo todo);
	public int todoDelete(int tdno);
}
