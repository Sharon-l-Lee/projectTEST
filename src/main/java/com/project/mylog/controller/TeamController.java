package com.project.mylog.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.Team;
import com.project.mylog.model.TeamMember;
import com.project.mylog.model.TeamTodo;
import com.project.mylog.service.TeamMemberService;
import com.project.mylog.service.TeamService;
import com.project.mylog.service.TeamTodoService;
import com.project.mylog.util.CalendarPrinter;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping(value = "team")
public class TeamController {

	@Autowired
	private TeamService teamService;

	@Autowired
	private TeamMemberService teamMservice;

	@Autowired
	private TeamTodoService teamTodoService;

	// makeTeam
	@RequestMapping(value = "makeTeamView", method = RequestMethod.GET)
	public String makeTeamView() {
		return "team/makeTeamView";
	}

	@RequestMapping(value = "makeTeam", method = RequestMethod.POST)
	public String makeTeam(@ModelAttribute("team") Team team, Model model) {
		model.addAttribute("makeTeamResult", teamService.makeTeam(team));
		return "forward:../teammember/firstJoin.do";
	}

	// teamDetail
	@RequestMapping(value = "teamDetailView", method = RequestMethod.GET)
	public String teamDetailView(int tno, String mid, TeamMember teammember, Model model) {
		teammember.setMid(mid);
		teammember.setTno(tno);
		model.addAttribute("teamDetail", teamService.getTeamDetail(tno));
		model.addAttribute("teamMemberTotCnt", teamMservice.teamMemberTotCnt(tno));
		model.addAttribute("tMemberDetail", teamMservice.getTeamMemberDetail(teammember));
		model.addAttribute("teamMemberList", teamMservice.teamMemberList(tno));
		return "team/teamDetailView";
	}

	// teamList
	@RequestMapping(value = "list", method = { RequestMethod.GET, RequestMethod.POST })
	public String teamList(String pageNum, Team team, Model model) {
		model.addAttribute("teamList", teamService.teamList(pageNum, team));
		int teamTotCnt = teamService.teamTotCnt();
		model.addAttribute("paging", new Paging(teamTotCnt, pageNum, 12, 5));
		return "team/list";
	}

	// teamCalendar
	@RequestMapping(value = "myTeamDetailView", method = { RequestMethod.GET, RequestMethod.POST })
	public String calendar(int tno, TeamTodo teamtodo, String year, String month, String day, Date ttrdate,
			Model model) {
		// teamDetail
		model.addAttribute("teamDetail", teamService.getTeamDetail(tno));
		model.addAttribute("teamMemberTotCnt", teamMservice.teamMemberTotCnt(tno));

		// teamTodoList_현재 날짜 설정
		teamtodo.setTno(tno);

		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formatedNow = now.format(formatter);
		if (ttrdate == null) {
			// teamTodoList
			ttrdate = Date.valueOf(formatedNow);
			teamtodo.setTtrdate(ttrdate);
		}

		// calendar
		int yearInt;
		int monthInt;
		if (year == null && month == null) {
			Calendar cal = Calendar.getInstance();
			yearInt = cal.get(Calendar.YEAR);
			monthInt = cal.get(Calendar.MONTH) + 1;
			year = String.valueOf(year);
			month = monthInt < 10 ? "0" + month : String.valueOf(monthInt);

		} else {
			yearInt = Integer.parseInt(year);
			monthInt = Integer.parseInt(month);
			month = monthInt < 10 ? "0" + month : String.valueOf(monthInt);
			if(day==null) {
				day="1";
			}
			int dayInt = Integer.parseInt(day);

			ttrdate = new Date(yearInt - 1900, monthInt - 1, dayInt);
			teamtodo.setTtrdate(ttrdate);
		}

		CalendarPrinter calPrint = new CalendarPrinter(yearInt, monthInt);

		model.addAttribute("calPrint", calPrint);
		model.addAttribute("year", yearInt);
		model.addAttribute("month", monthInt);

		model.addAttribute("teamTodoList", teamTodoService.teamTodoList(teamtodo));
		model.addAttribute("ttrdate", ttrdate);
		return "team/myTeamDetailView";
	}

	// myTeamModifyView
	@RequestMapping(value = "myTeamModifyView", method = { RequestMethod.GET, RequestMethod.POST })
	public String myteamModifyView(int tno, Model model) {
		Team team = teamService.getTeamDetail(tno);
		model.addAttribute("teamDetail", teamService.getTeamDetail(tno));
		model.addAttribute("teamMemberList", teamMservice.teamMemberList(tno));
		return "team/myTeamModifyView";
	}

	@RequestMapping(value = "myTeamModify", method = RequestMethod.POST)
	public String myteamModify(Team team, Model model) {
		model.addAttribute("myTeamModifyResult", teamService.modifyTeam(team));
		return "forward:myTeamDetailView.do";
	}

	// teamDelete
	@RequestMapping(value = "teamDelete", method = { RequestMethod.GET, RequestMethod.POST })
	public String teamDelete(int tno, Model model) {
		// 팀투두리스트 삭제
		model.addAttribute("teamTodoListDeleteResult", teamTodoService.deleteTeamTodoList(tno));
		// 팀멤버 탈퇴
		model.addAttribute("deleteTeamMemberResult", teamMservice.deleteTeamMember(tno));
		// 팀삭제
		model.addAttribute("teamDeleteResult", teamService.deleteTeam(tno));
		return "forward:../teammember/myteamList.do";
	}

}
