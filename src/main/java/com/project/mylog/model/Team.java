package com.project.mylog.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Team {
	private int tno;
	private String mid;
	private String mname;
	private String tname;
	private String tgoal;
	
	private String schItem; // 검색하려고 선택된 항목 (책이름=btitle or 저자=bwriter)
	private String schWord; // 검색할 단어
	
	private int startRow;
	private int endRow;
}
