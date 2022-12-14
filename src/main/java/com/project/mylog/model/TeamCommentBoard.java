package com.project.mylog.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TeamCommentBoard {
	private int tcnum;
	private String mid;
	private String tcmention;
	private String mname;
	private int tnum;
	private String tccontent;
	private Timestamp tcrdate;
	private int tcgroup;
	private int tcindent;
	private String tcip;
	
	private int startRow;
	private int endRow;
}
