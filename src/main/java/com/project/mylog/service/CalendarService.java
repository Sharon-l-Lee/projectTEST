package com.project.mylog.service;

import java.util.Calendar;
import java.util.Map;

import org.springframework.ui.Model;

import com.project.mylog.util.CalendarPrinter;

public class CalendarService implements Service {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		String yearParam = (String) map.get("year");
		String monthParam = (String) map.get("month");
		int year,  month;
		if(yearParam==null && monthParam==null) {
			Calendar cal = Calendar.getInstance();
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH)+1;
			yearParam = String.valueOf(year);
			monthParam = month<10 ? "0"+month : String.valueOf(month);
		}else {
			year = Integer.parseInt(yearParam);
			month = Integer.parseInt(monthParam);
			monthParam = month<10 ? "0"+month : String.valueOf(month);
		}
		CalendarPrinter calPrint = new CalendarPrinter(year, month);
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("calPrint", calPrint);
	}

}
