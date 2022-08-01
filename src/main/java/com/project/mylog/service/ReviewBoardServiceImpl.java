package com.project.mylog.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.dao.ReviewBoardDao;
import com.project.mylog.model.ReviewBoard;
import com.project.mylog.util.ReviewPaging;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {
	@Autowired
	private ReviewBoardDao rboardDao;

	@Override
	public int reviewWrite(MultipartHttpServletRequest mRequest, ReviewBoard reviewBoard) {
		String uploadPath = mRequest.getRealPath("ReviewImgUpload/");
		String backupPath = "D:\\LDSwebPro\\source\\09_2nd Project\\mylog\\src\\main\\webapp\\ReviewImgUpload/";
		String filename = "";
		Iterator<String> params = mRequest.getFileNames();
		if (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			filename = mFile.getOriginalFilename();
			if (filename != null && !filename.equals("")) {
				filename = System.currentTimeMillis() + "_" + filename; 
			}

			try {
				mFile.transferTo(new File(uploadPath + filename));
				System.out.println("서버파일 : " + uploadPath + filename);
				System.out.println("백업파일 : " + backupPath + filename);
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			//filename = "";
		}
		reviewBoard.setRfilename(filename);
		return rboardDao.reviewWrite(reviewBoard);
	}

	@Override
	public int reviewModify(MultipartHttpServletRequest mRequest, ReviewBoard reviewBoard) {
		String uploadPath = mRequest.getRealPath("ReviewImgUpload/");
		String backupPath = "D:\\LDSwebPro\\source\\09_2nd Project\\mylog\\src\\main\\webapp\\ReviewImgUpload/";
		String filename = "";
		Iterator<String> params = mRequest.getFileNames();
		if (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			filename = mFile.getOriginalFilename();
			if (filename != null && !filename.equals("")) {
				filename = System.currentTimeMillis() + "_" + filename; 
			}

			try {
				mFile.transferTo(new File(uploadPath + filename));
				System.out.println("서버파일 : " + uploadPath + filename);
				System.out.println("백업파일 : " + backupPath + filename);
				boolean result = fileCopy(uploadPath + filename, backupPath + filename);
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			//filename = "";
		}
		reviewBoard.setRfilename(filename);
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
	public List<ReviewBoard> reviewList(String pageNum) {
		ReviewPaging rp = new ReviewPaging(reviewCount(), pageNum);
		ReviewBoard reveiwBoard = new ReviewBoard();
		reveiwBoard.setStartRow(rp.getStartRow());
		reveiwBoard.setEndRow(rp.getEndRow());
		return rboardDao.reviewList(reveiwBoard);
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
	public int reviewCount() {
		return rboardDao.reviewCount();
	}

}
