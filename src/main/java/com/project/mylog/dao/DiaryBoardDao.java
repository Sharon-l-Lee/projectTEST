package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.DiaryBoard;

@Mapper
public interface DiaryBoardDao {
	public List<DiaryBoard> myDiaryList(DiaryBoard diaryBoard);
	public List<DiaryBoard> diaryList(DiaryBoard diaryBoard);
	public int myDiaryCnt(DiaryBoard diaryBoard);
	public int diaryCnt(DiaryBoard diaryBoard);
	public int diaryHitup(int dnum);
	public DiaryBoard diaryContent(int dnum);
	public int diaryWrite(DiaryBoard diaryBoard);
	public int diaryModify(DiaryBoard diaryBoard);
	public int diaryDelete(int dnum);
}
