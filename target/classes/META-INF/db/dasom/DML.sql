--관리자
INSERT INTO ADMIN (aID, aPW, aGRADE)
        VALUES ('d111', '111', 0);
commit;
--관리자 목록
SELECT * FROM ADMIN;
--관리자 등록

--관리자 삭제
DELETE FROM ADMIN WHERE AID='MMM';
--타임테이블
SELECT * FROM TTABLE;
SELECT * FROM TIMER;
	INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPINDENT, RPMENTION, RPIP)
   			 VALUES(RPSEQ.NEXTVAL, 2, 'aaa', '테스트합니다', SYSDATE, 2, 1, NULL,'127.01.01');
             
   INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'AAA');       
   commit;
SELECT * FROM HASHTAG;
SELECT * FROM BOARD_TAG;
SELECT * FROM RBOARD;
--해시태그로 검색하기
SELECT max(hname) FROM HASHTAG WHERE HNAME = '공부';
SELECT * FROM (SELECT ROWNUM RN, A.*
    FROM(SELECT RBOARD.* FROM BOARD_TAG JOIN RBOARD ON RBOARD.RNUM=BOARD_TAG.RNUM
WHERE BOARD_TAG.HNO =2)A)
    WHERE RN BETWEEN 1 AND 30;
SELECT COUNT(*) CNT FROM RBOARD WHERE RTITLE LIKE '%'||'테스트'||'%';
SELECT MAX(HNO) FROM HASHTAG WHERE HNAME='공부';
SELECT COUNT(*) CNT FROM RBOARD WHERE RTITLE LIKE '%'||'공부'||'%';
        SELECT *
    FROM(SELECT ROWNUM RN, A.*
        FROM(SELECT R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS cnt FROM RBOARD R, MEMBER M WHERE M.MID = R.MID AND RTITLE LIKE '%'||'테스트'||'%' ORDER BY RRDATE DESC)A)
    WHERE RN BETWEEN 1 AND 30;


SELECT COUNT(*) CNT FROM(SELECT H.HNAME FROM BOARD_TAG B, HASHTAG H WHERE B.HNO = H.HNO AND B.HNO =3);
SELECT H.HNAME FROM BOARD_TAG B, HASHTAG H WHERE B.HNO = H.HNO AND B.HNO =3; 
SELECT * FROM HASHTAG;
SELECT ROWNUM RN, A.*
    FROM(SELECT RBOARD.* FROM BOARD_TAG JOIN RBOARD ON RBOARD.RNUM=BOARD_TAG.RNUM
WHERE BOARD_TAG.HNO=1)A;

SELECT * FROM HASHTAG;
SELECT RBOARD.* FROM BOARD_TAG JOIN RBOARD ON RBOARD.RNUM=BOARD_TAG.RNUM
WHERE BOARD_TAG.HNO=1;

SELECT HNO FROM BOARD_TAG B, RBOARD R WHERE B.RNUM = R.RNUM; 
SELECT COUNT(*) CNT FROM RBOARD;
SELECT * FROM RBOARD;
SELECT * FROM RPBOARD;
SELECT *
    			FROM(SELECT ROWNUM RN, A.*
       				 FROM(SELECT R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS cnt FROM RBOARD R, MEMBER M WHERE M.MID = R.MID ORDER BY RRDATE DESC)A)
   				 WHERE RN BETWEEN 1 AND 30;
INSERT INTO RPBOARD (RPNUM, RNUM, MID, RPCONTENT, RPDATE,RPGROUP, RPINDENT, RPIP)
   			 VALUES (RPSEQ.NEXTVAL,1, 'aaa', '테스트합니다', SYSDATE, RPSEQ.CURRVAL, 0, '127.10.01');
commit;
SELECT HNAME FROM BOARD_TAG B, HASHTAG H WHERE H.HNO=B.HNO;
SELECT R.* FROM RBOARD R, BOARD_TAG B WHERE R.RNUM = B.RNUM AND HNAME LIKE '%공부%';

SELECT HNO FROM BOARD_TAG B, RBOARD R WHERE B.RNUM = R.RNUM; 

SELECT * FROM RBOARD;
SELECT * FROM RPBOARD;

INSERT INTO RPBOARD (RPNUM, RNUM, MID, RPCONTENT, RPDATE,RPGROUP, RPINDENT, RPIP)
   			 VALUES (RPSEQ.NEXTVAL,1, 'aaa', '테스트합니다', SYSDATE, RPSEQ.CURRVAL, 0, '127.10.01');
commit;
--확인용
INSERT INTO TTABLE(TBNO, TNO, MID, TBSHOUR, TBSMIN, TBEHOUR, TBEMIN) 
VALUES(TBSEQ.NEXTVAL, 31,'aaa', 12, 10 ,14,30 );
INSERT INTO TIMER(TNO, MID, TTODAY, TNAME, TDO, TPAUSE, TDURING, TSTART, TEND) 
    		VALUES(TSEQ.NEXTVAL,'aaa', SYSDATE, '개발' ,60,0 , 60, 0, 0 );
commit;
select * from timer;
select * from TTABLE;
--생성
INSERT INTO TTABLE(TBNO, TNO, MID, TBSHOUR, TBSMIN, TBEHOUR, TBEMIN) 
VALUES(TBSEQ.NEXTVAL, 1,'aaa', 21, 10 ,23,20 );

--시작한 시간
UPDATE TTABLE SET TBSHOUR = 4, TBSMIN = 50 WHERE TBNO =1;

--끝난 시간
UPDATE TTABLE SET TBEHOUR = 7, TBEMIN =20 WHERE TBNO =1;
--시작 끝 한번에
UPDATE TTABLE SET TBSHOUR = 4, TBSMIN = 50, TBEHOUR = 7, TBEMIN =20 WHERE TBNO =1;
--LIST로 가져오기
SELECT B.*, TDURING, T.TNAME, TTODAY FROM TTABLE B, TIMER T WHERE B.TNO=T.TNO AND B.MID='aaa';
SELECT TTODAY FROM TIMER WHERE ttoday=sysdate;

SELECT to_char(TTODAY, 'yyyy-mm-dd'), ttoday FROM TIMER where to_char(TTODAY, 'yyyy-mm-dd')=to_char(sysdate, 'yyyy-mm-dd');

SELECT B.*, TDURING, T.TNAME, TTODAY FROM TTABLE B, TIMER T WHERE B.TNO=T.TNO AND B.MID='aaa' AND TO_CHAR(TTODAY, 'yy/mm/dd')=TO_CHAR(SYSDATE, 'yy/mm/dd');
SELECT B.*, TDURING, T.TNAME, T.TTODAY FROM TTABLE B, TIMER T WHERE B.TNO=T.TNO AND B.MID='aaa' AND TTODAY= '22/08/08';
SELECT B.*, TDURING, T.TNAME, T.TTODAY FROM TTABLE B, TIMER T WHERE B.TNO=T.TNO AND T.TTODAY = to_char(SYSDATE, 'yy/mm/dd');
SELECT B.*, TDURING, T.TNAME, T.TTODAY FROM TTABLE B, TIMER T WHERE B.TNO=T.TNO AND B.MID='aaa' AND TTODAY=SYSDATE;
SELECT B.*, TDURING, T.TNAME, T.TTODAY FROM TTABLE B, TIMER T WHERE B.TNO=T.TNO AND B.MID='aaa' AND T.TNO =2;
SELECT to_CHAR(SYSDATE, 'yy/mm/dd') FROM DUAL;
SELECT TTODAY FROM TIMER where TTODAY = to_char(sysdate, 'yy/mm/dd');
--TNO로 가져오기
SELECT B.*, TDURING FROM TTABLE B, TIMER T WHERE B.TNO=1;

--TBNO로 가져오기

SELECT B.*, TDURING FROM TTABLE B, TIMER T WHERE TBNO=1;

SELECT MAX(TBNO)TBNO FROM TTABLE;
-----------
--TNO로 타이머 불러오기
SELECT * FROM TIMER WHERE TNO = 109;
SELECT * FROM TIMER WHERE mid = 'aaa' and tend>0;
--타이머 들어가는 폼
INSERT INTO TIMER(TNO, MID, TTODAY, TNAME, TDO, TSTART, TEND) VALUES(TSEQ.NEXTVAL,'aaa', SYSDATE, '기타',2,0,0 );
--타이머 눌렀을 때(START)
UPDATE TIMER SET TSTART = 0 WHERE TNO = 94; 
--타이머 눌렀을 때 (END)
UPDATE TIMER SET TEND = 0 WHERE TNO = 1; 
UPDATE TIMER SET TSTART = 0 , TEND = 2 WHERE TNO = 1;

UPDATE TIMER SET TDURING = 1 WHERE TNO = 95;
COMMIT;
SELECT * FROM TIMER;

SELECT TNO, TNAME, TDO, TPAUSE, TDURING,TSTART, TEND FROM TIMER WHERE MID='aaa';
SELECT MAX(TNO)TNO FROM TIMER;
SELECT MAX(TNO)TNO FROM TIMER WHERE TEND>0;
SELECT * FROM HASHTAG;
SELECT * FROM BOARD_TAG;
SELECT * FROM RBOARD;
SELECT * FROM RPBOARD;
SELECT * FROM MEMBER;

--

-- 회원
--추가
INSERT INTO MEMBER(MID, MPW, MNAME, MBIRTH,MEMAIL,MMOTTO,MSTATUS  ) 
VALUES ('aaa', '111', '이토끼토끼', '89-01-01', 'bunny0101@naver.com', '살다보면 좋은 일이 생긴다', 1);

--감상문
--추가
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '테스트보드','테스트보드입니다', NULL, SYSDATE, 0,'124.01.01');
--수정

UPDATE RBOARD SET RTITLE = '테스트1',
            RCONTENT='테스트1입니다', 
            RFILENAME = NULL,
            RSTATUS= 1
            WHERE RNUM=2;

            
--삭제(할때 해시태그도 삭제되어야함)
DELETE RBOARD WHERE RNUM =0;
 (SELECT COUNT(*) FROM RPBOARD B WHERE B.RNUM= R.RNUM);
 

--출력

SELECT *
    FROM(SELECT ROWNUM RN, A.*
        FROM(SELECT R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS cnt FROM RBOARD R, MEMBER M WHERE M.MID = R.MID ORDER BY RRDATE DESC)A)
    WHERE RN BETWEEN 1 AND 30;

SELECT * FROM MEMBER;

SELECT *
    FROM(SELECT ROWNUM RN, A.*
        FROM(SELECT R.*, MNAME FROM RBOARD R, MEMBER M WHERE M.MID = R.MID ORDER BY RRDATE DESC)A)
    WHERE RN BETWEEN 1 AND 30;
SELECT *
    FROM(SELECT ROWNUM RN, A.*
        FROM(SELECT R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS cnt FROM RBOARD R, MEMBER M WHERE M.MID = R.MID ORDER BY RRDATE DESC)A)
    WHERE RN BETWEEN 1 AND 30;
SELECT ROWNUM RN, A.*
    FROM(SELECT R.*, MNAME FROM RBOARD R, MEMBER M WHERE M.MID = R.MID ORDER BY RRDATE DESC)A;
SELECT R.*, MNAME FROM RBOARD R, MEMBER M WHERE M.MID = R.MID ORDER BY RRDATE DESC;

--나의 감상문 리스트
SELECT *FROM(SELECT ROWNUM RN, A.*
				FROM(SELECT R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS
				cnt FROM RBOARD R, MEMBER M WHERE M.MID = R.MID and r.mid='aaa' AND RTITLE LIKE
				'%'||''||'%' ORDER BY RRDATE DESC)A)
			WHERE RN BETWEEN 1 AND 30;
            
--나의 감상문 갯수
SELECT COUNT(*)RCNT 
    FROM(SELECT ROWNUM RN, A.*
				FROM(SELECT R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS
				cnt FROM RBOARD R, MEMBER M WHERE M.MID = R.MID and r.mid='aaa' AND RTITLE LIKE
				'%'||''||'%' ORDER BY RRDATE DESC)A);
--내가 볼 수 있는 감상문 (검색 안한 경우)
SELECT A.* 
    FROM(SELECT ROWNUM RN, r.*, MNAME, (SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS RCNT FROM RBOARD R, MEMBER M, FRIEND F
                WHERE(M.MID = R.MID AND F.MID = R.MID AND MSTATUS =1 AND RSTATUS=0) 
                 OR (M.MID=F.FID AND R.MID=F.FID AND MSTATUS =1 AND RSTATUS = 1 AND F.MID='aaa')
                  OR (M.MID=R.MID AND F.MID=R.MID AND R.MID='aaa' AND RSTATUS =2 )ORDER BY RRDATE DESC)A
                
			WHERE RN BETWEEN 1 AND 50;
SELECT * FROM RBOARD;
SELECT * FROM TTABLE;



--내가 볼 수 있는 감상문(제목 검색한 경우)

SELECT A.* 
    FROM(SELECT ROWNUM RN, r.*, MNAME, (SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS RCNT FROM RBOARD R, MEMBER M, FRIEND F
                WHERE(M.MID = R.MID AND F.MID = M.MID AND MSTATUS =1 AND RSTATUS=0 AND RTITLE LIKE
				'%'||'보드'||'%') 
                 OR (M.MID=F.FID AND R.MID=F.FID AND MSTATUS =1 AND RSTATUS = 1 AND F.MID='aaa' AND RTITLE LIKE
				'%'||'보드'||'%')
                  OR (M.MID=R.MID AND F.MID=R.MID AND R.MID='aaa' AND RSTATUS =2 AND RTITLE LIKE
				'%'||'보드'||'%') ORDER BY RRDATE DESC)A
                
			WHERE RN BETWEEN 1 AND 50;



    SELECT * FROM(SELECT ROWNUM RN, R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS cnt FROM RBOARD R, MEMBER M, FRIEND F  WHERE (M.MID = R.MID AND MSTATUS =1 AND RSTATUS=2) 
                   OR (M.MID =F.FID AND R.MID=F.FID AND MSTATUS =1 AND RSTATUS = 1 AND F.MID='aaa') 
                    OR (M.MID=R.MID AND R.MID='aaa') AND RTITLE LIKE
				'%'||''||'%' ORDER BY RRDATE DESC)
			WHERE RN BETWEEN 1 AND 30;

SELECT A.*
    FROM (SELECT ROWNUM RN, R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS cnt FROM RBOARD R, MEMBER M, FRIEND F 
        WHERE (M.MID = R.MID AND MSTATUS =1 AND RSTATUS=2) 
            OR (M.MID=F.FID AND R.MID=F.FID AND MSTATUS =1 AND RSTATUS = 1 AND F.MID='AAA') 
            OR (M.MID=R.MID AND R.MID='AAA'))A
    WHERE RN BETWEEN 1 AND 30;
    select * from rboard;
   SELECT A.*
    FROM (SELECT ROWNUM RN, R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS cnt FROM RBOARD R, MEMBER M, FRIEND F 
        WHERE (M.MID = R.MID AND MSTATUS =1 AND RSTATUS=2) 
            OR (M.MID=F.FID AND R.MID=F.FID AND MSTATUS =1 AND RSTATUS = 1 AND F.MID='aaa') 
            OR (M.MID=R.MID AND R.MID='aaa'))A
    WHERE RN BETWEEN 1 AND 30; 
    
    
    
     SELECT a.*
    FROM (SELECT ROWNUM RN, R.*, MNAME FROM RBOARD R , MEMBER M, FRIEND F
        WHERE (r.mid = m.mid and MSTATUS =1 AND RSTATUS=2))A
    WHERE RN BETWEEN 1 AND 30; 
    
   
        
   SELECT ROWNUM RN, D.*, MNAME
		                FROM DIARYBOARD D, FRIEND F, MEMBER M
		                WHERE (D.MID=M.MID AND DSTATUS = 2 AND MSTATUS = 1)  OR
		                            (D.MID=F.FID AND M.MID=F.FID AND DSTATUS = 1 AND F.MID = #{mid} AND MSTATUS = 1) OR
		                            (D.MID=M.MID AND M.MID = #{mid})
		                ORDER BY DRDATE DESC) A
		    WHERE RN BETWEEN #{startRow} AND #{endRow}
    
SELECT R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS cnt FROM RBOARD R, MEMBER M WHERE M.MID = R.MID AND RSTATUS =0 ORDER BY RRDATE DESC;

SELECT ROWNUM RN, R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS cnt FROM RBOARD R, MEMBER M, FRIEND F WHERE (M.MID = R.MID AND MSTATUS =1 AND RSTATUS=2) OR (M.MID =F.FID AND R.MID=F.FID AND MSTATUS =1 AND RSTATUS = 1 AND F.MID='aaa') OR (M.MID=R.MID AND R.MID='aaa');
--내가 볼 수 있는 감상문 개수 (검색 안 했을 때)

SELECT A.* 
    FROM(SELECT ROWNUM RN, r.*, MNAME, (SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS RCNT FROM RBOARD R, MEMBER M, FRIEND F
                WHERE(M.MID = R.MID AND F.MID = R.MID AND MSTATUS =1 AND RSTATUS=0) 
                 OR (M.MID=F.FID AND R.MID=F.FID AND MSTATUS =1 AND RSTATUS = 1 AND F.MID='aaa')
                  OR (M.MID=R.MID AND F.MID=R.MID AND R.MID='aaa' AND RSTATUS =2 )ORDER BY RRDATE DESC)A
                
			WHERE RN BETWEEN 1 AND 30;

SELECT COUNT(*)CNT FROM RBOARD R, MEMBER M, FRIEND F WHERE 
(M.MID = R.MID AND F.MID = R.MID AND MSTATUS =1 AND RSTATUS=0) 
                 OR (M.MID=F.FID AND R.MID=F.FID AND MSTATUS =1 AND RSTATUS = 1 AND F.MID='aaa')
                  OR (M.MID=R.MID AND F.MID=R.MID AND R.MID='aaa' AND RSTATUS =2 );
SELECT COUNT(*)CNT FROM RBOARD R, MEMBER M, FRIEND F WHERE (M.MID = R.MID AND MSTATUS =1 AND RSTATUS=2) OR (M.MID =F.FID AND R.MID=F.FID AND MSTATUS =1 AND RSTATUS = 1 AND F.MID='aaa') OR (M.MID=R.MID AND R.MID='aaa');
--타이틀 검색했을 때
SELECT COUNT(*)CNT FROM RBOARD R, MEMBER M, FRIEND F 
    WHERE (M.MID = R.MID AND F.MID = R.MID AND MSTATUS =1 AND RSTATUS=0 AND  RTITLE LIKE '%'||'보드'||'%') 
        OR (M.MID=F.FID AND R.MID=F.FID AND MSTATUS =1 AND RSTATUS = 1 AND F.MID='aaa' AND  RTITLE LIKE '%'||'보드'||'%') 
        OR (M.MID=R.MID AND F.MID=R.MID AND R.MID='aaa' AND RSTATUS =2 AND  RTITLE LIKE '%'||'보드'||'%');




            
            
           select * from rboard; 

            
SELECT * FROM RBOARD;
SELECT * FROM member;
--친구만 출력
SELECT * FROM RBOARD;
SELECT *
    FROM(SELECT ROWNUM RN, A.*
        FROM(SELECT R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS cnt FROM RBOARD R, MEMBER M WHERE M.MID = R.MID AND RSTATUS =1 ORDER BY RRDATE DESC)A)
    WHERE RN BETWEEN 1 AND 30;
--나만 출력
SELECT *
    FROM(SELECT ROWNUM RN, A.*
        FROM(SELECT R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS cnt FROM RBOARD R, MEMBER M WHERE M.MID = R.MID AND RSTATUS =2 ORDER BY RRDATE DESC)A)
    WHERE RN BETWEEN 1 AND 30;
--세부사항
SELECT * FROM RBOARD WHERE RNUM=2;
--조회수 올리기
UPDATE RBOARD SET RHIT = RHIT+1 WHERE RNUM=1;
--조회수 안 올리고 세부사항
SELECT * FROM RBOARD WHERE RNUM=2;
--전체 글 개수
SELECT COUNT(*)CNT FROM RBOARD;

--댓글 수
UPDATE RBOARD R SET RRPLYCNT = (SELECT COUNT(*) FROM RPBOARD WHERE RNUM=1) WHERE R.RNUM =1;

--감상문 댓글
--작성
INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPSTEP, RPINDENT,RPIP)
    VALUES (RPSEQ.NEXTVAL, 2, 'aaa', '댓글입니다', SYSDATE, RPSEQ.CURRVAL, 0,0,'127.10.10'); 
commit;
--수정
UPDATE RPBOARD SET RPCONTENT = '댓글 테스트' WHERE RPNUM = 1;
--삭제
DELETE RPBOARD WHERE RPNUM=1;
commit;
--출력
SELECT * 
    FROM(SELECT ROWNUM RN, A.* 
         FROM(SELECT P.*, MNAME FROM RPBOARD P, MEMBER M WHERE M.MID = P.MID AND RNUM=1 ORDER BY RPGROUP DESC, RPINDENT, RPDATE)A)
    WHERE RN BETWEEN 1 AND 30;
    
SELECT ROWNUM RN, A.* 
    FROM(SELECT P.*, MNAME FROM RPBOARD P, MEMBER M WHERE M.MID = P.MID ORDER BY RPGROUP DESC, RPSTEP)A;
SELECT P.*, MNAME FROM RPBOARD P, MEMBER M WHERE M.MID = P.MID ORDER BY RPGROUP DESC, RPSTEP;
--댓글 개수
SELECT COUNT(*) FROM RPBOARD WHERE RNUM=1;
    
--댓글내용보기
SELECT * FROM RPBOARD WHERE RPNUM =1;
SELECT P.*,MNAME FROM RPBOARD P, MEMBER M WHERE M.MID =P.MID AND RNUM=1;
--답댓글 전
UPDATE RPBOARD SET RPSTEP = RPSTEP+1 WHERE RPGROUP = 1 AND RPSTEP > 0;
--답댓글
INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPSTEP, RPINDENT,RPIP)
    VALUES(RPSEQ.NEXTVAL, 1, 'AAA', '답댓글', SYSDATE, 1, 1, 1, '127.01.11');
    ROLLBACK;
    COMMIT;
    
    SELECT * FROM RPBOARD;
    
    INSERT INTO RPBOARD (RPNUM, RNUM, MID, RPCONTENT, RPDATE,RPGROUP, RPINDENT, RPIP)
   			 VALUES (RPSEQ.NEXTVAL, 1, 'aaa', '테스트합니다', SYSDATE, RPSEQ.CURRVAL,  0, '127.12.01');
    
INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPINDENT, RPMENTION, RPIP)
     VALUES(RPSEQ.NEXTVAL, 1, 'aaa', '토끼는 멈머가 좋아', SYSDATE, 13, 1,'이토끼토끼', '127.10.15');
--댓글 단 사람 닉네임
SELECT R.*, MNAME FROM MEMBER M, RPBOARD R WHERE M.MID = R.MID AND RPNUM =13;
COMMIT;
SELECT ROWNUM RN, A.* FROM(SELECT R.*, MNAME FROM MEMBER M, RPBOARD R WHERE M.MID=R.MID)A;

--해시태그
commit;
INSERT INTO HASHTAG(HNO, HNAME) VALUES (HSEQ.NEXTVAL, '운동');
SELECT HNO FROM HASHTAG WHERE HNAME='공부';
SELECT * FROM HASHTAG;
SELECT * FROM BOARD_TAG WHERE RNUM =1;
SELECT * FROM BOARD_TAG;

SELECT MAX(RNUM) FROM RBOARD WHERE MID='AAA';
SELECT MAX(HNO) FROM HASHTAG WHERE HNAME='공부';
--수정
UPDATE HASHTAG SET HNAME ='#진학'
                WHERE HNO=1;
--삭제
DELETE HASHTAG WHERE HNAME ='#진학';
--해시태그 연결
SELECT * FROM HASHTAG;
select * from rboard;
select * from board_tag;
commit;
INSERT INTO BOARD_TAG(BTNO, RNUM, HNO) VALUES(BTSEQ.NEXTVAL,35, 3);
INSERT INTO BOARD_TAG(BTNO, RNUM, HNO) VALUES(BTSEQ.NEXTVAL,(SELECT MAX(RNUM) FROM RBOARD), (SELECT HNO FROM HASHTAG WHERE HNAME='#공부'));
COMMIT;
SELECT RBOARD.*
    FROM BOARD_TAG
    JOIN RBOARD ON RBOARD.RNUM = BOARD_TAG.RNUM
    WHERE BOARD_TAG.HNO = 1 AND RBOARD.RNUM=2;
    
SELECT HNAME
    FROM HASHTAG
    JOIN BOARD_TAG ON HASHTAG.HNO=BOARD_TAG.HNO
    WHERE BOARD_TAG.RNUM=2;

--해시태그 출력
SELECT HNAME FROM HASHTAG H, BOARD_TAG B WHERE H.HNO = B.HNO AND RNUM =7;

INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '테스트보드','테스트보드입니다', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '테스트2','테스트보드입니다', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '테스트3','테스트보드입니다', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '테스트4','테스트보드입니다', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '테스트5','테스트보드입니다', NULL, SYSDATE, 0,'124.01.01');
            
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '테스트6','테스트보드입니다', NULL, SYSDATE, 0,'124.01.01');

COMMIT;