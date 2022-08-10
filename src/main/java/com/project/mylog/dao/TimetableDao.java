package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Timetable;

@Mapper
public interface TimetableDao {
	public int tableMake(Timetable timetable);
	public int tableStart(Timetable timetable);
	public int tableEnd(Timetable timetable);
	public List<Timetable>tableIdList(String mid);
	public List<Timetable>tableTno(int tno);
	public Timetable tableTbno(int tbno);
	public int getTbno();
	public Timetable tableIdTbno(Timetable timetable);
	
}
