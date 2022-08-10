package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.NoticeBoard;

@Mapper
public interface NoticeBoardDao {

	public List<NoticeBoard> noticeList(NoticeBoard noticeBoard);
	
	public int noticeWrite(NoticeBoard noticeBoard);
	
	public int noticeUpdate(NoticeBoard noticeBoard);
	
	public int noticeDelete(int nno);
	
	public NoticeBoard getNotice(int nno);
	
	public NoticeBoard noticeContent(int nno);
	
	public void hitupNotice(int nno);
	
	public int countNotice();
}
