package com.project.mylog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.service.AlertService;
import com.project.mylog.util.Append;

@Controller
@RequestMapping("alert")
public class AlertController {

	@Autowired
	private AlertService alertService;

	@RequestMapping(value = "list", method = { RequestMethod.GET, RequestMethod.POST })
	public String myAlertList(HttpSession session, String pageNum, Model model) {
		Append append = new Append(alertService.countMyAlert(session), pageNum);
		model.addAttribute("append", append);
		model.addAttribute("alerts", alertService.myAlertList(pageNum, session));
		return "alert/list";
	}

	
	@RequestMapping(value="read", method = {RequestMethod.GET,RequestMethod.POST})
	public String readAlert(HttpServletRequest request) {
		alertService.readAlert(request);
		return "forward:list.do";
	}
	
	@RequestMapping(value="append", method = {RequestMethod.GET,RequestMethod.POST})
	public String appendAlert(HttpSession session, String pageNum, Model model) {
		Append append = new Append(alertService.countMyAlert(session), pageNum);
		model.addAttribute("pageNum", append.getCurrentPage());
		model.addAttribute("alerts", alertService.myAlertList(pageNum, session));
		return "alert/appendResult";
	}
	 
}
