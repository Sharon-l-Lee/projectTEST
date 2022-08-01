package com.project.mylog.dao;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Hashtag;

@Mapper
public interface HashtagDao {
	public int HashtagWrite(Hashtag hashtag);
	public int HashtagModify(Hashtag hashtag);
	public int HashtagDelete(Hashtag hashtag);
	

}
