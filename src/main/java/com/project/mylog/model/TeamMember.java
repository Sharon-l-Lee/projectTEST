package com.project.mylog.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TeamMember {
	private int tmno;
	private String mid;
	private String mname;
	private int tno;
	private int tmcheck;
	
	private String tname;
}
