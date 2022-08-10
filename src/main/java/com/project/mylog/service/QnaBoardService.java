package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.project.mylog.model.QnaBoard;

public interface QnaBoardService {

	public List<QnaBoard> qnaList(String pageNum);
	
	public List<QnaBoard> myQnaList(HttpSession session, String pageNum);
	
	public QnaBoard qnaContent(int qno);
	
	public int countQna();
	
	public int countMyQna(HttpSession session);
	
	public int qnaWrite(HttpServletRequest request, QnaBoard qnaBoard);
	
	public int qnaReply(HttpServletRequest request, QnaBoard qnaBoard);
	
	public int qnaUpdate(HttpServletRequest request, QnaBoard qnaBoard);
	
	public void hitupQna(int qno);
	
	public void beforestepA(QnaBoard qnaBoard);
	
	public int qnaDelete(int qno);
	
	public QnaBoard getQna(int qno);

}
