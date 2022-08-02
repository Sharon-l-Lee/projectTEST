package com.project.mylog.dao;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Hashtag;

@Mapper
public interface HashtagDao {
	public int hashtagWrite(String tname);
	public int hashtagModify(Hashtag hashtag);
	public int hashtagDelete(int tno);
	

}
