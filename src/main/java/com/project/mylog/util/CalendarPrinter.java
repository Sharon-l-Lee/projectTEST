package com.project.mylog.util;

import java.util.Calendar;

public class CalendarPrinter {
	
	private Calendar calendar;
	private String[][] calDate = new String[6][7];
	private String[] title = {"일","월","화","수","목","금","토"};
	private int width = title.length; //7
	private int startday; // 시작하는 요일 (1:일, 2:월, ..)
	private int lastday;  // 월의 마지막 날짜
	private int day=1;      // 날짜를 뿌리기 위한 변수
	
	public CalendarPrinter(int year, int month) {
		calendar = Calendar.getInstance(); // 날짜 시간 객체
		calendar.set(year, month-1, 1);
		startday = calendar.get(Calendar.DAY_OF_WEEK); // 월의 시작하는 요일(1:일)
		lastday = calendar.getActualMaximum(Calendar.DATE); //월이 끝나는 날
		
		int row = 0; // 0행부터 시작
		for(int i=1 ; day<=lastday ; i++) {
			if(i<startday) {//뿌리면 안 되는 것
				calDate[row][i-1] = "";
			}else {
				// 뿌려야되는 것
				calDate[row][(i-1)%width] = String.valueOf(day++);
				if(i%width==0) row++;
			}
		}
	}

	public String[][] getCalDate() {
		return calDate;
	}
	public String[] getTitle() {
		return title;
	}
}
