package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Friend;

@Mapper
public interface FriendDao {

	public List<Friend> myFriendList(String mid);
	
	public List<Friend> searchMyFriend(Friend friend);
	
	public List<Friend> followMe(String mid);
	
	public int followFriend(Friend friend);
	
	public int unfollowFriend(Friend friend);
	
	public int countMyFriend(String mid);
	
	public int countFollowMe(String mid);
}
