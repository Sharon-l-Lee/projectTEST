package com.project.mylog.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Append {

	private int currentPage = 1;
	private int pageSize = 5;
	private int startRow;
	private int endRow;
	private int totCnt;
	private int pageCnt;
	
	
	public Append(int totCnt, String pageNum) {
		if (pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}
		startRow = (currentPage - 1) * pageSize + 1;
		endRow = startRow + pageSize - 1;
		this.totCnt = totCnt;
		pageCnt = (int)Math.ceil((double)totCnt/pageSize);
	}
}
