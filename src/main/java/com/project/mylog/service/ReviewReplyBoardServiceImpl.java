package com.project.mylog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.ReviewReplyBoardDao;
import com.project.mylog.model.ReviewReplyBoard;
import com.project.mylog.util.Paging;
import com.project.mylog.util.ReplyPaging;

@Service
public class ReviewReplyBoardServiceImpl implements ReveiwReplyBoardService {

	@Autowired
	private ReviewReplyBoardDao replyboardDao;

	@Override
	public int reviewReplyWrite(ReviewReplyBoard replyBoard) {
		System.out.println(1);
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
	public int reviewReplyComment(ReviewReplyBoard replyBoard) {
		int rpnum = replyBoard.getRpnum();
		ReviewReplyBoard ogreply = replyboardDao.reviewReplyContent(rpnum);
		replyBoard.setRpgroup(ogreply.getRpgroup());
		if (ogreply.getRpindent() == 1) {
			replyBoard.setRpmention(ogreply.getMname());
		}
		return replyboardDao.reviewReplyComment(replyBoard);
	}

	@Override
	public String replyMname(int rpnum) {
		return replyboardDao.replyMname(rpnum);
	}

}
