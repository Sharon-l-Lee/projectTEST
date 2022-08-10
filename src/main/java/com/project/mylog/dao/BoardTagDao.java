package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.BoardTag;

@Mapper
public interface BoardTagDao {
	public void BoardTagConnect(BoardTag boardtag);
	public List<BoardTag> tagNameGet(int rnum);
}
