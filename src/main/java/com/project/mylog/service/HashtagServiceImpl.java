package com.project.mylog.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.BoardTagDao;
import com.project.mylog.dao.HashtagDao;
import com.project.mylog.model.Hashtag;

@Service
public class HashtagServiceImpl implements HashtagService {

	@Autowired
	private HashtagDao hashtagDao;
	
	private BoardTagDao boardtagDao;

	
	@Override
	public int hashtagWrite(String hname) {
		
		return hashtagDao.hashtagWrite(hname);
		
	}

	@Override
	public int hashtagModify(Hashtag hashtag) {
		return hashtagDao.hashtagModify(hashtag);
	}

	@Override
	public int hashtagDelete(int hno) {
		
		return hashtagDao.hashtagDelete(hno);
	}

	@Override
	public int getHno(String hname) {
		return hashtagDao.getHno(hname);
	}

	@Override
	public int getMaxHno() {
		return hashtagDao.getMaxHno();
	}

	@Override
	public int searchHno(String hname) {
		return hashtagDao.searchHno(hname);
	}

	@Override
	public String getHname(String hname) {
		// TODO Auto-generated method stub
		return hashtagDao.getHname(hname);
	}

}
