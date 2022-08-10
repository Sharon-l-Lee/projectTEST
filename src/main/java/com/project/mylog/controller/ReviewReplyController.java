package com.project.mylog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.ReviewReplyBoard;
import com.project.mylog.service.ReveiwReplyBoardService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping(value="reply")
public class ReviewReplyController {

	@Autowired
	private ReveiwReplyBoardService replyservice;
	

	@RequestMapping(value="write", method=RequestMethod.POST)
	public String replyWrite(int rnum, Model model, ReviewReplyBoard replyBoard) {
		model.addAttribute("rnum", rnum);
		model.addAttribute("replywrite", replyservice.reviewReplyWrite(replyBoard));
		return "forward:../review/content.do";
	}
	

	@RequestMapping(value="delete", method= RequestMethod.GET)
	public String replyDelete(int rpnum, Model model, int rnum) {
		model.addAttribute("rpnum", rpnum);
		model.addAttribute("rnum", rnum);
		model.addAttribute("replyDelete", replyservice.reviewReplyDelete(rpnum));
		return "forward:../review/content.do";
	}
	

	@RequestMapping(value="modify", method= RequestMethod.GET)
	public String replyModifyView(int rpnum, Model model, ReviewReplyBoard replyBoard) {
		model.addAttribute("rpnum", rpnum);
		model.addAttribute("replymview", replyservice.reviewReplyContent(rpnum));
		
		return "review/replymodify";
	}
	
	@RequestMapping(value="modify", method= RequestMethod.POST)
	public String replyModify(Model model, ReviewReplyBoard replyBoard) {
		//model.addAttribute("rpnum", rpnum);
		model.addAttribute("replyModify", replyservice.reviewReplyModify(replyBoard));
		return "forward:content.do";
	}


	
	@RequestMapping(value="list", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewReplyList(String pageNum, Model model, int rnum) {
		
		model.addAttribute("replylist", replyservice.reviewReplyList(rnum, pageNum));
		model.addAttribute("replyPaging", new Paging(replyservice.reviewReplyCount(rnum), pageNum));
		return "forward:../review/content.do";
	}
	
	@RequestMapping(value="comment", method= RequestMethod.GET)
	public String replyCommentView(int rnum, int rpnum, Model model, ReviewReplyBoard replyBoard) {
		model.addAttribute("rpnum", rpnum);
		model.addAttribute("rnum", rnum);
		return "review/replycomment";
	}
	
	@RequestMapping(value="comment", method= RequestMethod.POST)
	public String replyComment(ReviewReplyBoard replyBoard) {
		 replyservice.reviewReplyComment(replyBoard);
		return "forward:content.do";
	}

	
	
}
