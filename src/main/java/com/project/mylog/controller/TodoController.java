package com.project.mylog.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.Todo;
import com.project.mylog.service.TodoService;

@Controller
@RequestMapping("todo")
public class TodoController {
	
	@Autowired
	private TodoService todoService;
	
	@RequestMapping(value = "make", method = RequestMethod.GET)
	public String todoMake(Date tdrdate, Model model) {
		model.addAttribute("drdate", tdrdate);
		return "todo/todoMake";
	}
	@RequestMapping(value = "make", method = RequestMethod.POST)
	public String todoMake(Todo todo, Model model) {
		todoService.todoMake(todo);
		return "forward:../diary/myList.do";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String todoModify() {
		return "todo/todoModify";
	}
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String todoModify(int tdno, String tdcontent) {
		todoService.todoModify(tdno, tdcontent);
		return "forward:../diary/myList.do";
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String todoDelete(int tdno) {
		Date ddate = todoService.getTodo(tdno).getTdrdate();
		todoService.todoDelete(tdno);
		return "forward:../diary/myList.do?ddate="+ddate;
	}
	
	@RequestMapping(value = "check", method = {RequestMethod.GET, RequestMethod.POST})
	public String todoChange(int tdno, String tdcheckStr, Date nowDate) {
		if(tdcheckStr == null) {
			int tdcheck = todoService.getTodo(tdno).getTdcheck();
			if(tdcheck == 0 || tdcheck == 1) {
				todoService.todoChange(tdno, 2);
			}else if(tdcheck == 2) {
				todoService.todoChange(tdno, 0);
			}
		}else {
			int tdcheck =  Integer.parseInt(tdcheckStr);
			todoService.todoChange(tdno, tdcheck);
		}
		return "forward:../diary/myList.do?ddate="+nowDate;
	}
}
