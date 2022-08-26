package com.project.mylog.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Timetable {
	
	private int tbno;
	private int tno;
	private String mid;
	private String mname;
	private String tname;
	private int tduring;
	private int tbshour;
	private int tbsmin;
	private int tbehour;
	private int tbemin;
	private Date tdate;
	
	
	@Override
	public String toString() {
		return "{'tbno': '" + tbno + "','tno': '" + tno + "','mid':'" + mid + "','mname':'" + mname + "','tname':'" + tname
				+ "','tduring':'" + tduring + "','tbshour':'" + tbshour + "','tbsmin':'" 
				+ tbsmin + "','tbehour':'" + tbehour
				+ "','tbemin':'" + tbemin + "'}";
	}
	
	
	

}
