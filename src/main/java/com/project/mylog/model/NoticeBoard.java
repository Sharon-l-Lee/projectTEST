package com.project.mylog.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeBoard {

	private int nno;
	private String aid;
	private String ntitle;
	private String ncontent;
	private Date nrdate;
	private int nhit;
	private String nip;
	
	private int startRow;
	private int endRow;
}
