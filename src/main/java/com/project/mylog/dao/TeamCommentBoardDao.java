package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.TeamCommentBoard;

@Mapper
public interface TeamCommentBoardDao {
	public List<TeamCommentBoard> teamCommentList(TeamCommentBoard teamcomment);
	public int teamCommentTotCnt(int tnum);
	public int teamCommentWrite(TeamCommentBoard teamcomment);
	public int teamCommentModify(TeamCommentBoard teamcomment);
	public int teamCommentDelete(int tcnum);
	public TeamCommentBoard teamCommentDetail(int tcnum);
	public int teamCommentReply(TeamCommentBoard teamcomment);
}
