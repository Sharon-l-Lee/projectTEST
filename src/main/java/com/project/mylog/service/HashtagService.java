package com.project.mylog.service;

import com.project.mylog.model.Hashtag;

public interface HashtagService {

	
	public int hashtagWrite(String tname);
	public int hashtagModify(Hashtag hashtag);
	public int hashtagDelete(int tno);
	
}
