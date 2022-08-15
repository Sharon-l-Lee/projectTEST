package com.project.mylog.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.dao.HashtagDao;
import com.project.mylog.model.BoardTag;
import com.project.mylog.model.ReviewBoard;
import com.project.mylog.model.ReviewReplyBoard;
import com.project.mylog.service.BoardTagService;
import com.project.mylog.service.HashtagService;
import com.project.mylog.service.ReveiwReplyBoardService;
import com.project.mylog.service.ReviewBoardService;
import com.project.mylog.util.Paging;
import com.project.mylog.util.ReplyPaging;
import com.project.mylog.util.ReviewPaging;

@Controller
@RequestMapping(value="review")
public class ReviewController {
	
	@Autowired
	private ReviewBoardService rboardservice;
	@Autowired
	private ReveiwReplyBoardService replyservice;
	@Autowired
	private BoardTagService btagservice;
	@Autowired
	private HashtagService hashtagservice;
	
	
	@RequestMapping(value="list", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewList(String pageNum, Model model,ReviewBoard reviewBoard, HttpSession session) {
		System.out.println(7);
		System.out.println(8);
		model.addAttribute("reviewList", rboardservice.reviewList(session, pageNum, reviewBoard));
		System.out.println(9);
		model.addAttribute("reviewPaging",new ReviewPaging(rboardservice.reviewCount(session, reviewBoard),pageNum));
		
		return "review/list";
		
	}
	
	@RequestMapping(value="myReview", method= RequestMethod.GET)
	public String myReview(String pageNum, Model model,ReviewBoard reviewBoard, HttpSession session) {
		
		model.addAttribute("reviewList", rboardservice.myReview(session, reviewBoard, pageNum));
		model.addAttribute("reviewPaging",new ReviewPaging(rboardservice.myReviewCnt(session, reviewBoard),pageNum));
		return "review/list";
		
	}
	
	
	
//	@RequestMapping(value="search", method={RequestMethod.GET, RequestMethod.POST})
//	public String reviewDelete(String rtitle, String pageNum, Model model) {
//			model.addAttribute("searchList", rboardservice.rSearchList(pageNum, rtitle));
//			model.addAttribute("reviewPaging",new ReviewPaging(rboardservice.reviewCount(rtitle), pageNum));
//		return "review/tagsearch";
//		
//	}
	
	@RequestMapping(value="content", method={RequestMethod.GET, RequestMethod.POST})
	public String reviewContent(int rnum, Model model, String pageNum, String repageNum) {
		//model.addAttribute("replylist", replyservice.reviewReplyContent(rnum)); 
		model.addAttribute("tags", btagservice.tagNameGet(rnum));
		model.addAttribute("replylist", replyservice.reviewReplyList(rnum, repageNum));
		model.addAttribute("repaging", new ReplyPaging(replyservice.reviewReplyCount(rnum), repageNum));
		model.addAttribute("rnum", rnum);
		model.addAttribute("reviewContent", rboardservice.reviewContent(rnum));
		

		
		return "review/content";
		
	}
	
	@RequestMapping(value="write", method= RequestMethod.GET)
	public String reviewWrite() {
	
		return "review/write";
		
	}
	
	@RequestMapping(value="write", method= RequestMethod.POST)
	public String reviewWrite(HttpSession session, HttpServletRequest request,MultipartHttpServletRequest mRequest, BoardTag boardtag, ReviewBoard reviewBoard, Model model, String hname) {
		model.addAttribute("reviewWrite", rboardservice.reviewWrite(session, request, mRequest, reviewBoard));
		btagservice.BoardTagConnect(boardtag, hname);
		return "forward:list.do";
		
	}
	
	
	
	@RequestMapping(value="modify", method= RequestMethod.GET)
	public String reviewModify(int rnum, Model model, String pageNum) {
		
		model.addAttribute("modifyView", rboardservice.reviewContent(rnum));
		return "review/modify";
		
	}
	@RequestMapping(value="modify", method= RequestMethod.POST)
	public String reviewModify(HttpServletRequest request,MultipartHttpServletRequest mRequest,  @ModelAttribute("reviewBoard")ReviewBoard reviewBoard, Model model) {
		
		System.out.println(1);
		model.addAttribute("reviewModify", rboardservice.reviewModify(mRequest, reviewBoard, request));
		System.out.println(2);
		return "forward:list.do";
		
	}
	
	@RequestMapping(value="delete", method= RequestMethod.GET)
	public String reviewDelete(int rnum, Model model) {
		
		model.addAttribute("delete", rboardservice.reviewDelete(rnum));
		return "forward:list.do";
		
	}
	


	
//	@RequestMapping(value="replylist", method= {RequestMethod.GET,RequestMethod.POST})
//	public String reviewReplyList(String pageNum, Model model, int rnum) {
//		
//		model.addAttribute("rnum", rnum);
//		model.addAttribute("replylist", replyservice.reviewReplyList(rnum, pageNum));
//		model.addAttribute("replyPaging", new Paging(replyservice.reviewReplyCount(), pageNum));
//		return "forward:content.do";
//	}
//	
	//�뙎湲�
	
	
	
	

}
