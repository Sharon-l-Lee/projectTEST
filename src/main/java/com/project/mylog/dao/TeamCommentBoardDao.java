package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.TeamBoard;
import com.project.mylog.model.TeamCommentBoard;

@Mapper
public interface TeamCommentBoardDao {
	public List<TeamCommentBoard> teamCommentList(TeamCommentBoard teamcomment);
	public int teamCommentTotCnt();
	public int teamCommentWrite(TeamCommentBoard teamcomment);
	public int teamCommentModify(TeamCommentBoard teamcomment);
	public int teamCommentDelete(int tcnum);
	public int teamCommentPreReply(TeamCommentBoard teamcomment);
	public int teamCommentReply(TeamCommentBoard teamcomment);
}
