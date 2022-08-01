package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.ReviewReplyBoard;

@Mapper
public interface ReviewReplyBoardDao {

	public int ReviewReplyWrite(ReviewReplyBoard replyBoard);

	public int ReviewReplyModify(ReviewReplyBoard replyBoard);

	public int ReviewReplyDelete(ReviewReplyBoard replyBoard);

	public List<ReviewReplyBoard> ReviewReplyList();

	public ReviewReplyBoard ReviewReplyContent(int rpnum);

	public int ReviewReplyCount();

	public void ReviewReplyStepA(ReviewReplyBoard replyBoard);

	public int ReviewReplyComment(ReviewReplyBoard replyBoard);
}
