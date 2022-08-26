package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.mylog.model.TeamBoard;

public interface TeamBoardService {
	public List<TeamBoard> teamBoardList(String pageNum);
	public int teamBoardTotCnt();
	public int teamBoardWrite(HttpServletRequest request, TeamBoard teamboard);
	public int teamBoardHitUp(int tnum);
	public TeamBoard teamBoardDetail(int tnum);
	public TeamBoard teamBoardModifyReplyView(int tnum);
	public int teamBoardModify(HttpServletRequest request, TeamBoard teamboard);
	public int teamBoardDelete(int tnum);
}
