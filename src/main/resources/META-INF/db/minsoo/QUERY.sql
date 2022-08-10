-- 회원

-- 이메일 중복체크 / emailCheck
SELECT * FROM MEMBER WHERE MEMAIL = 'leekr44@naver.com';

-- 아이디 중복체크 / idCheck
SELECT COUNT(*) FROM MEMBER WHERE MID = 'aaa';

-- 회원가입 / joinMember
-- 모두 입력
INSERT INTO MEMBER (MID, MPW, MNAME, MBIRTH, MEMAIL, MMOTTO, MSTATUS) VALUES ('aaa', '111', '닉네임', '2000-01-01', 'aaa@a.com', '나는 최고다', '1');

-- 생일 제외
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MMOTTO, MSTATUS) VALUES ('fff', '111', '닉네임', 'fff@f.com', '나는 최고다', '1');

-- 좌우명 제외
INSERT INTO MEMBER (MID, MPW, MNAME, MBIRTH, MEMAIL) VALUES ('ppp', '111', '닉네임', '2000-01-01', 'ppp@p.com');

-- 모두 제외
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('rrr', '111', '닉네임', 'rrr@r.com');


-- 회원정보수정
UPDATE MEMBER SET MPW = '123', MNAME = '나다', MBIRTH = '1999-01-01', MMOTTO = '나는 최강' WHERE MID = 'aaa';

-- 회원 탈퇴 / deleteMember
UPDATE MEMBER SET MSTATUS = 0 WHERE MID = 'aaa';

-- 회원 복구 / recoverMember
UPDATE MEMBER SET MSTATUS = 1 WHERE MID = 'aaa';

-- 회원리스트 페이징을 위한 query / countMember
SELECT COUNT(*) FROM MEMBER;

-- 로그인 체크 / loginCheck
SELECT * FROM MEMBER WHERE MID = 'aaa' AND MPW = '111';

-- 아이디/비밀번호 찾기 / searchIdPw
SELECT * FROM MEMBER WHERE MNAME= '닉네임' AND MEMAIL = 'aaa@a.com';

-- 아이디/비밀번호 찾기에 쓰일 query / getMemberForEmail
SELECT * FROM MEMBER WHERE MEMAIL = 'aaa@a.com';

-- 회원정보 가져오기 (회원정보수정) / getMember
SELECT * FROM MEMBER WHERE MID = 'aaa';

-- 친구 검색(내가 팔로우한 사람은 1, 팔로우하지 않은 사람은 0) / findFriend
SELECT MID, MNAME, (SELECT COUNT(*) FROM FRIEND WHERE MID = 'aaa' AND FID = MEMBER.MID) EXISTENT
			FROM MEMBER WHERE MNAME LIKE '%'||''||'%' AND NOT MID = 'aaa';

-- 페이징 회원리스트(관리자용) / memberList
SELECT * FROM 
	        (SELECT ROWNUM RN, A.* FROM 
		        (SELECT M.* FROM MEMBER M
		                    ORDER BY MSTATUS DESC,mID) A)
		        WHERE RN BETWEEN 1 AND 10;

-- 친구

-- 친구 목록 / myFriendList
SELECT FID, MNAME FROM FRIEND F, MEMBER M
			WHERE M.MID = F.FID AND F.MID = 'aaa' ORDER BY FID;

-- 친구 목록 내에서 검색 / searchMyFriend
SELECT FID, MNAME FROM FRIEND F, MEMBER M
			WHERE M.MID = F.FID AND F.MID = 'aaa' AND
				MNAME LIKE '%'||'닉네임'||'%'
			ORDER BY FID;
            
-- 친구목록 페이징을 위한 query / countMyFriend
SELECT COUNT(*) FROM FRIEND WHERE MID = 'aaa';

-- 나를 팔로우한 친구리스트 페이징을 위한 query / countFollowMe
SELECT COUNT(*) FROM (SELECT F2.MID, MNAME,(SELECT COUNT(*) FROM FRIEND F1 WHERE F1.MID = 'aaa' AND F1.FID = F2.MID) EXISTENT
								FROM FRIEND F2, MEMBER M WHERE M.MID = F2.FID AND F2.FID = 'aaa');
                                
-- 나를 팔로우한 친구 리스트 (내가 이미 팔로우한 사람은 1, 팔로우하지 않은 사람은 0) / followMe
SELECT F2.MID, MNAME, (SELECT COUNT(*) FROM FRIEND F1 WHERE F1.MID = 'aaa' AND F1.FID = F2.MID) EXISTENT
			FROM FRIEND F2, MEMBER M WHERE M.MID = F2.FID AND F2.FID = 'aaa';
            
-- 친구 팔로우 하기 / followFriend
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'bbb', 'ccc');

-- 친구 언팔로우하기 / unfollowFriend
DELETE FROM FRIEND WHERE MID = 'bbb' AND FID = 'ccc';

-- 공지사항

-- 공지사항등록 / noticeWrite
INSERT INTO NOTICEBOARD (NNO, AID, NTITLE, NCONTENT, NIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', '공지', '공지합니다', '127.0.0.1');

-- 공지사항 목록 +페이징 / noticeList
SELECT *
    FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT * FROM NOTICEBOARD ORDER BY NNO DESC) A)
    WHERE RN BETWEEN 1 AND 10;
    
-- 공지사항 수정 / noticeUpdate
UPDATE NOTICEBOARD SET NTITLE = '수정공지', NCONTENT = '수정공지합니다', NIP = '127.0.0.2'
    WHERE NNO = 1;

-- 공지사항 삭제 / noticeDelete
DELETE FROM NOTICEBOARD WHERE NNO = 2;

-- 공지사항 조회수 증가 / hitupNotice
UPDATE NOTICEBOARD SET NHIT = NHIT + 1 WHERE NNO = 1;

-- 공지사항 수정을 위한 글 가져오기 / getNotice
SELECT * FROM NOTICEBOARD WHERE NNO = 1;

-- 조회수 + 공지사항 자세히보기 / noticeContent
SELECT * FROM NOTICEBOARD WHERE NNO = 1;

-- 공지사항 수 / countNotice
SELECT COUNT(*) FROM NOTICEBOARD;


-- QNA

-- QNA 등록 / qnaWrite
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'aaa', '최강','문의드립니다', '답변주세요', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'aaa', '최강','문의드립니다', '답변주세요', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');

-- QNA 수정 / qnaUpdate
UPDATE QNABOARD SET QTITLE = '수정문의드립니다', QCONTENT = '수정답변주세요' WHERE QNO = 1;

-- QNA 삭제 / qnaDelete
DELETE FROM QNABOARD WHERE QNO = 2;

-- QNA 가져오기 / qnaContent / getQna
SELECT * FROM QNABOARD WHERE QNO = 1;

-- QNA 조회수 증가 / hitupQna
UPDATE QNABOARD SET QHIT = QHIT + 1 WHERE QNO = 1;

-- QNA 리스트 / qnaList
SELECT *
    FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT * FROM QNABOARD
                     ORDER BY QGROUP DESC, QSTEP) A)
    WHERE RN BETWEEN 1 AND 10;

-- MY QNA 리스트 / myQnaList
SELECT *
    FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT * FROM QNABOARD
                     ORDER BY QGROUP DESC, QSTEP) A)
    WHERE MID = 'qqq' AND RN BETWEEN 1 AND 10;

-- 답글 전 STEP / beforestepA
UPDATE QNABOARD SET QSTEP = QSTEP + 1 WHERE QGROUP = 1 AND QSTEP > 0;

-- 답글작성 / qnaReply
INSERT INTO QNABOARD (QNO, MID, AID, QWRITER,QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'aaa', 'admin', '관리자', '답변드립니다', '이해하셨죠?', 1, 1, 1, '127.0.0.1');

-- MY QNA 개수 / countMyQna
SELECT COUNT(*) FROM QNABOARD WHERE MID = 'aaa';

-- 전체 QNA 개수 / countQna
SELECT COUNT(*) FROM QNABOARD;


ROLLBACK;
COMMIT;




