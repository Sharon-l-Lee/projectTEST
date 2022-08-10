package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.mylog.model.Friend;

public interface FriendService {

	public List<Friend> myFriendList(HttpSession session);
	
	public List<Friend> searchMyFriend(HttpSession session, String mname);
	
	public List<Friend> followMe(HttpSession session);
	
	public int followFriend(HttpSession session, String fid);
	
	public int unfollowFriend(HttpSession session, String fid);
	
	public int countMyFriend(HttpSession session);
	
	public int countFollowMe(HttpSession session);
	
}
