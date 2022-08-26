package com.project.mylog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.DiaryReply;
import com.project.mylog.service.DiaryReplyService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping("diaryReply")
public class DiaryReplyController {
		
	@Autowired
	DiaryReplyService drService;
	
	@RequestMapping( value = "replyList", method = {RequestMethod.GET, RequestMethod.POST})
	public String replyList(int dnum, String returnInt, String rPageNum, Model model) {
		model.addAttribute("diaryReplyList", drService.replyList(dnum, rPageNum));
		model.addAttribute("rPaging", new Paging(drService.replyCnt(dnum), rPageNum, 15, 5));
		if(returnInt != null) {
			return "diary/listContent";
		}
		return "diary/myListContent";
	}
	
	@RequestMapping( value = "write", method = RequestMethod.POST)
	public String replyWrite(DiaryReply diaryReply, String returnInt, HttpSession session, HttpServletRequest request) {
		drService.replyWrite(diaryReply, session, request);
		return "forward:../diary/content.do?returnInt="+returnInt;
	}
	
	@RequestMapping( value = "modify", method = RequestMethod.GET)
	public String modifyForm(int drnum, Model model) {
		model.addAttribute("reply", drService.getReply(drnum));
		return "diaryReply/modify";
	}
	
	@RequestMapping( value = "modify", method = RequestMethod.POST)
	public String modify(DiaryReply diaryReply, String returnInt, HttpServletRequest request) {
		drService.replyModify(diaryReply, request);
		return "forward:../diary/content.do";
	}
	
	@RequestMapping( value = "reply", method = RequestMethod.GET)
	public String replyForm() {
		return "diaryReply/reply";
	}
	
	@RequestMapping( value = "reply", method = RequestMethod.POST)
	public String reply(DiaryReply diaryReply, HttpSession session, HttpServletRequest request) {
		drService.replyReplyWrite(diaryReply, session, request);
		return "forward:../diary/content.do";
	}
	
	@RequestMapping( value = "delete", method = RequestMethod.GET)
	public String delete(int drnum, int dnum, String returnInt) {
		drService.replyDelete(drnum);
		return "forward:../diary/content.do?dnum="+dnum+"&returnInt="+returnInt;
	}
	
}
