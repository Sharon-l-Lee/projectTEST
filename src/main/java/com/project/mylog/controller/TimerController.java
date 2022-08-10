package com.project.mylog.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.dao.TimerDao;
import com.project.mylog.model.Member;
import com.project.mylog.model.Timer;
import com.project.mylog.model.Timetable;
import com.project.mylog.service.TimerService;
import com.project.mylog.service.TimetableService;

@Controller
@RequestMapping(value="timer")
public class TimerController {
	
	@Autowired
	private TimerService timerService;
	
	@Autowired
	private TimetableService ttableservice;
	
	@RequestMapping(value="setting", method=RequestMethod.GET)
	public String timerSetting() {
		
		return "timer/timersetting";
	}
	

	
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String timerView(HttpSession session, Timer timer, Model model, Timetable timetable) {
		model.addAttribute("timerset",timerService.timerMake(session, timer));
		model.addAttribute("tno", timerService.getTno());
		model.addAttribute("tablemake", ttableservice.tableMake(session, timetable));
		model.addAttribute("tbno", ttableservice.getTbno());
		return "timer/timer";
	}
	
	@RequestMapping(value="timestart", method=RequestMethod.GET)
	public String timerStart(Timer timer, Model model, Timetable timetable, HttpSession session) {
		model.addAttribute("timestart",timerService.timerStart(timer));
		model.addAttribute("tablestart", ttableservice.tableStart(timetable));
		return "timer/timer";
	}
	
	@RequestMapping(value="timewrite", method=RequestMethod.GET)
	public String timerWrite(HttpSession session, Timer timer, Model model,Timetable timetable) {
		model.addAttribute("timing", timerService.startEnd(session, timer));
		
		model.addAttribute("ttablewrite", ttableservice.tableEnd(timetable));
		
		return "timer/timer";
	}
	
	@RequestMapping(value="timesave", method=RequestMethod.GET)
	public String timerSave(HttpSession session, Timer timer, Model model) {
		
		model.addAttribute("ttablesave", timerService.timerSave(timer));
		
		return "timer/timer";
	}
	
	
}
