package com.project.mylog.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TeamBoard {
	private int tnum;
	private String mid;
	private String ttitle;
	private String tcontent;
	private int thit;
	private Timestamp trdate;
	private String tip;
	
	private String mname;
	
	private int teamCommentTotCnt;
	
	private int startRow;
	private int endRow;
}
