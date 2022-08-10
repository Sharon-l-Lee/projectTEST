package com.project.mylog.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.mylog.model.Todo;

public interface TodoService {
	public List<Todo> todoList(HttpSession session, Date tdrdate);
	public Todo getTodo(int tdno);
	public int todoMake(Todo todo);
	public int todoModify(int tdno, String tdcontent);
	public int todoDelayMake(Todo todo);
	public int todoChange(int tdno, int tdcheck);
	public int todoDelete(int tdno);
}
