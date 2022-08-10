package com.project.mylog.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TodoDao;
import com.project.mylog.model.Member;
import com.project.mylog.model.Todo;

@Service
public class TodoServiceImpl implements TodoService {
	@Autowired
	private TodoDao todoDao;
	
	@Override
	public List<Todo> todoList(HttpSession session, Date tdrdate) {
		Todo todo = new Todo();
		todo.setMid(((Member) session.getAttribute("member")).getMid());
		todo.setTdrdate(tdrdate);
		return todoDao.todoList(todo);
	}

	@Override
	public int todoMake(Todo todo) {
		return todoDao.todoMake(todo);
	}
	
	@Override
	public int todoModify(int tdno, String tdcontent) {
		Todo todo = new Todo();
		todo.setTdno(tdno);
		todo.setTdcontent(tdcontent);
		return todoDao.todoModify(todo);
	}
	
	@Override
	public Todo getTodo(int tdno) {
		return todoDao.getTodo(tdno);
	}
	
	@Override
	public int todoDelayMake(Todo todo) {
		return todoDao.todoDelayMake(todo);
	}

	@Override
	public int todoChange(int tdno, int tdcheck) {
		Todo todo = todoDao.getTodo(tdno);
		todo.setTdcheck(tdcheck);
		int result = todoDao.todoChange(todo);
		if(tdcheck == 1) {
			result = todoDao.todoDelayMake(todo);
		}
		return result;
	}

	@Override
	public int todoDelete(int tdno) {
		return todoDao.todoDelete(tdno);
	}



}
