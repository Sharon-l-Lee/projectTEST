package com.project.mylog.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TodoDao;
import com.project.mylog.model.Todo;

@Service
public class TodoServiceImpl implements TodoService {
	@Autowired
	private TodoDao todoDao;
	
	@Override
	public List<Todo> todoList(String mid, Date tdrdate) {
		return todoDao.todoList(mid, tdrdate);
	}

	@Override
	public int todoMake(Todo todo) {
		return todoDao.todoMake(todo);
	}
	
	@Override
	public int todoModify(int tdno, String tdcontent) {
		return todoDao.todoModify(tdno, tdcontent);
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
		int result = todoDao.todoChange(tdno, tdcheck);
		if(tdcheck == 1) {
			Todo todo = getTodo(tdno);
			result = todoDelayMake(todo);
		}
		return result;
	}

	@Override
	public int todoDelete(int tdno) {
		return todoDao.todoDelete(tdno);
	}



}
