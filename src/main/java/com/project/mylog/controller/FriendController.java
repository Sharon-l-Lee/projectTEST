package com.project.mylog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.service.AlertService;
import com.project.mylog.service.FriendService;
import com.project.mylog.util.Append;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping("friend")
public class FriendController {

	@Autowired
	private FriendService friendService;
	
	@Autowired
	private AlertService alertService;
	
	@RequestMapping(value="list", method = {RequestMethod.GET, RequestMethod.POST})
	public String friendList(HttpSession session, String pageNum, Model model) {
		Append append = new Append(alertService.countMyAlert(session), pageNum);
		model.addAttribute("append", append);
		model.addAttribute("alerts", alertService.myAlertList(pageNum, session));
		model.addAttribute("friends", friendService.myFriendList(session));
		model.addAttribute("follows", friendService.followMe(session));
		model.addAttribute("alertNum", alertService.countNotRead(session));
		return "friend/list";
	}
	
	@RequestMapping(value="search", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchMyFriend(HttpSession session, String mname, Model model) {
		Paging paging = new Paging(friendService.countMyFriend(session), "1");
		model.addAttribute("paging", paging);
		model.addAttribute("friends", friendService.searchMyFriend(session, mname));
		return "friend/listResult";
	}
	
	@RequestMapping(value="findView", method = {RequestMethod.GET, RequestMethod.POST})
	public String findView() {
		return "friend/find";
	}
	
	@RequestMapping(value="findResult", method = {RequestMethod.GET, RequestMethod.POST})
	public String findResult() {
		return "friend/findResult";
	}
	
	@RequestMapping(value="follow", method = {RequestMethod.GET, RequestMethod.POST})
	public String follow(HttpSession session, String fid, String alcode, Model model) {
		model.addAttribute("alertResult", alertService.makeAlert(session, fid, Integer.parseInt(alcode)));
		model.addAttribute("followResult", friendService.followFriend(session, fid));
		return "forward:list.do";
	}
	
	@RequestMapping(value="unfollow", method = {RequestMethod.GET, RequestMethod.POST})
	public String unfollow(HttpSession session, String fid, String alcode, Model model) {
		model.addAttribute("alertResult", alertService.makeAlert(session, fid, Integer.parseInt(alcode)));
		model.addAttribute("unfollowResult", friendService.unfollowFriend(session, fid));
		return "forward:list.do";
	}
}
