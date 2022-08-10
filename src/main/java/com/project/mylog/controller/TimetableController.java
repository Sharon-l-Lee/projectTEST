package com.project.mylog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.Member;
import com.project.mylog.model.Timetable;
import com.project.mylog.service.TimerService;
import com.project.mylog.service.TimetableService;

@Controller
@RequestMapping("timetable")
public class TimetableController {
	
	@Autowired
	private TimetableService ttableservice;
	@Autowired
	private TimerService timerservice;
	
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String tableMake(Model model, Timetable timetable, HttpSession session) {
		String mid = ((Member)session.getAttribute("member")).getMid();
		model.addAttribute("tableIdList",ttableservice.tableIdList(session, mid));
		
		return "timer/timetable";
	}
	
//	@RequestMapping(value="write", method=RequestMethod.GET)
//	public String writeTime(Model model, Timetable timetable) {
//		int tno = timerservice.getTno();
	//model.addAttribute("timewrite", ttableservice.tableTno(tno));
//		model.addAttribute("timewrite", )
//		return "timer/timetable";
//	}
	

	
}
