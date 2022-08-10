package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.DiaryReply;

@Mapper
public interface DiaryReplyDao {
	public List<DiaryReply> replyList(DiaryReply diaryReply);
	public int replyCnt(int dnum);
	public DiaryReply getReply(int dnum);
	public int replyWrite(DiaryReply diaryReply);
	public int replyReplyWrite(DiaryReply diaryReply);
	public int replyModify(DiaryReply diaryReply);
	public int replyDelete(int drnum);
}
