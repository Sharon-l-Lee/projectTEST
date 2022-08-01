package com.project.mylog.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {

	@RequestMapping(value="calendar")
	public String calendar(int year, int month, Model model) {

		return "claendar/calendar";
	}
}
