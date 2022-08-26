package com.project.mylog.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.TeamTodo;
import com.project.mylog.service.TeamMemberService;
import com.project.mylog.service.TeamService;
import com.project.mylog.service.TeamTodoService;

@Controller
@RequestMapping("teamtodo")
public class TeamTodoController {

	@Autowired
	private TeamTodoService teamTodoService;

	@Autowired
	private TeamService teamService;
	
	@Autowired
	private TeamMemberService teamMService;

	// 해당날짜의 todoList
	@RequestMapping(value = "todoList", method = { RequestMethod.GET, RequestMethod.POST })
	public String todoList(HttpSession session, String year, String month, String day, Model model) {
		int yearInt = Integer.parseInt(year);
		int monthInt = Integer.parseInt(month);
		int dayInt = Integer.parseInt(day);

		Date ttrdate = new Date(yearInt - 1900, monthInt - 1, dayInt);
		model.addAttribute("ttrdate", ttrdate);
		return "forward:../team/myTeamDetailView.do?ttrdate=" + ttrdate;
	}
	
	//teamTodoCheck
	@RequestMapping(value = "check", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String todoChange(TeamTodo teamtodo, int tdcheck) {
		Date ttrdate = teamTodoService.getTeamTodo(teamtodo.getTtno()).getTtrdate();
		int tno = teamTodoService.getTeamTodo(teamtodo.getTtno()).getTno();
		teamTodoService.checkTeamTodo(teamtodo); 
		return "forward:../team/myTeamDetailView.do?ttrdate="+ttrdate+"&tno="+tno;  
	}
	//makeTeamTodo
	@RequestMapping(value = "makeView", method = RequestMethod.GET)
	public String makeTeamTodo(int tno, Date ttrdate, Model model) {
		model.addAttribute("tno", tno);
		model.addAttribute("ttrdate", ttrdate);
		model.addAttribute("teamMemberList", teamMService.teamMemberList(tno));
		return "teamtodo/teamTodoMake";
	}
	@RequestMapping(value = "make", method = RequestMethod.POST) 
	public String makeTeamTodo(TeamTodo teamtodo, Model model) {
		model.addAttribute("makeTeamTodoResult", teamTodoService.makeTeamTodo(teamtodo));
		Date ttrdate = teamtodo.getTtrdate();
		int tno = teamtodo.getTno();
		return "forward:../team/myTeamDetailView.do?ttrdate="+ttrdate+"&tno="+tno;
	}
	
	//deleteTeamTodo
	@RequestMapping(value = "delete", method = RequestMethod.GET) 
	public String deleteTeamTodo(int tno, int ttno, Date ttrdate, Model model) { 
		model.addAttribute("teamTodoDeleteResult", teamTodoService.deleteTeamTodo(ttno));
		return "forward:../team/myTeamDetailView.do?ttrdate="+ttrdate+"&tno="+tno; 
	 }
	
	//teamTodoModify
	@RequestMapping(value = "modifyView", method = RequestMethod.GET) 
	public String modifyTeamTodo(int tno, int ttno, Model model) {
		model.addAttribute("teamTodoDetail", teamTodoService.getTeamTodo(ttno));
		model.addAttribute("teamMemberList", teamMService.teamMemberList(tno));
		return "teamtodo/teamTodoModify"; 
	}
	@RequestMapping(value = "modify", method = RequestMethod.POST) 
	public String modifyTeamTodo(TeamTodo teamtodo, Date ttrdate, int tno, String tdcontent) { 
		teamTodoService.modifyTeamTodo(teamtodo);
		return "forward:../team/myTeamDetailView.do?ttrdate="+ttrdate+"&tno="+tno;
	}
	
	//teamTodoCheck
	@RequestMapping(value = "teamTodoCheck", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String teamTodoCheck(TeamTodo teamtodo, int tno, int ttno, Date ttrdate, int ttcheck) { 
		teamTodoService.checkTeamTodo(teamtodo); 
		return "forward:../team/myTeamDetailView.do?ttrdate="+ttrdate+"&tno="+tno; 
	}
	
}
