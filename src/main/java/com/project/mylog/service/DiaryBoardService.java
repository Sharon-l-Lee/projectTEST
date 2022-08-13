package com.project.mylog.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.DiaryBoard;
import com.project.mylog.model.FileUp;

public interface DiaryBoardService {
	public List<DiaryBoard> myDiaryList(HttpSession session, Date ddate, String pageNum);
	public List<DiaryBoard> diaryList(HttpSession session, String pageNum);
	public int myDiaryCnt(HttpSession session, Date ddate);
	public int diaryCnt(HttpSession session);
	public int diaryHitup(int dnum);
	public DiaryBoard diaryContent(int dnum);
	public DiaryBoard getDiary(int dnum);
	public int diaryWrite(HttpSession session, DiaryBoard diaryBoard, HttpServletRequest request);
	public int diaryModify(DiaryBoard diaryBoard, HttpServletRequest request);
	public int diaryDelete(int dnum);
	public FileUp fileUp(FileUp fileUp, HttpServletRequest request);
}
