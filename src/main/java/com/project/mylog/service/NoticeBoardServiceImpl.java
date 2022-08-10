package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.NoticeBoardDao;
import com.project.mylog.model.NoticeBoard;
import com.project.mylog.util.Paging;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Autowired
	private NoticeBoardDao noticeboardDao;
	
	@Override
	public List<NoticeBoard> noticeList(String pageNum) {
		Paging paging = new Paging(countNotice(), pageNum);
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setStartRow(paging.getStartRow());
		noticeBoard.setEndRow(paging.getEndRow());
		return noticeboardDao.noticeList(noticeBoard);
	}

	@Override
	public int noticeWrite(HttpServletRequest request, NoticeBoard noticeBoard) {
		noticeBoard.setNip(request.getRemoteAddr());
		return noticeboardDao.noticeWrite(noticeBoard);
	}

	@Override
	public int noticeUpdate(HttpServletRequest request, NoticeBoard noticeBoard) {
		noticeBoard.setNip(request.getRemoteAddr());
		return noticeboardDao.noticeUpdate(noticeBoard);
	}

	@Override
	public int noticeDelete(int nno) {
		return noticeboardDao.noticeDelete(nno);
	}

	@Override
	public NoticeBoard getNotice(int nno) {
		return noticeboardDao.getNotice(nno);
	}

	@Override
	public NoticeBoard noticeContent(int nno) {
		hitupNotice(nno);
		return noticeboardDao.noticeContent(nno);
	}

	@Override
	public void hitupNotice(int nno) {
		noticeboardDao.hitupNotice(nno);
	}

	@Override
	public int countNotice() {
		return noticeboardDao.countNotice();
	}

}
