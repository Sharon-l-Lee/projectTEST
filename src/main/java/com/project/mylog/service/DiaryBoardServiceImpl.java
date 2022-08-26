package com.project.mylog.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.dao.DiaryBoardDao;
import com.project.mylog.model.DiaryBoard;
import com.project.mylog.model.FileUp;
import com.project.mylog.model.Member;
import com.project.mylog.util.Paging;

@Service
public class DiaryBoardServiceImpl implements DiaryBoardService {
	@Autowired
	private DiaryBoardDao diaryDao;
	
	String backupPath = "D:\\yujin\\teamproject\\mylog\\src\\main\\webapp\\resources\\diaryBoardFileUpload\\";

	@Override
	public List<DiaryBoard> myDiaryList(HttpSession session, Date ddate, String pageNum) {
		DiaryBoard diaryBoard = new DiaryBoard();
		diaryBoard.setMid(((Member) session.getAttribute("member")).getMid());
		diaryBoard.setDdate(ddate);
		if(pageNum == null) {
			pageNum = "1";
		}
		Paging paging = new Paging(diaryDao.myDiaryCnt(diaryBoard), pageNum, 7, 5);
		diaryBoard.setStartRow(paging.getStartRow());
		diaryBoard.setEndRow(paging.getEndRow());
		return diaryDao.myDiaryList(diaryBoard);
	}

	@Override
	public List<DiaryBoard> diaryList(HttpSession session, String pageNum) {
		DiaryBoard diaryBoard = new DiaryBoard();
		diaryBoard.setMid(((Member) session.getAttribute("member")).getMid());
		if(pageNum == null) {
			pageNum = "1";
		}
		Paging paging = new Paging(diaryDao.diaryCnt(diaryBoard), pageNum, 10, 10);
		diaryBoard.setStartRow(paging.getStartRow());
		diaryBoard.setEndRow(paging.getEndRow());
		return diaryDao.diaryList(diaryBoard);
	}

	@Override
	public int myDiaryCnt(HttpSession session, Date ddate) {
		DiaryBoard diaryBoard = new DiaryBoard();
		diaryBoard.setMid(((Member) session.getAttribute("member")).getMid());
		diaryBoard.setDdate(ddate);
		return diaryDao.myDiaryCnt(diaryBoard);
	}

	@Override
	public int diaryCnt(HttpSession session) {
		DiaryBoard diaryBoard = new DiaryBoard();
		diaryBoard.setMid(((Member) session.getAttribute("member")).getMid());
		return diaryDao.diaryCnt(diaryBoard);
	}

	@Override
	public int diaryHitup(int dnum) {
		return diaryDao.diaryHitup(dnum);
	}

	@Override
	public DiaryBoard diaryContent(int dnum) {
		diaryHitup(dnum);
		return diaryDao.diaryContent(dnum);
	}
	
	@Override
	public DiaryBoard getDiary(int dnum) {
		return diaryDao.diaryContent(dnum);
	}

	@Override
	public int diaryWrite(HttpSession session, DiaryBoard diaryBoard, HttpServletRequest request) {
		diaryBoard.setDip(request.getLocalAddr());
		diaryBoard.setMid(((Member) session.getAttribute("member")).getMid());
		return diaryDao.diaryWrite(diaryBoard);
	}

	@Override
	public int diaryModify(DiaryBoard diaryBoard, HttpServletRequest request) {
		diaryBoard.setDip(request.getLocalAddr());
		return diaryDao.diaryModify(diaryBoard);
	}

	@Override
	public int diaryDelete(int dnum) {
		return diaryDao.diaryDelete(dnum);
	}

	
	@Override
	public FileUp fileUp(FileUp fileUp, HttpServletRequest request) {
		String rootPath = request.getRealPath("/");
		String attachPath = "resources/diaryBoardFileUpload/";
		System.out.println("서버로 여기로 보낸다 : "+rootPath + attachPath);
		MultipartFile upload = fileUp.getUpload();
		String filename = "";
		
		if(upload != null){
	    	filename = System.currentTimeMillis() + upload.getOriginalFilename();
	    	fileUp.setFilename(filename);
	     	try{
	     		File file = new File(rootPath + attachPath + filename);
	     		upload.transferTo(file);
	     	}catch(IOException e){
	     		e.printStackTrace();
	     	}  
	     	
	     	fileUp.setAttachPath(attachPath);
	     	fileUp.setFilename(filename);
	     }
		 
		int result = filecopy(rootPath + attachPath + filename, backupPath+filename);
		if(result==1) {
			System.out.println(filename+" 파일 백업 성공");
		}
		return fileUp;
	}
	
	private int filecopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int)sFile.length()];
			while(true) {
				int nRead = is.read(buff);
				if(nRead == -1) {
					break;
				}
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (FileNotFoundException e) {
			System.out.println("복사 예외0 : "+e.getMessage());
		} catch (IOException e) {
			System.out.println("복사 예외1 : "+e.getMessage());
		} finally {
			try {
				if(os!=null) {
					os.close();
				}
				if(is!=null) {
					is.close();
				}
			}catch (Exception e) {
			}
		}
		return isCopy;
	}

}
