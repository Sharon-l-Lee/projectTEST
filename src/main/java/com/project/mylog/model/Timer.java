package com.project.mylog.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Timer {
	
	private int tno;
	private String mid;
	private String mname;
	private String tname;
	private Date ttoday;
	private int tstart;
	private int tend;
	private int tdo;
	private int tpause;
	private int tduring;

}
