package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.ReviewReplyBoardDao;
import com.project.mylog.model.Member;
import com.project.mylog.model.ReviewReplyBoard;
import com.project.mylog.util.Paging;
import com.project.mylog.util.ReplyPaging;

@Service
public class ReviewReplyBoardServiceImpl implements ReveiwReplyBoardService {

	@Autowired
	private ReviewReplyBoardDao replyboardDao;

	@Override
	public int reviewReplyWrite(HttpSession session, HttpServletRequest request, ReviewReplyBoard replyBoard) {
		replyBoard.setMid(((Member)(session.getAttribute("member"))).getMid());
		replyBoard.setRpip(request.getRemoteAddr());
		return replyboardDao.reviewReplyWrite(replyBoard);
	}

	@Override
	public int reviewReplyModify(ReviewReplyBoard replyBoard) {
		// TODO Auto-generated method stub
		return replyboardDao.reviewReplyModify(replyBoard);
	}

	@Override
	public int reviewReplyDelete(int rpnum) {
		// TODO Auto-generated method stub
		return replyboardDao.reviewReplyDelete(rpnum);
	}

	@Override
	public List<ReviewReplyBoard> reviewReplyList(int rnum, String repageNum) {
		ReplyPaging paging = new ReplyPaging(reviewReplyCount(rnum), repageNum);
		ReviewReplyBoard replyBoard = new ReviewReplyBoard();
		replyBoard.setRnum(rnum);
		replyBoard.setStartRow(paging.getStartRow());
		replyBoard.setEndRow(paging.getEndRow());
		return replyboardDao.reviewReplyList(replyBoard);
	}

	@Override
	public ReviewReplyBoard reviewReplyContent(int rpnum) {
		// TODO Auto-generated method stub
		return replyboardDao.reviewReplyContent(rpnum);
	}

	@Override
	public int reviewReplyCount(int rnum) {
		// TODO Auto-generated method stub
		return replyboardDao.reviewReplyCount(rnum);
	}

	@Override
	public int reviewReplyComment(HttpSession session, HttpServletRequest request, ReviewReplyBoard replyBoard) {
		replyBoard.setMid(((Member)(session.getAttribute("member"))).getMid());
		replyBoard.setRpip(request.getRemoteAddr());
		ReviewReplyBoard ogreply = replyboardDao.reviewReplyContent(replyBoard.getRpnum());
		
		System.out.println("가져온 content"+replyboardDao.reviewReplyContent(replyBoard.getRpnum()));
		System.out.println("답변"+replyBoard);
		System.out.println(3);
		replyBoard.setRpgroup(ogreply.getRpgroup());
		if (ogreply.getRpindent() == 1) {
			System.out.println(4);
			replyBoard.setRpmention(ogreply.getMname());
		}
		System.out.println(5);
		System.out.println("쓴 답변"+replyBoard);
		return replyboardDao.reviewReplyComment(replyBoard);
	}

	@Override
	public String replyMname(int rpnum) {
		return replyboardDao.replyMname(rpnum);
	}

}
