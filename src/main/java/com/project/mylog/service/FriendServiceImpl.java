package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.FriendDao;
import com.project.mylog.model.Friend;
import com.project.mylog.model.Member;

@Service
public class FriendServiceImpl implements FriendService {

	@Autowired
	private FriendDao friendDao;
	
	@Override
	public List<Friend> myFriendList(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		return friendDao.myFriendList(member.getMid());
	}

	@Override
	public List<Friend> searchMyFriend(HttpSession session, String mname) {
		Member member = (Member) session.getAttribute("member");
		Friend friend = new Friend();
		friend.setMid(member.getMid());
		friend.setMname(mname);
		return friendDao.searchMyFriend(friend);
	}

	@Override
	public List<Friend> followMe(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		return friendDao.followMe(member.getMid());
	}

	@Override
	public int followFriend(HttpSession session, String fid) {
		Member member = (Member) session.getAttribute("member");
		Friend friend = new Friend();
		friend.setMid(member.getMid());
		friend.setFid(fid);
		return friendDao.followFriend(friend);
	}

	@Override
	public int unfollowFriend(HttpSession session, String fid) {
		Member member = (Member) session.getAttribute("member");
		Friend friend = new Friend();
		friend.setMid(member.getMid());
		friend.setFid(fid);
		return friendDao.unfollowFriend(friend);
	}

	@Override
	public int countMyFriend(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		return friendDao.countMyFriend(member.getMid());
	}

	@Override
	public int countFollowMe(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		return friendDao.countFollowMe(member.getMid());
	}

}
