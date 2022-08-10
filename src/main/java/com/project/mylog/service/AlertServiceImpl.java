package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.AlertDao;
import com.project.mylog.model.Alert;
import com.project.mylog.model.Member;
import com.project.mylog.util.Append;

@Service
public class AlertServiceImpl implements AlertService {

	@Autowired
	private AlertDao alertDao;
	
	@Override
	public List<Alert> myAlertList(String pageNum, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		Append append = new Append(alertDao.countMyAlert(member.getMid()), pageNum);
		Alert alert = new Alert();
		alert.setStartRow(append.getStartRow());
		alert.setEndRow(append.getEndRow());
		alert.setMid(member.getMid());
		return alertDao.myAlertList(alert);
	}

	@Override
	public int countMyAlert(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		return alertDao.countMyAlert(member.getMid());
	}

	@Override
	public int readAlert(HttpServletRequest request) {
		int result = 0;
		String[] alnos = request.getParameterValues("alno");
		for (int i = 0; i < alnos.length; i++) {
			alertDao.readAlert(Integer.parseInt(alnos[i]));
		}
		return result;
	}

	@Override
	public int makeAlert(HttpSession session, String fid, int alcode) {
		Member member = (Member) session.getAttribute("member");
		Alert alert = new Alert();
		alert.setMid(member.getMid());
		alert.setFid(fid);
		alert.setAlcode(alcode);
		return alertDao.makeAlert(alert);
	}

	@Override
	public int countNotRead(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		return alertDao.countNotRead(member.getMid());
	}

}
