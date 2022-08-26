package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.mylog.model.Timetable;

public interface TimetableService {
	public int tableMake(HttpSession session, Timetable timetable);
	public int tableStart(Timetable timetable);
	public int tableEnd(Timetable timetable);
	public List<Timetable>tableList(HttpSession session, Timetable timetable);
	public List<Timetable>tableIdList(HttpSession session, String mid);
	public List<Timetable>tableTno(int tno);
	public Timetable tableTbno(int tbno);
	public int getTbno();
	public Timetable tableIdTbno(HttpSession session, Timetable timetable);
}
