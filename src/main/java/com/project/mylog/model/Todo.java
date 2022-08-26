package com.project.mylog.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Todo {
	private int tdno;
	private String mid;
	private String tdcontent;
	private int tdcheck;
	private Date tdrdate;
	
	private int startRow;
	private int endRow;
}
