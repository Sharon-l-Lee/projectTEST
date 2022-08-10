package com.project.mylog.service;

import javax.servlet.http.HttpSession;

import com.project.mylog.model.Timer;

public interface TimerService {
	public int timerMake(HttpSession session, Timer timer);
	public int timerStart(Timer timer);
	public int timerEnd(Timer timer);
	public int startEnd(HttpSession session, Timer timer);
	public Timer timerTno(int tno);
	public int getTno();
	public int endTno();
	public int timerSave(Timer timer);

}
