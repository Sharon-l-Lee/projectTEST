package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.mylog.model.NoticeBoard;

public interface NoticeBoardService {

	public List<NoticeBoard> noticeList(String pageNum);
	
	public int noticeWrite(HttpServletRequest request, NoticeBoard noticeBoard);
	
	public int noticeUpdate(HttpServletRequest request, NoticeBoard noticeBoard);
	
	public int noticeDelete(int nno);
	
	public NoticeBoard getNotice(int nno);
	
	public NoticeBoard noticeContent(int nno);
	
	public void hitupNotice(int nno);
	
	public int countNotice();
}
