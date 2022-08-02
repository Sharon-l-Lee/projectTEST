package com.project.mylog.model;

import java.sql.Timestamp;

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
	private Timestamp ttrdate;
	private String mid;
}
