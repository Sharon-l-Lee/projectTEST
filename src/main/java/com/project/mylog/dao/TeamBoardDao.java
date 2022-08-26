package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.TeamBoard;

@Mapper
public interface TeamBoardDao {
	public List<TeamBoard> teamBoardList(TeamBoard teamboard);
	public int teamBoardTotCnt();
	public int teamBoardWrite(TeamBoard teamboard);
	public int teamBoardHitUp(int tnum);
	public TeamBoard teamBoardDetail(int tnum);
	public int teamBoardModify(TeamBoard teamboard);
	public int teamBoardDelete(int tnum);
}
