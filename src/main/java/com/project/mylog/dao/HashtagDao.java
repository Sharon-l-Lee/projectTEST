package com.project.mylog.dao;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Hashtag;

@Mapper
public interface HashtagDao {
	public int hashtagWrite(String hname);
	public int hashtagModify(Hashtag hashtag);
	public int hashtagDelete(int hno);
	public int getHno(String hname);
	public int getMaxHno();
	public int searchHno(String hname);
	public String getHname(String hname);
	
	

}
