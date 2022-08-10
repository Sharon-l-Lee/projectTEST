package com.project.mylog.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Alert {

	private int alno;
	private String mid;
	private String fid;
	private int alcode;
	private int alcheck;
	private Date aldate;
	private String codename;
	private String midname;
	private String fidname;
	
	private int startRow;
	private int endRow;
}
