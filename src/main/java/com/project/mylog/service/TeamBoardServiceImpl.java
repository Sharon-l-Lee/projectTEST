package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TeamBoardDao;
import com.project.mylog.model.TeamBoard;
import com.project.mylog.util.Paging;

@Service
public class TeamBoardServiceImpl implements TeamBoardService {

	@Autowired
	private TeamBoardDao teamBoardDao;
	String backupPath = "D:\\pjw\\webPro\\source\\10_2ndProject\\mylog\\src\\main\\webapp\\teamBoardFileUpload\\";
	
	@Override
	public List<TeamBoard> teamBoardList(String pageNum) {
		int teamBoardTotCnt = teamBoardDao.teamBoardTotCnt();
		Paging paging = new Paging(teamBoardTotCnt, pageNum, 12, 5);
		TeamBoard teamboard = new TeamBoard();
		teamboard.setStartRow(paging.getStartRow());
		teamboard.setEndRow(paging.getEndRow());
		return teamBoardDao.teamBoardList(teamboard);
	}

	@Override
	public int teamBoardTotCnt() {
		return teamBoardDao.teamBoardTotCnt();
	}

	@Override
	public int teamBoardWrite(HttpServletRequest request, TeamBoard teamboard) {
		teamboard.setTip(request.getRemoteAddr());
		return teamBoardDao.teamBoardWrite(teamboard);
	}

	@Override
	public int teamBoardHitUp(int tnum) {
		return teamBoardDao.teamBoardHitUp(tnum);
	}

	@Override
	public TeamBoard teamBoardDetail(int tnum) {
		return teamBoardDao.teamBoardDetail(tnum);
	}

	@Override // 수정이나 삭제시 사용
	public TeamBoard teamBoardModifyReplyView(int tnum) {
		return teamBoardDao.teamBoardDetail(tnum);
	}

	@Override
	public int teamBoardModify(HttpServletRequest request, TeamBoard teamboard) {
		teamboard.setTip(request.getRemoteAddr());
		return teamBoardDao.teamBoardModify(teamboard);
	}

	@Override
	public int teamBoardDelete(int tnum) {
		return teamBoardDao.teamBoardDelete(tnum);
	}

}
