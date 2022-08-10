package com.project.mylog.service;

import java.util.List;

import com.project.mylog.model.ReviewReplyBoard;

public interface ReveiwReplyBoardService {
	
	public int reviewReplyWrite(ReviewReplyBoard replyBoard);

	public int reviewReplyModify(ReviewReplyBoard replyBoard);

	public int reviewReplyDelete(int rpnum);

	public List<ReviewReplyBoard> reviewReplyList(int rnum, String repageNum);

	public ReviewReplyBoard reviewReplyContent(int rpnum);

	public int reviewReplyCount(int rnum);

	public int reviewReplyComment(ReviewReplyBoard replyBoard);
	
	public String replyMname(int rpnum);

}
