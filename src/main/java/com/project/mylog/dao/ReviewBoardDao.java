package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.ReviewBoard;

@Mapper
public interface ReviewBoardDao {
	public int reviewWrite(ReviewBoard reviewBoard);

	public int reviewModify(ReviewBoard reviewBoard);

	public int reviewDelete(int rnum);

	public List<ReviewBoard> reviewList(ReviewBoard reviewBoard);

	public ReviewBoard reviewContent(int rnum);

	public void reviewHitUp();

	public int reviewCount(ReviewBoard reviewBoard);
	
	public int getRnum();

	public List<ReviewBoard> rSearchList(ReviewBoard reviewBoard);
	
	public List<ReviewBoard> myReview(ReviewBoard reviewBoard);
	
	public int myReviewCnt(ReviewBoard reviewBoard);
	
	
}
