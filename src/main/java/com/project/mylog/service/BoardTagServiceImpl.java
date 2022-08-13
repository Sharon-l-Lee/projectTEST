package com.project.mylog.service;

import java.util.List;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.BoardTagDao;
import com.project.mylog.dao.HashtagDao;
import com.project.mylog.dao.ReviewBoardDao;
import com.project.mylog.model.BoardTag;

@Service
public class BoardTagServiceImpl implements BoardTagService {

	@Autowired
	private BoardTagDao boardtagdao;

	@Autowired
	private HashtagDao hashtagdao;
	@Autowired
	private ReviewBoardDao rboarddao;

	@Override
	public void BoardTagConnect(BoardTag boardtag, String hname) {
		boardtag.setRnum(rboarddao.getRnum());
		StringTokenizer st = new StringTokenizer(hname);
		while (st.hasMoreTokens()) {
			hname = st.nextToken();
			String yestag = hashtagdao.getHname(hname);
			if (yestag != null) {
				boardtag.setHno(hashtagdao.getHno(hname));
				boardtagdao.BoardTagConnect(boardtag);
			} else if (yestag == null) {
				hashtagdao.hashtagWrite(hname);
				boardtag.setHno(hashtagdao.getHno(hname));
				boardtagdao.BoardTagConnect(boardtag);
			}
		}

	}

	@Override
	public List<BoardTag> tagNameGet(int rnum) {

		return boardtagdao.tagNameGet(rnum);
	}

}
