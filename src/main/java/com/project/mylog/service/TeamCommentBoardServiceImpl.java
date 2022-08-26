package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TeamCommentBoardDao;
import com.project.mylog.model.TeamCommentBoard;
import com.project.mylog.util.Paging2;

@Service
public class TeamCommentBoardServiceImpl implements TeamCommentBoardService {

	@Autowired
	private TeamCommentBoardDao teamCommentDao;
	
	@Override
	public List<TeamCommentBoard> teamCommentList(String tcpageNum, int tnum) {
		int teamCommentTotCnt = teamCommentDao.teamCommentTotCnt(tnum);
		Paging2 paging = new Paging2(teamCommentTotCnt, tcpageNum, 5, 5);
		System.out.println(tcpageNum);
		TeamCommentBoard teamcomment = new TeamCommentBoard();
		teamcomment.setStartRow(paging.getStartRow());
		teamcomment.setEndRow(paging.getEndRow());
		teamcomment.setTnum(tnum);
		return teamCommentDao.teamCommentList(teamcomment);
	}

	@Override
	public int teamCommentTotCnt(int tnum) {
		return teamCommentDao.teamCommentTotCnt(tnum);
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
	public TeamCommentBoard teamCommentDetail(int tcnum) {
		return teamCommentDao.teamCommentDetail(tcnum);
	}

	@Override
	public int teamCommentReply(HttpServletRequest request, TeamCommentBoard teamcomment) {
		String tcmention = teamCommentDao.teamCommentDetail(teamcomment.getTcnum()).getMname();
		teamcomment.setTcmention(tcmention);
		teamcomment.setTcip(request.getRemoteAddr());
		System.out.println(tcmention);
		System.out.println(teamcomment);
		return teamCommentDao.teamCommentReply(teamcomment);
	}

	

}
