package com.project.mylog.service;

import com.project.mylog.model.Hashtag;

public interface HashtagService {

	
	public int hashtagWrite(String hname);
	public int hashtagModify(Hashtag hashtag);
	public int hashtagDelete(int hno);
	public int getHno(String hname);
	public int getMaxHno();
	
}
