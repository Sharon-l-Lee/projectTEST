package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.QnaBoardDao;
import com.project.mylog.model.Member;
import com.project.mylog.model.QnaBoard;
import com.project.mylog.util.Paging;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {

	@Autowired
	private QnaBoardDao qnaboardDao;
	
	@Override
	public List<QnaBoard> qnaList(String pageNum) {
		Paging paging = new Paging(countQna(), pageNum);
		QnaBoard qnaBoard = new QnaBoard();
		qnaBoard.setStartRow(paging.getStartRow());
		qnaBoard.setEndRow(paging.getEndRow());
		return qnaboardDao.qnaList(qnaBoard);
	}

	@Override
	public QnaBoard qnaContent(int qno) {
		hitupQna(qno);
		return qnaboardDao.qnaContent(qno);
	}

	@Override
	public int countQna() {
		return qnaboardDao.countQna();
	}

	@Override
	public int qnaWrite(HttpServletRequest request, QnaBoard qnaBoard) {
		qnaBoard.setQip(request.getRemoteAddr());
		return qnaboardDao.qnaWrite(qnaBoard);
	}

	@Override
	public int qnaReply(HttpServletRequest request, QnaBoard qnaBoard) {
		beforestepA(qnaBoard);
		qnaBoard.setQip(request.getRemoteAddr());
		return qnaboardDao.qnaReply(qnaBoard);
	}

	@Override
	public int qnaUpdate(HttpServletRequest request, QnaBoard qnaBoard) {
		qnaBoard.setQip(request.getRemoteAddr());
		return qnaboardDao.qnaUpdate(qnaBoard);
	}

	@Override
	public void hitupQna(int qno) {
		qnaboardDao.hitupQna(qno);
	}

	@Override
	public void beforestepA(QnaBoard qnaBoard) {
		qnaboardDao.beforestepA(qnaBoard);
	}

	@Override
	public int qnaDelete(int qno) {
		return qnaboardDao.qnaDelete(qno);
	}

	@Override
	public QnaBoard getQna(int qno) {
		return qnaboardDao.getQna(qno);
	}

	@Override
	public List<QnaBoard> myQnaList(HttpSession session, String pageNum) {
		Paging paging = new Paging(countQna(), pageNum);
		QnaBoard qnaBoard = new QnaBoard();
		qnaBoard.setStartRow(paging.getStartRow());
		qnaBoard.setEndRow(paging.getEndRow());
		
		Member member = (Member) session.getAttribute("member");
		qnaBoard.setMid(member.getMid());
		
		return qnaboardDao.myQnaList(qnaBoard);
	}

	@Override
	public int countMyQna(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		String mid = member.getMid();
		return qnaboardDao.countMyQna(mid);
	}

}
