package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TeamCommentBoardDao;
import com.project.mylog.model.TeamCommentBoard;
import com.project.mylog.util.Paging;

@Service
public class TeamCommentBoardServiceImpl implements TeamCommentBoardService {

	@Autowired
	private TeamCommentBoardDao teamCommentDao;
	
	@Override
	public List<TeamCommentBoard> teamCommentList(String pageNum) {
		int teamCommentTotCnt = teamCommentDao.teamCommentTotCnt();
		Paging paging = new Paging(teamCommentTotCnt, pageNum, 5, 10);
		TeamCommentBoard teamcomment = new TeamCommentBoard();
		teamcomment.setCstartRow(paging.getStartRow());
		teamcomment.setCendRow(paging.getEndRow());
		return teamCommentDao.teamCommentList(teamcomment);
	}

	@Override
	public int teamCommentTotCnt() {
		return teamCommentDao.teamCommentTotCnt();
	}

	@Override
	public int teamCommentWrite(HttpServletRequest request, TeamCommentBoard teamcomment) {
		teamcomment.setTcip(request.getRemoteAddr());
		return teamCommentDao.teamCommentWrite(teamcomment);
	}

	@Override
	public int teamCommentModify(HttpServletRequest request, TeamCommentBoard teamcomment) {
		teamcomment.setTcip(request.getRemoteAddr());
		return teamCommentDao.teamCommentModify(teamcomment);
	}

	@Override
	public int teamCommentDelete(int tcnum) {
		return teamCommentDao.teamCommentDelete(tcnum);
	}

	@Override
	public int teamCommentPreReply(TeamCommentBoard teamcomment) {
		return teamCommentDao.teamCommentPreReply(teamcomment);
	}

	@Override
	public int teamCommentReply(HttpServletRequest request, TeamCommentBoard teamcomment) {
		teamCommentDao.teamCommentPreReply(teamcomment);
		teamcomment.setTcip(request.getRemoteAddr());
		return teamCommentDao.teamCommentReply(teamcomment);
	}

}
