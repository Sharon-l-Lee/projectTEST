package com.project.mylog.service;

import java.io.File;
import java.io.FileInputStream;
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
import com.project.mylog.model.Member;
import com.project.mylog.util.Paging;

@Service
public class DiaryBoardServiceImpl implements DiaryBoardService {
	@Autowired
	private DiaryBoardDao diaryDao;
	
	String backupPath = "D:\\yujin\\teamproject\\mylog\\src\\main\\webapp\\WEB-INF\\diaryBoardFileUpload/";

	@Override
	public List<DiaryBoard> myDiaryList(HttpSession session, Date ddate, String pageNum) {
		DiaryBoard diaryBoard = new DiaryBoard();
		diaryBoard.setMid(((Member) session.getAttribute("member")).getMid());
		diaryBoard.setDdate(ddate);
		if(pageNum == null) {
			pageNum = "1";
		}
		Paging paging = new Paging(diaryDao.myDiaryCnt(diaryBoard), pageNum, 5, 1);
		diaryBoard.setStartRow(paging.getStartRow());
		diaryBoard.setEndRow(paging.getEndRow());
		return diaryDao.myDiaryList(diaryBoard);
	}

	@Override
	public List<DiaryBoard> diaryList(HttpSession session, String pageNum) {
		DiaryBoard diaryBoard = new DiaryBoard();
		diaryBoard.setMid(((Member) session.getAttribute("member")).getMid());
		Paging paging = new Paging(diaryDao.diaryCnt(diaryBoard), pageNum, 5, 1);
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
	public int diaryWrite(HttpSession session, MultipartHttpServletRequest mRequest, DiaryBoard diaryBoard) {
		diaryBoard.setDip(mRequest.getLocalAddr());
		diaryBoard.setMid(((Member) session.getAttribute("member")).getMid());
		boolean result = false;
		String path = mRequest.getRealPath("diaryBoardFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // 파라미터이름 받음
		String filename = "";
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터의 첨부된 파일 객체
			System.out.println("파라미터 이름 : " + param);
			filename = mFile.getOriginalFilename(); // param으로 첨부한 파일의 원래 이름
			if (filename != null && !filename.equals("")) { // 첨부한 파일이 있을 경우
				// 저장할 파일이름이 서버의 파일과 중복될 경우 -> 파일명 변경
				if (new File(path + filename).exists()) {
					filename = System.currentTimeMillis() + "_" + filename;
				}
				try {
					mFile.transferTo(new File(path + filename));
					result = fileCopy(path + filename, backupPath + filename);
					System.out.println(result == true ? filename + " 백업성공" : filename + "번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				result = true;
			}
		} // if
		return diaryDao.diaryWrite(diaryBoard);
	}

	@Override
	public int diaryModify(MultipartHttpServletRequest mRequest, DiaryBoard diaryBoard) {
		diaryBoard.setDip(mRequest.getLocalAddr());
		boolean result = false;
		String path = mRequest.getRealPath("diaryBoardFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // 파라미터이름 받음
		String filename = "";
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터의 첨부된 파일 객체
			System.out.println("파라미터 이름 : " + param);
			filename = mFile.getOriginalFilename(); // param으로 첨부한 파일의 원래 이름
			if (filename != null && !filename.equals("")) { // 첨부한 파일이 있을 경우
				// 저장할 파일이름이 서버의 파일과 중복될 경우 -> 파일명 변경
				if (new File(path + filename).exists()) {
					filename = System.currentTimeMillis() + "_" + filename;
				}
				try {
					mFile.transferTo(new File(path + filename));
					result = fileCopy(path + filename, backupPath + filename);
					System.out.println(result == true ? filename + " 백업성공" : filename + "번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				result = true;
			}
		} // while
		return diaryDao.diaryModify(diaryBoard);
	}

	@Override
	public int diaryDelete(int dnum) {
		return diaryDao.diaryDelete(dnum);
	}

	
	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		}catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return isCopy;
	}
	

}
