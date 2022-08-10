package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.project.mylog.model.DiaryReply;

public interface DiaryReplyService {
	public List<DiaryReply> replyList(int dnum, String rPageNum);
	public int replyCnt(int dnum);
	public DiaryReply getReply(int drnum);
	public int replyWrite(DiaryReply diaryReply, HttpSession session, HttpServletRequest request);
	public int replyReplyWrite(DiaryReply diaryReply, HttpSession session, HttpServletRequest request);
	public int replyModify(DiaryReply diaryReply, HttpServletRequest request);
	public int replyDelete(int drnum);
}
