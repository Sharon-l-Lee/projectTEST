package com.project.mylog.controller;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.DiaryBoard;
import com.project.mylog.service.DiaryBoardService;
import com.project.mylog.service.DiaryReplyService;
import com.project.mylog.service.TodoService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping("diary")
public class DiaryController {
	
	@Autowired
	private DiaryBoardService dbService;
	
	@Autowired
	DiaryReplyService drService;
	
	@Autowired
	private TodoService todoService;
	
	@RequestMapping( value = "myList", method = {RequestMethod.GET, RequestMethod.POST})
	public String myList(Date ddate, HttpSession session, String pageNum, String tdPageNum, Model model) {
		Date before = new Date(ddate.getTime() - (1000 * 60 * 60 * 24));
		Date after = new Date(ddate.getTime() + (1000 * 60 * 60 * 24));
		
		model.addAttribute("diaryList", dbService.myDiaryList(session, ddate, pageNum));
		model.addAttribute("paging", new Paging(dbService.myDiaryCnt(session, ddate), pageNum, 7, 5));
		model.addAttribute("todoList", todoService.todoList(session, ddate, tdPageNum));
		model.addAttribute("todoPaging", new Paging(todoService.todoCnt(session, ddate), tdPageNum, 8, 5));
		model.addAttribute("nowDate", ddate);
		model.addAttribute("before", before);
		model.addAttribute("after", after);
		return "diary/myList";
	}
	
	@RequestMapping( value = "diaryList", method = {RequestMethod.GET, RequestMethod.POST})
	public String diaryList(HttpSession session, String pageNum, Model model) {
		model.addAttribute("diaryList", dbService.diaryList(session, pageNum));
		model.addAttribute("paging", new Paging(dbService.diaryCnt(session), pageNum, 10, 10));
		return "diary/diaryList";
	}
	
	@RequestMapping( value = "content", method = {RequestMethod.GET, RequestMethod.POST})
	public String content(int dnum, String returnInt, HttpSession session, Model model) {
		DiaryBoard diaryboard = dbService.diaryContent(dnum);
		if(diaryboard.getDtodoin() == 1) {
			model.addAttribute("todoList", todoService.todoInList(session, diaryboard.getDdate()));
		}
		model.addAttribute("diary", diaryboard);
		if(diaryboard.getDstatus() == 0) {
			if(returnInt != null) {
				model.addAttribute("path", "diaryList.do");
			}else {
				model.addAttribute("path", "myList.do");
			}
			return "diary/privateContent";
		}
		return "forward:../diaryReply/replyList.do?returnInt"+returnInt;
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeView(String mid, Date ddate, Model model) {
		return "diary/write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(DiaryBoard diaryBoard, HttpSession session, HttpServletRequest request, Model model) {
		dbService.diaryWrite(session, diaryBoard, request);
		return "forward:myList.do";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyView(int dnum, String returnInt, Model model) {
		model.addAttribute("diary", dbService.getDiary(dnum));
		model.addAttribute("returnInt", returnInt);
		return "diary/modify";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(DiaryBoard diaryBoard, String returnInt, HttpServletRequest request, Model model) {
		dbService.diaryModify(diaryBoard, request);
		return "forward:content.do?dnum="+diaryBoard.getDnum()+"&returnInt="+returnInt;
	}
	
	@RequestMapping(value = "delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(int dnum, String returnInt) {
		dbService.diaryDelete(dnum);
		drService.allReplyDelete(dnum);
		if("1".equals(returnInt)) {
			return "forward:diaryList.do";
		}
		return "forward:myList.do";
	}
	
}
