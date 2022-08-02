package com.project.mylog.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.dao.TeamBoardDao;
import com.project.mylog.model.TeamBoard;
import com.project.mylog.util.Paging;

@Service
public class TeamBoardServiceImpl implements TeamBoardService {

	@Autowired
	private TeamBoardDao teamBoardDao;
	String backupPath = "D:\\pjw\\webPro\\source\\10_2ndProject\\mylog\\src\\main\\webapp\\teamBoardFileUpload\\";
	
	@Override
	public List<TeamBoard> teamBoardList(String pageNum) {
		int teamBoardTotCnt = teamBoardDao.teamBoardTotCnt();
		Paging paging = new Paging(teamBoardTotCnt, pageNum, 15, 3);
		TeamBoard teamboard = new TeamBoard();
		teamboard.setStartRow(paging.getStartRow());
		teamboard.setEndRow(paging.getEndRow());
		return teamBoardDao.teamBoardList(teamboard);
	}

	@Override
	public int teamBoardTotCnt() {
		return teamBoardDao.teamBoardTotCnt();
	}

	@Override
	public int teamBoardWrite(MultipartHttpServletRequest mRequest, TeamBoard teamboard) {
		teamboard.setTip(mRequest.getRemoteAddr());
		boolean result = false;
		String uploadPath = mRequest.getRealPath("teamBoardFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // 파라미터이름 받음
		String tfilename = "";
		if (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터의 첨부된 파일 객체
			System.out.println("파라미터 이름 : " + param);
			tfilename = mFile.getOriginalFilename(); // param으로 첨부한 파일의 원래 이름
			if (tfilename != null && !tfilename.equals("")) { // 첨부한 파일이 있을 경우
				// 저장할 파일이름이 서버의 파일과 중복될 경우 -> 파일명 변경
				if (new File(uploadPath + tfilename).exists()) {
					tfilename = System.currentTimeMillis() + "_" + tfilename;
				}
				try {
					mFile.transferTo(new File(uploadPath + tfilename));
					System.out.println("서버파일 : " + uploadPath + tfilename);
					System.out.println("백업파일 : " + backupPath + tfilename);
					result = fileCopy(uploadPath + tfilename, backupPath + tfilename);
					System.out.println(result == true ? tfilename+" 백업성공" : tfilename + "번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일 첨부 안 할 경우
				System.out.println("파일 첨부 안 함");
				result=true;
			}
		} // if
		teamboard.setTfilename(tfilename);		//첨부한 파일 이름
		System.out.println(tfilename);
		return teamBoardDao.teamBoardWrite(teamboard);
	}

	@Override
	public int teamBoardHitUp(int tnum) {
		return teamBoardHitUp(tnum);
	}

	@Override
	public TeamBoard teamBoardDetail(int tnum) {
		teamBoardDao.teamBoardHitUp(tnum);
		return teamBoardDao.teamBoardDetail(tnum);
	}
	
	@Override	//수정이나 삭제시 사용
	public TeamBoard teamBoardModifyReplyView(int tnum) {
		return teamBoardDao.teamBoardDetail(tnum);
	}

	@Override
	public int teamBoardModify(MultipartHttpServletRequest mRequest, TeamBoard teamboard) {
		teamboard.setTip(mRequest.getRemoteAddr());
		boolean result = false;
		String uploadPath = mRequest.getRealPath("teamBoardFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // 파라미터이름 받음
		String tfilename = "";
		if (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터의 첨부된 파일 객체
			System.out.println("파라미터 이름 : " + param);
			tfilename = mFile.getOriginalFilename(); // param으로 첨부한 파일의 원래 이름
			if (tfilename != null && !tfilename.equals("")) { // 첨부한 파일이 있을 경우
				// 저장할 파일이름이 서버의 파일과 중복될 경우 -> 파일명 변경
				if (new File(uploadPath + tfilename).exists()) {
					tfilename = System.currentTimeMillis() + "_" + tfilename;
				}
				try {
					mFile.transferTo(new File(uploadPath + tfilename));
					System.out.println("서버파일 : " + uploadPath + tfilename);
					System.out.println("백업파일 : " + backupPath + tfilename);
					result = fileCopy(uploadPath + tfilename, backupPath + tfilename);
					System.out.println(result == true ? tfilename+" 백업성공" : tfilename + "번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일 첨부 안 할 경우
				System.out.println("파일 첨부 안 함");
				result=true;
			}
		} // if
		teamboard.setTfilename(tfilename);		//첨부한 파일 이름
		System.out.println(tfilename);
		return teamBoardDao.teamBoardModify(teamboard);
	}

	@Override
	public int teamBoardDelete(int tnum) {
		return teamBoardDao.teamBoardDelete(tnum);
	}

	@Override
	public int teamBoardPreReply(TeamBoard teamboard) {
		return teamBoardDao.teamBoardPreReply(teamboard);
	}

	@Override
	public int teamBoardReply(MultipartHttpServletRequest mRequest, TeamBoard teamboard) {
		teamBoardDao.teamBoardPreReply(teamboard);
		teamboard.setTip(mRequest.getRemoteAddr());
		boolean result = false;
		String uploadPath = mRequest.getRealPath("teamBoardFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // 파라미터이름 받음
		String tfilename = "";
		if (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터의 첨부된 파일 객체
			System.out.println("파라미터 이름 : " + param);
			tfilename = mFile.getOriginalFilename(); // param으로 첨부한 파일의 원래 이름
			if (tfilename != null && !tfilename.equals("")) { // 첨부한 파일이 있을 경우
				// 저장할 파일이름이 서버의 파일과 중복될 경우 -> 파일명 변경
				if (new File(uploadPath + tfilename).exists()) {
					tfilename = System.currentTimeMillis() + "_" + tfilename;
				}
				try {
					mFile.transferTo(new File(uploadPath + tfilename));
					System.out.println("서버파일 : " + uploadPath + tfilename);
					System.out.println("백업파일 : " + backupPath + tfilename);
					result = fileCopy(uploadPath + tfilename, backupPath + tfilename);
					System.out.println(result == true ? tfilename+" 백업성공" : tfilename + "번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일 첨부 안 할 경우
				System.out.println("파일 첨부 안 함");
				result=true;
			}
		} // if
		teamboard.setTfilename(tfilename);		//첨부한 파일 이름
		System.out.println(tfilename);
		return teamBoardDao.teamBoardReply(teamboard);
	}
	
	// fileCopy
		private boolean fileCopy(String serverFile, String backupFile) {
			boolean isCopy = false;
			// 복사로직
			FileInputStream is = null;
			FileOutputStream os = null;
			try {
				// 파일을 1byte씩 X 한번에 읽기위해 조정
				File file = new File(serverFile);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream(backupFile);
				byte[] buff = new byte[(int) file.length()];
				while (true) {
					int nReadByte = is.read(buff);
					if (nReadByte == -1)
						break; // 파일 끝 ->break;
					os.write(buff, 0, nReadByte);
				}
				isCopy = true;
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if (os != null)
						os.close();
					if (is != null)
						is.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return isCopy;

		}

}
