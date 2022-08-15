package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.FileUp;
import com.project.mylog.model.ReviewBoard;

public interface ReviewBoardService {
	
	public int reviewWrite(HttpSession session, HttpServletRequest request, MultipartHttpServletRequest mRequest, ReviewBoard reviewBoard);

	public int reviewModify(MultipartHttpServletRequest mRequest, ReviewBoard reviewBoard, HttpServletRequest request);

	public int reviewDelete(int rnum);

	public List<ReviewBoard> reviewList(HttpSession session, String pageNum, ReviewBoard reviewBoard);

	public ReviewBoard reviewContent(int rnum);

	public void reviewHitUp();

	public int reviewCount(HttpSession session, ReviewBoard reviewBoard);
	
	public int getRnum();
	
	public List<ReviewBoard> rSearchList(String pageNum, String shname);
	
	public FileUp fileUp(FileUp fileUp, HttpServletRequest request);
	
	public List<ReviewBoard> myReview(HttpSession session, ReviewBoard reviewBoard,  String pageNum);
	
	public int myReviewCnt(HttpSession session, ReviewBoard reviewBoard);
	
	

}
