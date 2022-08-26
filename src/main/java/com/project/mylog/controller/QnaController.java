package com.project.mylog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.QnaBoard;
import com.project.mylog.service.QnaBoardService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping("qna")
public class QnaController {

	@Autowired
	private QnaBoardService qnaboardService;
	
	@RequestMapping(value="list", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnaList(String pageNum, Model model) {
		Paging paging = new Paging(qnaboardService.countQna(), pageNum);
		model.addAttribute("paging", paging);
		model.addAttribute("qnas", qnaboardService.qnaList(pageNum));
		return "qnaBoard/list";
	}
	
	@RequestMapping(value="content", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnaContent(int qno, String pageNum, Model model) {
		model.addAttribute("qna", qnaboardService.qnaContent(qno));
		return "qnaBoard/content";
	}
	
	@RequestMapping(value="replyView", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnaReplyView(int qno, String pageNum, Model model) {
		model.addAttribute("qna", qnaboardService.getQna(qno));
		return "qnaBoard/reply";
	}
	
	@RequestMapping(value="reply", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnaReply(QnaBoard qnaBoard, String pageNum, HttpServletRequest request, Model model) {
		model.addAttribute("replyResult", qnaboardService.qnaReply(request, qnaBoard));
		return "forward:list.do";
	}
	
	@RequestMapping(value="updateView", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnaUpdateView(int qno, String pageNum, Model model) {
		model.addAttribute("qna", qnaboardService.getQna(qno));
		return "qnaBoard/update";
	}
	
	@RequestMapping(value="update", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnaUpdate(QnaBoard qnaBoard, String pageNum, HttpServletRequest request, Model model) {
		model.addAttribute("updateResult", qnaboardService.qnaUpdate(request, qnaBoard));
		return "forward:content.do";
	}
	
	@RequestMapping(value="writeView", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnawriteView() {
		return "qnaBoard/write";
	}
	
	@RequestMapping(value="write", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnawrite(QnaBoard qnaBoard, String pageNum, HttpServletRequest request, Model model) {
		model.addAttribute("writeResult", qnaboardService.qnaWrite(request, qnaBoard));
		return "forward:list.do";
	}
	
	@RequestMapping(value="delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnaDelete(int qno, String pageNum, Model model) {
		model.addAttribute("deleteResult", qnaboardService.qnaDelete(qno));
		return "forward:list.do";
	}
	
	@RequestMapping(value="myList", method = {RequestMethod.GET, RequestMethod.POST})
	public String myList(HttpSession session, String pageNum, Model model) {
		Paging paging = new Paging(qnaboardService.countMyQna(session), pageNum);
		model.addAttribute("paging", paging);
		model.addAttribute("qnas", qnaboardService.myQnaList(session, pageNum));
		return "qnaBoard/myQnaList";
	}
	
	@RequestMapping(value="myContent", method = {RequestMethod.GET, RequestMethod.POST})
	public String myContent(HttpSession session, int qno, String pageNum, Model model) {
		model.addAttribute("qna", qnaboardService.qnaContent(qno));
		return "qnaBoard/myContent";
	}
}
