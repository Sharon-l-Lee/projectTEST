package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.TimerDao;
import com.project.mylog.dao.TimetableDao;
import com.project.mylog.model.Member;
import com.project.mylog.model.Timetable;

@Service
public class TimetableServiceImpl implements TimetableService {
	
	@Autowired
	private TimetableDao ttableDao;
	
	@Autowired
	private TimerDao timerDao;
	
	@Override
	public int tableMake(HttpSession session, Timetable timetable) {
		
		timetable.setTno(timerDao.getTno());
		timetable.setMid(((Member)session.getAttribute("member")).getMid());
		return ttableDao.tableMake(timetable);
	}

	@Override
	public int tableStart(Timetable timetable) {
		timetable.setTno(timerDao.getTno());
		timetable.setTbno(ttableDao.getTbno());
		return ttableDao.tableStart(timetable);
	}

	@Override
	public int tableEnd(Timetable timetable) {
		return ttableDao.tableEnd(timetable);
	}

	@Override
	public List<Timetable> tableIdList(HttpSession session, String mid) {
		// TODO Auto-generated method stub
		mid = ((Member)session.getAttribute("member")).getMid();
		return ttableDao.tableIdList(mid);
	}

	@Override
	public List<Timetable> tableTno(int tno) {
		return ttableDao.tableTno(tno);
	}

	@Override
	public Timetable tableTbno(int tbno) {
		return ttableDao.tableTbno(tbno);
	}

	@Override
	public int getTbno() {
		// TODO Auto-generated method stub
		return ttableDao.getTbno();
	}

	@Override
	public Timetable tableIdTbno(HttpSession session, Timetable timetable) {
		timetable.setTno(timerDao.getTno());
		timetable.setMid(((Member)session.getAttribute("member")).getMid());
		return ttableDao.tableIdTbno(timetable);
	}

	

}
