package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.DiaryReplyDao;
import com.project.mylog.model.DiaryReply;
import com.project.mylog.model.Member;
import com.project.mylog.util.Paging;

@Service
public class DiaryReplyServiceImpl implements DiaryReplyService {
	
	@Autowired
	DiaryReplyDao dReplyDao;

	@Override
	public List<DiaryReply> replyList(int dnum, String rPageNum) {
		DiaryReply diaryReply = new DiaryReply();
		Paging paging = new Paging(dReplyDao.replyCnt(dnum), rPageNum, 15, 5);
		diaryReply.setDnum(dnum);
		diaryReply.setStartRow(paging.getStartRow());
		diaryReply.setEndRow(paging.getEndRow());
		return dReplyDao.replyList(diaryReply);
	}

	@Override
	public int replyCnt(int dnum) {
		return dReplyDao.replyCnt(dnum);
	}

	@Override
	public DiaryReply getReply(int drnum) {
		return dReplyDao.getReply(drnum);
	}

	@Override
	public int replyWrite(DiaryReply diaryReply, HttpSession session, HttpServletRequest request) {
		diaryReply.setMid(((Member) session.getAttribute("member")).getMid());
		diaryReply.setDrip(request.getRemoteAddr());
		return dReplyDao.replyWrite(diaryReply);
	}

	@Override
	public int replyReplyWrite(DiaryReply diaryReply, HttpSession session, HttpServletRequest request) {
		diaryReply.setMid(((Member) session.getAttribute("member")).getMid());
		diaryReply.setDrip(request.getRemoteAddr());
		DiaryReply originDR = dReplyDao.getReply(diaryReply.getDrnum());
		diaryReply.setDrgroup(originDR.getDrgroup());
		System.out.println("origin"+originDR);
		System.out.println("write1"+diaryReply);
		if(originDR.getDrindent() == 1) {
			diaryReply.setDrmention(originDR.getMname());
		}
		System.out.println("write2"+diaryReply);
		return dReplyDao.replyReplyWrite(diaryReply);
	}

	@Override
	public int replyModify(DiaryReply diaryReply, HttpServletRequest request) {
		diaryReply.setDrip(request.getRemoteAddr());
		return dReplyDao.replyModify(diaryReply);
	}

	@Override
	public int replyDelete(int drnum) {
		return dReplyDao.replyDelete(drnum);
	}

}
