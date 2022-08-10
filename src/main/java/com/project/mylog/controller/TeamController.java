package com.project.mylog.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.Team;
import com.project.mylog.service.TeamMemberService;
import com.project.mylog.service.TeamService;

@Controller
@RequestMapping(value = "team")
public class TeamController {

	@Autowired
	private TeamService teamService;
	
	@Autowired
	private TeamMemberService teamMservice;
	
	//makeTeam
	@RequestMapping(value = "makeTeamView", method = RequestMethod.GET)
	public String makeTeamView() {
		return "team/makeTeamView";
	}
	@RequestMapping(value = "makeTeam", method = RequestMethod.POST)
	public String makeTeam(@ModelAttribute("team") Team team, Model model) {
		model.addAttribute("makeTeamResult", teamService.makeTeam(team));
		return "forward:../teammember/firstJoin.do";
	}
	//teamDetail
	@RequestMapping(value = "teamDetailView", method = RequestMethod.GET)
	public String teamDetailView(int tno, Model model) {
		model.addAttribute("teamDetail", teamService.getTeamDetail(tno));
		System.out.println("디테일 : "+teamService.getTeamDetail(tno));
		model.addAttribute("teamMemberTotCnt", teamMservice.teamMemberTotCnt(tno));
		System.out.println("명수 : "+teamMservice.teamMemberTotCnt(tno));
		model.addAttribute("teamMemberList", teamMservice.teamMemberList(tno));
		System.out.println("그룹원 : "+teamMservice.teamMemberList(tno));
		return "team/teamDetailView";
	}
}
