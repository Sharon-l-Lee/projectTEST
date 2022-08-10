package com.project.mylog.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaBoard {

	private int qno;
	private String mid;
	private String aid;
	private String qwriter;
	private String qtitle;
	private String qcontent;
	private Date qrdate;
	private int qhit;
	private int qgroup;
	private int qstep;
	private int qindent;
	private String qip;
	private String mname;
	
	private int startRow;
	private int endRow;
}
