package com.project.mylog.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewBoard {
	private int rnum;
	private String mid;
	private String mname;
	private String rtitle;
	private String rcontent;
	private String rfilename;
	private Date rrdate;
	private int rhit;
	private int rstatus;
	private String rip;
	private int cnt;
	private int rcnt;
	private int hno;
	private String shoption;
	private String shname;
	private int startRow;
	private int endRow;
	
	
}
