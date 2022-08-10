package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.QnaBoard;

@Mapper
public interface QnaBoardDao {

	public List<QnaBoard> qnaList(QnaBoard qnaBoard);
	
	public List<QnaBoard> myQnaList(QnaBoard qnaBoard);
	
	public QnaBoard qnaContent(int qno);
	
	public int countQna();
	
	public int countMyQna(String mid);
	
	public int qnaWrite(QnaBoard qnaBoard);
	
	public int qnaReply(QnaBoard qnaBoard);
	
	public int qnaUpdate(QnaBoard qnaBoard);
	
	public void hitupQna(int qno);
	
	public void beforestepA(QnaBoard qnaBoard);
	
	public int qnaDelete(int qno);
	
	public QnaBoard getQna(int qno);
	
	
}
