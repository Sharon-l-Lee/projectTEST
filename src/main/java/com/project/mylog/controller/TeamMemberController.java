package com.project.mylog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.Member;
import com.project.mylog.model.Team;
import com.project.mylog.model.TeamMember;
import com.project.mylog.service.TeamMemberService;
import com.project.mylog.service.TeamService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping(value = "teammember")
public class TeamMemberController {

	@Autowired
	private TeamMemberService teamMservice;
	
	@Autowired
	private TeamService teamService;

	//myTeamList
	@RequestMapping(value = "myteamList", method = {RequestMethod.GET, RequestMethod.POST})
	public String myTeamList(String mid, HttpSession session, Model model) {
		model.addAttribute("myteamList", teamMservice.myTeamList(session));
		//myTeamList
		model.addAttribute("myapplyteamList", teamMservice.myApplyTeamList(session));
		return "teammember/myteamList";
	}
	
	//applyTeamMember
	@RequestMapping(value = "applyTeamMember", method = RequestMethod.GET)
	public String applyTeamMember(int tno, HttpSession session, Model model) {
		model.addAttribute("applyTeamMemberResult", teamMservice.applyTeamMember(session, tno));
		return "forward:myteamList.do";
	}
	
	//deleteApplyTeam(조장도 인위적으로 가능)
	@RequestMapping(value = "deleteApplyTeam", method = RequestMethod.GET)
	public String deleteApplyTeam(@ModelAttribute("teammember") TeamMember teammember, Model model) {
		model.addAttribute("deleteApplyTeamResult", teamMservice.deleteApplyTeam(teammember));
		return "forward:myteamList.do";
	}
	@RequestMapping(value = "deleteApplyTeam_TL", method = RequestMethod.GET)
	public String deleteApplyTeam_TL(@ModelAttribute("teammember") TeamMember teammember, Model model) {
		model.addAttribute("deleteApplyTeamResult", teamMservice.deleteApplyTeam(teammember));
		return "forward:teamApplyList.do";
	}
	
	//permitApplyTeam
	@RequestMapping(value = "permitApplyTeam", method = RequestMethod.GET)
	public String permitApplyTeam(@ModelAttribute("teammember") TeamMember teammember, Model model) {
		model.addAttribute("permitApplyTeamResult", teamMservice.permitApplyTeam(teammember));
		return "forward:teamApplyList.do";
	}
	
	//join
	@RequestMapping(value = "firstJoin", method = {RequestMethod.GET, RequestMethod.POST})
	public String firstJoinTeamMember(HttpSession session, Model model) {
		int tno = teamService.getTno();
		model.addAttribute("jointeamResult", teamMservice.joinTeamMember(session, tno));
		return "forward:myteamList.do";
	}
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinTeamMember(int tno, HttpSession session, Model model) {
		model.addAttribute("jointeam", teamMservice.joinTeamMember(session, tno));
		return "teammember/myteamList";
	}
	
	//teamApplyList(조장만 확인가능)
	@RequestMapping(value = "teamApplyList", method = RequestMethod.GET)
	public String teamApplyList(int tno, Model model) {
		model.addAttribute("teamDetail", teamService.getTeamDetail(tno));
		model.addAttribute("teamApplyList", teamMservice.teamApplyList(tno));
		return "teammember/teamApplyList";
	}
	
	//drawalTeamMember(팀 탈퇴)
	@RequestMapping(value = "drawalTeamMember", method = {RequestMethod.GET, RequestMethod.POST})
	public String drawalTeamMember(@ModelAttribute("teammember") TeamMember teammember, Model model) {
		int result = teamMservice.drawalTeamMember(teammember);
		model.addAttribute("drawalTeamMemberResult", result);
		return "forward:../team/myTeamDetailView.do";
	}
	
	//teamMemberList
	
	//teamMemberTotCnt
	
	
	
}
