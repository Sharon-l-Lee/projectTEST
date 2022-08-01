package com.project.mylog.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewReplyBoard {

	private int rpnum;
	private int rnum;
	private String mid;
	private String mname;
	private String rpcontent;
	private Date rpdate;
	private int rpgroup;
	private int rpstep;
	private int rpindent;
	private String rip;
	private int startRow;
	private int endRow;

}
