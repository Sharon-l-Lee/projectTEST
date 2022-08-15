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
					System.out.println("업로드 : " + uploadPath + rfilename);
					System.out.println("백업 : " + backupPath + rfilename);

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
		System.out.println("서비스에 넘어온 reviewBoard : " + reviewBoard);
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
					System.out.println("업로드 : " + uploadPath + rfilename);
					System.out.println("백업 : " + backupPath + rfilename);

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

	private int filecopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int) sFile.length()];
			while (true) {
				int nRead = is.read(buff);
				if (nRead == -1) {
					break;
				}
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (FileNotFoundException e) {
			System.out.println("복사 예외0 : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("복사 예외1 : " + e.getMessage());
		} finally {
			try {
				if (os != null) {
					os.close();
				}
				if (is != null) {
					is.close();
				}
			} catch (Exception e) {
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
		System.out.println(2);
		ReviewPaging rp = new ReviewPaging(reviewCount(session, reviewBoard), pageNum);
		reviewBoard.setStartRow(rp.getStartRow());
		reviewBoard.setEndRow(rp.getEndRow());
		reviewBoard.setRtitle(reviewBoard.getShname());
		System.out.println("검색 전(Rtitle) : " + reviewBoard);
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
	public FileUp fileUp(FileUp fileUp, HttpServletRequest request) {
		String rootPath = request.getRealPath("/");
		String attachPath = "resources/ReviewImgUpload/";
		System.out.println("서버로 여기로 보낸다 : " + rootPath + attachPath);
		MultipartFile upload = fileUp.getUpload();
		String filename = "";

		if (upload != null) {
			filename = System.currentTimeMillis() + upload.getOriginalFilename();
			fileUp.setFilename(filename);
			try {
				File file = new File(rootPath + attachPath + filename);
				upload.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}

			fileUp.setAttachPath(attachPath);
			fileUp.setFilename(filename);
		}

		int result = filecopy(rootPath + attachPath + filename, backupPath + filename);
		if (result == 1) {
			System.out.println(filename + " 파일 백업 성공");
		}
		return fileUp;
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

//	@Override
//	public List<ReviewBoard> rSearchList(String pageNum, String shname) {
//		ReviewPaging rp = new ReviewPaging(reviewCount(shname), pageNum);
//		System.out.println(shname);
//		ReviewBoard reviewBoard = new ReviewBoard();
//		reviewBoard.setStartRow(rp.getStartRow());
//		reviewBoard.setEndRow(rp.getEndRow());
//		System.out.println(hashtagDao.getHno(shname));
//		int hno = hashtagDao.getHno(shname);
//		reviewBoard.setHno(hno);
//
//		return rboardDao.rSearchList(reviewBoard);
//	}

}
