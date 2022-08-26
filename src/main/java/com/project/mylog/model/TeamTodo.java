package com.project.mylog.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TeamTodo {
	private int ttno;
	private int tno;
	private String ttcontent;
	private int ttcheck;
	private int tmno;
	private int ttorder;
	private Date ttrdate;
	
	private String mid;
	private String mname;
}
