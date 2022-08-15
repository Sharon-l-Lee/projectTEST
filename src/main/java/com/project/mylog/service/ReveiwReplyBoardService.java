package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.project.mylog.model.ReviewReplyBoard;

public interface ReveiwReplyBoardService {
	
	public int reviewReplyWrite(HttpSession session, HttpServletRequest request,ReviewReplyBoard replyBoard);

	public int reviewReplyModify(ReviewReplyBoard replyBoard);

	public int reviewReplyDelete(int rpnum);

	public List<ReviewReplyBoard> reviewReplyList(int rnum, String repageNum);

	public ReviewReplyBoard reviewReplyContent(int rpnum);

	public int reviewReplyCount(int rnum);

	public int reviewReplyComment(HttpSession session, HttpServletRequest request,ReviewReplyBoard replyBoard);
	
	public String replyMname(int rpnum);

}
