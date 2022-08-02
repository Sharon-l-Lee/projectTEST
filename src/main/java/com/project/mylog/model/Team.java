package com.project.mylog.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Team {
	private int tno;
	private String tname;
	private String tgoal;
}
