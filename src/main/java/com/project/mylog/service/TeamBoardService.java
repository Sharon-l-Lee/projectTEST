package com.project.mylog.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.TeamBoard;

public interface TeamBoardService {
	public List<TeamBoard> teamBoardList(String pageNum);
	public int teamBoardTotCnt();
	public int teamBoardWrite(MultipartHttpServletRequest mRequest, TeamBoard teamboard);
	public int teamBoardHitUp(int tnum);
	public TeamBoard teamBoardDetail(int tnum);
	public TeamBoard teamBoardModifyReplyView(int tnum);
	public int teamBoardModify(MultipartHttpServletRequest mRequest, TeamBoard teamboard);
	public int teamBoardDelete(int tnum);
	public int teamBoardPreReply(TeamBoard teamboard);
	public int teamBoardReply(MultipartHttpServletRequest mRequest, TeamBoard teamboard);
}
