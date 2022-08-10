package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.project.mylog.model.Alert;

public interface AlertService {

	public List<Alert> myAlertList(String pageNum, HttpSession session);
	
	public int countMyAlert(HttpSession session);
	
	public int readAlert(HttpServletRequest request);
	
	public int makeAlert(HttpSession session, String fid, int alcode);
	
	public int countNotRead(HttpSession session);
}
