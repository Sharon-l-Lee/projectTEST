package com.project.mylog.controller;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.AccountBook;
import com.project.mylog.service.AccountBookService;
import com.project.mylog.service.AccountCategoryService;

@Controller
@RequestMapping("account")
public class AccountController {
	@Autowired
	private AccountBookService abService;
	
	@Autowired
	private AccountCategoryService acService;
	
	@RequestMapping(value = "list", method = {RequestMethod.GET, RequestMethod.POST})
	public String monthlyList(Date nowDate, String pageNum, HttpSession session, Model model) {
		if(nowDate == null) {
			nowDate = new Date(System.currentTimeMillis());
		}
		model.addAttribute("monthlyList", abService.monthlyAccount(nowDate, pageNum, session));
		model.addAttribute("monthTotal", abService.mothlyTotal(nowDate, session));
		model.addAttribute("mothlyCategoryTotal", abService.monthlyCategoryTotal(nowDate, session));
		
		Date before;
		Date after;
		if(nowDate.getMonth() == 0) {
			before = new Date(nowDate.getYear()-1, 11, nowDate.getDate());
		}else {
			before = new Date(nowDate.getYear(), nowDate.getMonth()-1, nowDate.getDate());
		}
		if(nowDate.getMonth() == 11) {
			after = new Date(nowDate.getYear()+1, 0, nowDate.getDate());
		}else {
			after = new Date(nowDate.getYear(), nowDate.getMonth()+1, nowDate.getDate());
		}
		model.addAttribute("before", before);
		model.addAttribute("after", after);
		model.addAttribute("nowDate", nowDate);
		return "account/list";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Date nowDate, Model model) {
		model.addAttribute("nowDate", nowDate);
		model.addAttribute("categoryList", acService.categoryList());
		return "account/write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(AccountBook accountBook, Date adate_temp, int hour, int minutes, HttpSession session) {
		long time = adate_temp.getTime()+(hour * 1000 * 60 * 60) + (minutes * 1000 * 60);
		accountBook.setAdate(new Timestamp(time));
		abService.accountWrite(accountBook, session);
		return "account/unload";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyForm(int ano, Model model) {
		model.addAttribute("account", abService.getAccount(ano));
		model.addAttribute("categoryList", acService.categoryList());
		return "account/modify";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(AccountBook accountBook, Date adate_temp, int hour, int minutes) {
		long time = adate_temp.getTime()+(hour * 1000 * 60 * 60) + (minutes * 1000 * 60);
		accountBook.setAdate(new Timestamp(time));
		abService.accountModify(accountBook);
		return "account/unload";
	}
	
	@RequestMapping(value = "delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(int ano, Date nowDate) {
		abService.accountDelete(ano);
		return "forward:list.do?nowDate="+nowDate;
	}
}
