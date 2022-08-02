package com.project.mylog.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {

	private String mid;
	private String mpw;
	private String mname;
	private Date mbirth;
	private String memail;
	private String mmotto;
	private int mstatus;
}
