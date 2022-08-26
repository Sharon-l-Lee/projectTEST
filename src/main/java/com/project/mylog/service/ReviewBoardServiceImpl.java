package com.project.mylog.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.dao.BoardTagDao;
import com.project.mylog.dao.HashtagDao;
import com.project.mylog.dao.ReviewBoardDao;
import com.project.mylog.dao.ReviewReplyBoardDao;
import com.project.mylog.model.FileUp;
import com.project.mylog.model.Member;
import com.project.mylog.model.ReviewBoard;
import com.project.mylog.model.ReviewReplyBoard;
import com.project.mylog.util.ReviewPaging;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {
	@Autowired
	private ReviewBoardDao rboardDao;
	@Autowired
	private ReviewReplyBoardDao replyDao;
	@Autowired
	private BoardTagDao boardtagDao;
	@Autowired
	private HashtagDao hashtagDao;

	String backupPath = "D:\\LDSwebPro\\source\\09_2nd Project\\mylog\\src\\main\\webapp\\ReviewImgUpload/";

	@Override
	public int reviewWrite(HttpSession session, HttpServletRequest request, MultipartHttpServletRequest mRequest,
			ReviewBoard reviewBoard) {
		
		String uploadPath = mRequest.getRealPath("ReviewImgUpload/");
		String rfilename = "";
		Iterator<String> params = mRequest.getFileNames();
		if (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			rfilename = mFile.getOriginalFilename();
			if (rfilename != null && !rfilename.equals("")) {// 첨부함
				if (new File(uploadPath + rfilename).exists()) {
					rfilename = System.currentTimeMillis() + "_" + rfilename;
				} // if

				try {
					mFile.transferTo(new File(uploadPath + rfilename));
					boolean result = fileCopy(uploadPath+ rfilename,  backupPath + rfilename);
					System.out.println("업로드 : " + uploadPath + rfilename);
					System.out.println("백업 : " + backupPath + rfilename);
					System.out.println(result ? "백업성공" :"백업실패");

				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}

		} else {
			// filename = "";
		}
		reviewBoard.setRfilename(rfilename);
		
		reviewBoard.setMid(((Member) (session.getAttribute("member"))).getMid());
		reviewBoard.setRip(request.getRemoteAddr());
		return rboardDao.reviewWrite(reviewBoard);
	}

	@Override
	public int reviewModify(MultipartHttpServletRequest mRequest, ReviewBoard reviewBoard, HttpServletRequest request) {
		String uploadPath = mRequest.getRealPath("ReviewImgUpload/");
		String rfilename = "";
		Iterator<String> params = mRequest.getFileNames();
		if (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			rfilename = mFile.getOriginalFilename();
			if (rfilename != null && !rfilename.equals("")) {// 첨부함
				if (new File(uploadPath + rfilename).exists()) {
					rfilename = System.currentTimeMillis() + "_" + rfilename;
				} // if

				try {
					mFile.transferTo(new File(uploadPath + rfilename));
					boolean result = fileCopy(uploadPath+ rfilename,  backupPath + rfilename);
					System.out.println("업로드 : " + uploadPath + rfilename);
					System.out.println("백업 : " + backupPath + rfilename);
					System.out.println(result ? "백업성공" :"백업실패");

				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}

		} else {
			// filename = "";
		}
		reviewBoard.setRfilename(rfilename);
		
		
		return rboardDao.reviewModify(reviewBoard);
	}

	
	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null; 
		OutputStream os = null;
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
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
	


	@Override
	public int reviewDelete(int rnum) {

		return rboardDao.reviewDelete(rnum);
	}

	@Override
	public List<ReviewBoard> reviewList(HttpSession session, String pageNum, ReviewBoard reviewBoard) {
		reviewBoard.setMid(((Member) (session.getAttribute("member"))).getMid());
//		if (reviewBoard.getShoption() == "hname") {
//			System.out.println(hashtagDao.getHno(reviewBoard.getShname()));
//			int hno = hashtagDao.getHno(reviewBoard.getShname());
//			reviewBoard.setHno(hno);
//		}
		ReviewPaging rp = new ReviewPaging(reviewCount(session, reviewBoard), pageNum);
		reviewBoard.setStartRow(rp.getStartRow());
		reviewBoard.setEndRow(rp.getEndRow());
		reviewBoard.setRtitle(reviewBoard.getShname());
		return rboardDao.reviewList(reviewBoard);
	}

	@Override
	public ReviewBoard reviewContent(int rnum) {

		return rboardDao.reviewContent(rnum);
	}

	@Override
	public void reviewHitUp() {
		rboardDao.reviewHitUp();

	}

	@Override
	public int reviewCount(HttpSession session, ReviewBoard reviewBoard) {
		reviewBoard.setMid(((Member) (session.getAttribute("member"))).getMid());
		System.out.println(5);
		if (reviewBoard.getShoption() == "hname") {
			System.out.println(reviewBoard.getShname());
			System.out.println(hashtagDao.getHno(reviewBoard.getShname()));
			int hno = hashtagDao.getHno(reviewBoard.getShname());
			reviewBoard.setHno(hno);
		}
		System.out.println(6);
		return rboardDao.reviewCount(reviewBoard);
	}

	@Override
	public int getRnum() {
		// TODO Auto-generated method stub
		return rboardDao.getRnum();
	}

	@Override
	public List<ReviewBoard> rSearchList(String pageNum, String shname) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<ReviewBoard> myReview(HttpSession session, ReviewBoard reviewBoard, String pageNum) {
		reviewBoard.setMid(((Member) (session.getAttribute("member"))).getMid());
		ReviewPaging rp = new ReviewPaging(reviewCount(session, reviewBoard), pageNum);
		reviewBoard.setStartRow(rp.getStartRow());
		reviewBoard.setEndRow(rp.getEndRow());
		reviewBoard.setRtitle(reviewBoard.getShname());
		return rboardDao.myReview(reviewBoard);
	}

	@Override
	public int myReviewCnt(HttpSession session, ReviewBoard reviewBoard) {
		reviewBoard.setMid(((Member) (session.getAttribute("member"))).getMid());
		
		return rboardDao.myReviewCnt(reviewBoard);
	}



}
