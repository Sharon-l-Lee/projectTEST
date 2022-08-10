package com.project.mylog.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AccountBook {
	private int ano;
	private String mid;
	private int acno;
	private String atitle;
	private String acontent;
	private int aprice;
	private Timestamp adate;
	private int astatus;
	
	private int total;
	private int incomeTotal;
	private int expenseTotal;
	
	private int startRow;
	private int endRow;
}
