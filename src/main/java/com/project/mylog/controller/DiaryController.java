package com.project.mylog.controller;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.DiaryBoard;
import com.project.mylog.service.DiaryBoardService;
import com.project.mylog.service.TodoService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping("diary")
public class DiaryController {
	
	@Autowired
	private DiaryBoardService dbService;
	
	@Autowired
	private TodoService todoService;
	
	@RequestMapping( value = "myList", method = {RequestMethod.GET, RequestMethod.POST})
	public String myList(Date ddate, HttpSession session, String pageNum, Model model) {
		Date before = new Date(ddate.getTime() - (1000 * 60 * 60 * 24));
		Date after = new Date(ddate.getTime() + (1000 * 60 * 60 * 24));
		
		model.addAttribute("diaryList", dbService.myDiaryList(session, ddate, pageNum));
		model.addAttribute("paging", new Paging(dbService.myDiaryCnt(session, ddate), pageNum, 5, 5));
		model.addAttribute("todoList", todoService.todoList(session, ddate));
		model.addAttribute("nowDate", ddate);
		model.addAttribute("before", before);
		model.addAttribute("after", after);
		return "diary/myList";
	}
	
	@RequestMapping( value = "diaryList", method = {RequestMethod.GET, RequestMethod.POST})
	public String diaryList(HttpSession session, String pageNum, Model model) {
		model.addAttribute("diaryList", dbService.diaryList(session, pageNum));
		model.addAttribute("paging", new Paging(dbService.diaryCnt(session), pageNum, 8, 5));
		return "diary/diaryList";
	}
	
	
	@RequestMapping( value = "content", method = {RequestMethod.GET, RequestMethod.POST})
	public String content(int dnum, HttpSession session, Model model) {
		DiaryBoard diaryboard = dbService.diaryContent(dnum);
		if(diaryboard.getDtodoin() == 1) {
			model.addAttribute("todoList", todoService.todoList(session, diaryboard.getDdate()));
		}
		model.addAttribute("diary", diaryboard);
		return "forward:../diaryReply/replyList.do";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeView(String mid, Date ddate, Model model) {
		return "diary/write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(DiaryBoard diaryBoard, HttpSession session, MultipartHttpServletRequest mRequest, Model model) {
		dbService.diaryWrite(session, mRequest, diaryBoard);
		return "forward:myList.do";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyView(int dnum, Model model) {
		model.addAttribute("diary", dbService.getDiary(dnum));
		return "diary/modify";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(DiaryBoard diaryBoard, MultipartHttpServletRequest mRequest, Model model) {
		dbService.diaryModify(mRequest, diaryBoard);
		return "forward:content.do?dnum="+diaryBoard.getDnum();
	}
	
	@RequestMapping(value = "delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(int dnum) {
		dbService.diaryDelete(dnum);
		return "forward:myList.do";
	}
}
