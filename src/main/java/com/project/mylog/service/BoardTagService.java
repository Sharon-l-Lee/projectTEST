package com.project.mylog.service;

import java.util.List;

import com.project.mylog.model.BoardTag;

public interface BoardTagService {
	public void BoardTagConnect(BoardTag boardtag, String hname);
	public List<BoardTag> tagNameGet(int rnum);
}
