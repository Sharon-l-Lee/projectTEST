package com.project.mylog.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.ReviewBoard;

public interface ReviewBoardService {
	
	public int reviewWrite(MultipartHttpServletRequest mRequest, ReviewBoard reviewBoard);

	public int reviewModify(MultipartHttpServletRequest mRequest, ReviewBoard reviewBoard);

	public int reviewDelete(int rnum);

	public List<ReviewBoard> reviewList(String pageNum);

	public ReviewBoard reviewContent(int rnum);

	public void reviewHitUp();

	public int reviewCount();

}
