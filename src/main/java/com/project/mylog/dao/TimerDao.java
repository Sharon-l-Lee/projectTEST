package com.project.mylog.dao;


import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Timer;

@Mapper
public interface TimerDao {
	public int timerMake(Timer timer);
	public int timerStart(Timer timer);
	public int timerEnd(Timer timer);
	public int startEnd(Timer timer);
	public Timer timerTno(int tno);
	public int getTno();
	public int endTno();
	public int timerSave(Timer timer);
	
}
