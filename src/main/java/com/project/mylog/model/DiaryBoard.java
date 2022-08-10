package com.project.mylog.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class DiaryBoard {
	private int dnum;
	private String dtitle;
	private String mid;
	private String mname;
	private int dtodoin;
	private String dcontent;
	private int dhit;
	private int dstatus;
	private Date ddate;
	private Timestamp drdate;
	private String dip;
	
	private int startRow;
	private int endRow;
}
