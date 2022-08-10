package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Alert;

@Mapper
public interface AlertDao {

	public List<Alert> myAlertList(Alert alert);
	
	public int countMyAlert(String mid);
	
	public int readAlert(int alno);
	
	public int makeAlert(Alert alert);
	
	public int countNotRead(String mid);
	
}
