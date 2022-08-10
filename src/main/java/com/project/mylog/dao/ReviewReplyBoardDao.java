package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.ReviewBoard;
import com.project.mylog.model.ReviewReplyBoard;

@Mapper
public interface ReviewReplyBoardDao {

	public int reviewReplyWrite(ReviewReplyBoard replyBoard);

	public int reviewReplyModify(ReviewReplyBoard replyBoard);

	public int reviewReplyDelete(int rpnum);

	public List<ReviewReplyBoard> reviewReplyList(ReviewReplyBoard replyBoard);

	public ReviewReplyBoard reviewReplyContent(int rpnum);

	public int reviewReplyCount(int rnum);

	public int reviewReplyComment(ReviewReplyBoard replyBoard);
	
	public String replyMname(int rpnum);
}
