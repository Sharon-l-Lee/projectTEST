-- MEMBER
-- 이메일로 아이디 찾기
SELECT MID FROM MEMBER WHERE MEMAIL = 'aaa@naver.com' AND MSTATUS = '1';

-- 이메일과 아이디로 비밀번호 찾기
SELECT MPW FROM MEMBER WHERE MID = 'aaa' AND MEMAIL = 'aaa@naver.com' AND MSTATUS = '1';

-- 로그인
SELECT * FROM MEMBER WHERE MID = 'aaa' AND MPW = '1' AND MSTATUS = '1';

-- 회원 탈퇴
UPDATE MEMBER SET MSTATUS = 0 WHERE MID = 'aaa';



-- TODO
-- 오늘 날짜의 투두 리스트 전체 출력하기(todoList)
SELECT *
    FROM TODO
    WHERE MID = 'aaa'
        AND TDRDATE = '2022-07-28'
    ORDER BY TDCHECK, TDNO;

-- 투두 만들기(todoMake)
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '국어 노트 정리하기', '0', '2022-07-28');
    
-- 투두 미루기(todoDelay)
UPDATE TODO SET TDCHECK = 1 WHERE TDNO = 1;

-- TDNO로 TODO 가져오기(getTodo)
SELECT * FROM TODO WHERE TDNO = 1;

-- 미룬 투두를 다음 날로(todoDelayMake)
INSERT INTO TODO 
    VALUES(TODO_SEQ.NEXTVAL,  'aaa', '공부하기', 0, (SELECT TDRDATE+1 FROM TODO WHERE TDNO = 13));
 
-- 투두 완료하기
UPDATE TODO SET TCHECK = 2 WHERE TNO = 2;

-- 투두 수정하기
UPDATE TODO
    SET TDCONTENT = '영어 노트 정리하기'
    WHERE TDNO = 2;

-- 날짜로 내 투두리스트 가져오기(
SELECT * FROM TODO WHERE TDRDATE = '2022-07-28' AND MID = 'aaa';

-- 투두 삭제하기
DELETE FROM TODO WHERE TNO = 3;


-- DIARYBOARD
-- 글 작성하기(diaryWrite)
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '오늘의 반성일기', 'aaa', NULL, '오늘은 아무것도 하지 못했어요ㅠㅠ', 0, 0, '2022-07-28', '127.00.00.01');
    
-- 글 정보 가져오기
SELECT *
    FROM DIARYBOARD
    WHERE DNUM = 1;
    
-- 글 수정하기(diaryModify)
UPDATE DIARYBOARD 
    SET DTITLE = '오늘을 마무리하며...',
         DTODOIN = 1,
         DCONTENT = '오늘은 정말 완벽한 하루였어요',
         DSTATUS = 1,
         DIP = '127.0.0.01'
    WHERE DNUM = 1;

-- 글 삭제하기(diaryDelete)
DELETE FROM DIARYBOARD WHERE DNUM = 1;

-- 조회수 올리기(diaryHitup)
UPDATE DIARYBOARD SET DHIT = DHIT + 1 WHERE DNUM = 1;

-- 공개된 일기보기
SELECT D.*, MNAME
    FROM DIARYBOARD D, MEMBER M
    WHERE D.MID=M.MID AND DSTATUS = 2
    ORDER BY DRDATE DESC;
    
-- 해당 날짜의 내가 쓴 글 보기(myDirayList)
SELECT A.* 
    FROM (SELECT ROWNUM RN, D.* 
                FROM (SELECT * FROM DIARYBOARD
                            WHERE DDATE = '2022-07-28' AND MID = 'aaa'
                            ORDER BY DRDATE DESC) D ) A
    WHERE RN BETWEEN 1 AND 5;

-- 해당 날짜의 내가 쓴 글 갯수(myDirayCnt)
SELECT COUNT(*)
    FROM DIARYBOARD
        WHERE DDATE = '2022-07-28' AND MID = 'aaa';

-- 일기 상세보기(diaryContent)
SELECT D.*, MNAME 
    FROM DIARYBOARD D, MEMBER M
    WHERE D.MID=M.MID AND DNUM = 1;

-- 친구 일기 보기 (친구 테이블이랑 연결해서 해야함)
SELECT D.*, MNAME
    FROM DIARYBOARD D, FRIEND F, MEMBER M
    WHERE D.MID=F.FID AND M.MID=F.FID AND DSTATUS > 0 AND F.MID='aaa';

-- 나에게 공개된 글 (전체공개/친구공개) 모두 보기(diaryList)
SELECT A.* 
    FROM (SELECT ROWNUM RN, D.*, MNAME
                FROM DIARYBOARD D, FRIEND F, MEMBER M
                WHERE (D.MID=M.MID AND DSTATUS = 2 AND MSTATUS=1)  OR
                            (D.MID=F.FID AND M.MID=F.FID AND DSTATUS = 1 AND F.MID='aaa' AND MSTATUS=1) OR
                            (D.MID=M.MID AND M.MID='aaa')
                ORDER BY DRDATE DESC) A
    WHERE RN BETWEEN 1 AND 10;

-- 나에게 공개된 글 전체 갯수(diaryCnt)
SELECT COUNT(*) CNT
    FROM DIARYBOARD D, FRIEND F, MEMBER M
    WHERE (D.MID=M.MID AND DSTATUS = 2 AND MSTATUS=1)  OR
                (D.MID=F.FID AND M.MID=F.FID AND DSTATUS = 1 AND F.MID='aaa' AND MSTATUS=1) OR
                (D.MID=M.MID AND M.MID='aaa');




-- DIARYREPLY
-- 해당 글의 댓글 보기(replyList)
SELECT *
    FROM(SELECT ROWNUM RN, B.*
                FROM (SELECT D.*, MNAME FROM DIARYREPLY D, MEMBER M
                            WHERE D.MID=M.MID AND DNUM = 2
                            ORDER BY DRGROUP DESC, DRRDATE) B ) A
    WHERE RN BETWEEN 1 AND 10;

-- 해당 글의 댓글 개수(replyCnt)
SELECT COUNT(*) FROM DIARYREPLY WHERE DNUM = 2;

-- 해당 글에 댓글 달기(replyWrite)
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, 'aaa', '잘봤습니다', DIARYREPLY_SEQ.CURRVAL, 0, SYSDATE, '127.0.0.011');

-- 댓글 정보 가져오기(getReply)
SELECT D.*, MNAME 
    FROM DIARYREPLY D, MEMBER M 
    WHERE D.MID=M.MID AND DRNUM = 3;

-- 대댓글 달기(replyReplyWrite)
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRMENTION, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, 'bbb', '홍길동', '감사합니다2', 1, 1, SYSDATE, '127.0.0.02');

-- 댓글 수정(replyModify)
UPDATE DIARYREPLY
    SET DRCONTENT = '오늘도 화이팅입니다',
          DRIP = '127.0.0.01'
    WHERE DRNUM = 3;

-- 댓글 삭제(replyDelete)
DELETE FROM DIARYREPLY WHERE DRNUM = 1;





-- ACCOUNTCATEGORY
-- 중복된 카테고리 존재 여부(atitleCheck)
SELECT * FROM ACCOUNTCATEGORY WHERE ATITLE = '월급';

-- 카테고리 생성(categoryMake)
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '월급');
SELECT * FROM ACCOUNTCATEGORY;

-- 카테고리 리스트(categoryList)
SELECT * FROM ACCOUNTCATEGORY;




-- ACCOUNTBOOK
-- 일 가계부 보기
SELECT * 
    FROM (SELECT ROWNUM RN, A.*
                FROM (SELECT B.*, ATITLE
                            FROM ACCOUNTBOOK B, ACCOUNTCATEGORY C
                            WHERE B.ACNO = C.ACNO
                                AND MID = 'aaa'
                                AND ADATE = '2022-07-01'
                                ORDER BY ADATE DESC) A)
    WHERE RN BETWEEN 1 AND 10;

-- 일 가계부 갯수
SELECT COUNT(*) FROM ACCOUNTBOOK WHERE MID = 'aaa' AND ADATE = '2022-07-01';

-- 일 총액 보기
SELECT PLUSTOTAL+MINUSTOTAL TOTAL, PLUSTOTAL, MINUSTOTAL
    FROM (SELECT SUM(APRICE) PLUSTOTAL FROM ACCOUNTBOOK WHERE ASTATUS = 1 AND MID = 'aaa' AND ADATE = '2022-07-01'),
            (SELECT SUM(APRICE) MINUSTOTAL FROM ACCOUNTBOOK WHERE ASTATUS = 0 AND MID = 'aaa' AND ADATE = '2022-07-01');

-- 일 카테고리 총액
SELECT ATITLE, SUM(APRICE) TOTAL
		    FROM ACCOUNTBOOK B, ACCOUNTCATEGORY C
		    WHERE B.ACNO = C.ACNO
		        AND MID = 'aaa'
		        AND ADATE = '2022-07-01'
		    GROUP BY ATITLE;

-- 가계부 작성하기
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 14, '탑건봄', 18000, '2022-08-06', 0);

-- 가계부 수정하기
UPDATE ACCOUNTBOOK
    SET ACNO = 5,
         ACONTENT = '아침에 탄 택시비',
         APRICE = 11200, 
         ADATE = TO_DATE('2022-08-15 08:13:00', 'YYYY-MM-DD HH24:MI:SS'),
         ASTATUS = 0
    WHERE ANO = 9;
select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss.') from dual;
-- 가계부 삭제
DELETE FROM ACCOUNTBOOK WHERE ANO = 1;


-- 월 가계부 보기
SELECT D.*
		    FROM (SELECT ROWNUM RN, A.*
		                FROM (SELECT B.*, (SELECT ATITLE FROM ACCOUNTCATEGORY WHERE ACNO=B.ACNO)  FROM ACCOUNTBOOK B
                                      WHERE MID ='aaa'
                                        AND ADATE BETWEEN ADD_MONTHS(LAST_DAY('2022-08-08')+1,-1)
                                        AND LAST_DAY('2022-08-08')
                                    ORDER BY ADATE DESC) A ) D
		    WHERE RN BETWEEN 1 AND 10;

SELECT D.*
		    FROM (SELECT ROWNUM RN, A.*
		                FROM (SELECT B.*, ATITLE FROM ACCOUNTBOOK B, ACCOUNTCATEGORY C
                                      WHERE B.ACNO=C.ACNO
                                        AND MID ='aaa'
                                        AND ADATE BETWEEN ADD_MONTHS(LAST_DAY('2022-08-08')+1,-1)
                                        AND LAST_DAY('2022-08-08')
                                    ORDER BY ADATE DESC) A ) D
		    WHERE RN BETWEEN 1 AND 10;

SELECT B.*, ATITLE FROM ACCOUNTBOOK B, ACCOUNTCATEGORY C
		                            WHERE B.ACNO = C.ACNO
		                                AND MID = 'aaa'
		                                AND ADATE >= ADD_MONTHS(LAST_DAY('2022-07-03')+1,-1)
		                                AND  ADATE <= LAST_DAY('2022-07-03')
		                                ORDER BY ADATE DESC;

SELECT B.*, (SELECT ATITLE FROM ACCOUNTCATEGORY WHERE ACNO=B.ACNO)  FROM ACCOUNTBOOK B
		      WHERE MID ='aaa'
                AND ADATE BETWEEN ADD_MONTHS(LAST_DAY('2022-08-08')+1,-1)
                AND LAST_DAY('2022-08-08')
            ORDER BY ADATE DESC;
            
-- 월 총액 보기
SELECT INCOMETOTAL-EXPENSETOTAL TOTAL, INCOMETOTAL, EXPENSETOTAL
    FROM (SELECT SUM(APRICE) INCOMETOTAL FROM ACCOUNTBOOK WHERE ASTATUS = 1 AND MID = 'aaa' 
                AND ADATE BETWEEN (SELECT ADD_MONTHS(LAST_DAY('2022-07-03')+1,-1) FROM DUAL) AND (SELECT LAST_DAY('2022-07-01') FROM DUAL)),
            (SELECT SUM(APRICE) EXPENSETOTAL FROM ACCOUNTBOOK WHERE ASTATUS = 0 AND MID = 'aaa'
                    AND ADATE BETWEEN (SELECT ADD_MONTHS(LAST_DAY('2022-07-03')+1,-1) FROM DUAL) AND (SELECT LAST_DAY('2022-07-01') FROM DUAL));
                    
-- 카테고리별 월 지출액수 보기
SELECT ATITLE, SUM(APRICE) TOTAL
    FROM ACCOUNTBOOK B, ACCOUNTCATEGORY C
    WHERE B.ACNO = C.ACNO
        AND MID = 'aaa'
        AND ADATE BETWEEN ADD_MONTHS(LAST_DAY('2022-07-03')+1, -1)
        AND LAST_DAY('2022-07-03')
        AND ASTATUS = 0
    GROUP BY ATITLE
    ORDER BY TOTAL DESC;
    
-- 월 가계부 갯수
SELECT COUNT(*) FROM ACCOUNTBOOK 
    WHERE MID = 'aaa'
                AND ADATE BETWEEN (SELECT ADD_MONTHS(LAST_DAY('2022-08-03')+1,-1) FROM DUAL) 
                AND (SELECT LAST_DAY('2022-08-03') FROM DUAL);
                
-- 시퀀스로 가계부 가져오기
SELECT B.*, ATITLE
    FROM ACCOUNTBOOK B, ACCOUNTCATEGORY C
    WHERE B.ACNO = C.ACNO AND ANO = 1;