package com.project.mylog.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.NoticeBoard;
import com.project.mylog.service.NoticeBoardService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping("notice")
public class NoticeController {

	@Autowired
	private NoticeBoardService noticeboardService;
	
	@RequestMapping(value="list", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeList(String pageNum, Model model) {
		Paging paging = new Paging(noticeboardService.countNotice(), pageNum);
		model.addAttribute("paging", paging);
		model.addAttribute("notices", noticeboardService.noticeList(pageNum));
		return "noticeBoard/list";
	}
	
	@RequestMapping(value="content", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeContent(int nno, String pageNum, Model model) {
		model.addAttribute("notice", noticeboardService.noticeContent(nno));
		return "noticeBoard/content";
	}
	
	@RequestMapping(value="updateView", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeUpdateView(String pageNum, int nno, Model model) {
		model.addAttribute("notice", noticeboardService.getNotice(nno));
		return "noticeBoard/update";
	}
	
	@RequestMapping(value="update", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeUpdate(NoticeBoard noticeBoard, HttpServletRequest request, Model model) {
		model.addAttribute("updateResult", noticeboardService.noticeUpdate(request, noticeBoard));
		model.addAttribute("notice", noticeboardService.getNotice(noticeBoard.getNno()));
		return "forward:content.do";
	}
	
	@RequestMapping(value="writeView", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeWriteView() {
		return "noticeBoard/write";
	}
	
	@RequestMapping(value="write", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeWrite(NoticeBoard noticeBoard, HttpServletRequest request, Model model) {
		model.addAttribute("writeResult", noticeboardService.noticeWrite(request, noticeBoard));
		return "forward:list.do";
	}
	
	@RequestMapping(value="delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeDelete(int nno, Model model) {
		model.addAttribute("deleteResult", noticeboardService.noticeDelete(nno));
		return "forward:list.do";
	}
}
