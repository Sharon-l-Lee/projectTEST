package com.project.mylog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.HashtagDao;
import com.project.mylog.model.Hashtag;

@Service
public class HashtagServiceImpl implements HashtagService {

	@Autowired
	private HashtagDao hashtagDao;
	
	@Override
	public int hashtagWrite(String tname) {
		return  hashtagDao.hashtagWrite(tname);
	}

	@Override
	public int hashtagModify(Hashtag hashtag) {
		return hashtagDao.hashtagModify(hashtag);
	}

	@Override
	public int hashtagDelete(int tno) {
		return hashtagDao.hashtagDelete(tno);
	}

}
