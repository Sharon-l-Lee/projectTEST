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
	private String tfilename;
	private int thit;
	private Timestamp trdate;
	private int tgroup;
	private int tstep;
	private int tindent;
	private String tip;
	
	private int teamCommentTotCnt;
	
	private int startRow;
	private int endRow;
}
