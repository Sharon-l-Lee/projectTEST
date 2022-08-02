package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.mylog.model.TeamCommentBoard;

public interface TeamCommentBoardService {
	public List<TeamCommentBoard> teamCommentList(String pageNum);
	public int teamCommentTotCnt();
	public int teamCommentWrite(HttpServletRequest request, TeamCommentBoard teamcomment);
	public int teamCommentModify(HttpServletRequest request, TeamCommentBoard teamcomment);
	public int teamCommentDelete(int tcnum);
	public int teamCommentPreReply(TeamCommentBoard teamcomment);
	public int teamCommentReply(HttpServletRequest request, TeamCommentBoard teamcomment);

}
