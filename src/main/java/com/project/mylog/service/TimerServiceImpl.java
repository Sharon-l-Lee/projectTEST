package com.project.mylog.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TimerDao;
import com.project.mylog.model.Member;
import com.project.mylog.model.Timer;

@Service
public class TimerServiceImpl implements TimerService {
	
	@Autowired
	private TimerDao timerDao;
	
	@Override
	public int timerMake(HttpSession session, Timer timer) {
		
		
		timer.setMid(((Member)session.getAttribute("member")).getMid());
		return timerDao.timerMake(timer);
	}

	@Override
	public int timerStart(Timer timer) {
		timer.setTno(timerDao.getTno());
		return timerDao.timerStart(timer);
	}

	@Override
	public int timerEnd(Timer timer) {
		return timerDao.timerEnd(timer);
	}

	@Override
	public int startEnd(HttpSession session, Timer timer) {
		timer.setTno(timerDao.getTno());
		timer.setMid(((Member)session.getAttribute("member")).getMid());
		return timerDao.startEnd(timer);
	}

	@Override
	public Timer timerTno(int tno) {
		
		return timerDao.timerTno(tno);
	}

	@Override
	public int getTno() {
		
		return timerDao.getTno();
	}

	@Override
	public int endTno() {
		// TODO Auto-generated method stub
		return timerDao.endTno();
	}

	@Override
	public int timerSave(Timer timer) {
		// TODO Auto-generated method stub
		return timerDao.timerSave(timer);
	}

}
