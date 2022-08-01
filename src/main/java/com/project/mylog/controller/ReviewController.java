package com.project.mylog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.ReviewBoard;
import com.project.mylog.service.ReviewBoardService;
import com.project.mylog.util.ReviewPaging;

@Controller
@RequestMapping(value="reviewboard")
public class ReviewController {
	
	@Autowired
	private ReviewBoardService rboardservice;
	
	@RequestMapping(value="reviewList", method=RequestMethod.GET)
	public String reviewList(String pageNum, Model model) {
		model.addAttribute("reviewList", rboardservice.reviewList(pageNum));
		model.addAttribute("reviewPaging",new ReviewPaging(rboardservice.reviewCount(), pageNum));
		
		return "reviewboard/reviewList";
		
	}
	
	@RequestMapping(value="reviewContent", method=RequestMethod.GET)
	public String reviewContent(int rnum, Model model) {
		
		model.addAttribute("rnum", rnum);
		model.addAttribute("reviewContent", rboardservice.reviewContent(rnum));
		
		return "reviewboard/reviewContent";
		
	}
	
	@RequestMapping(value="reviewWrite", method= RequestMethod.GET)
	public String reviewWriteView() {
	
		return "reviewboard/reviewWrite";
		
	}
	@RequestMapping(value="reviewWrite", method= RequestMethod.POST)
	public String reviewWrite(MultipartHttpServletRequest mRequest, ReviewBoard reviewboard, Model model) {
		model.addAttribute("reviewWrite", rboardservice.reviewWrite(mRequest, reviewboard));
		return "forward:reviewList.do";
		
	}
}
