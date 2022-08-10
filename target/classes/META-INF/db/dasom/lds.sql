DROP TABLE MEMBER CASCADE CONSTRAINTS;
CREATE TABLE MEMBER(
    MID VARCHAR2(15) PRIMARY KEY,
    MPW VARCHAR2(15) NOT NULL,
    MNAME VARCHAR2(30) NOT NULL,
    MBIRTH DATE,
    MEMAIL VARCHAR2(30)UNIQUE,
    MMOTTO VARCHAR2(100),
    MSTATUS NUMBER(1)DEFAULT 1
);

--감상문
DROP SEQUENCE RSEQ;
CREATE SEQUENCE RSEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
DROP TABLE RBOARD CASCADE CONSTRAINTS;
CREATE TABLE RBOARD(
    RNUM NUMBER(8) PRIMARY KEY,
    MID VARCHAR2(50) REFERENCES MEMBER(MID),
    RTITLE VARCHAR2(100) NOT NULL,
    RCONTENT CLOB NOT NULL,
    RFILENAME VARCHAR2(100),
    RRDATE DATE DEFAULT SYSDATE,
    RHIT NUMBER(8),
    RSTATUS NUMBER(1) DEFAULT 0,
    RIP VARCHAR2(20)
);

--감상문 댓글
DROP SEQUENCE RPSEQ;
CREATE SEQUENCE RPSEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
DROP TABLE RPBOARD CASCADE CONSTRAINTS;
CREATE TABLE RPBOARD(
    RPNUM NUMBER(8) PRIMARY KEY,
    RNUM NUMBER(8) REFERENCES RBOARD(RNUM),
    MID VARCHAR2(50) REFERENCES MEMBER(MID),
    RPCONTENT VARCHAR2(1000) NOT NULL,
    RPDATE DATE DEFAULT SYSDATE,
    RPGROUP NUMBER(8) NOT NULL,
    RPSTEP NUMBER(4), 
    RPINDENT NUMBER(4),
    RPIP VARCHAR2(20)
);
--해시태그
DROP SEQUENCE HSEQ;
CREATE SEQUENCE HSEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
DROP TABLE HASHTAG CASCADE CONSTRAINTS;
CREATE TABLE HASHTAG(
    HNO NUMBER(8) PRIMARY KEY,
    HNAME VARCHAR2(50) NOT NULL
);
--해시태그 이어주기ㅣ
DROP TABLE BOARD_TAG;
CREATE TABLE BOARD_TAG(
    HNO NUMBER(8) REFERENCES HASHTAG(HNO),
    RNUM NUMBER(8) REFERENCES RBOARD(RNUM)
    on delete cascade
);

--타이머
DROP SEQUENCE TSEQ;
CREATE SEQUENCE TSEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
DROP TABLE TIMER;
CREATE TABLE TIMER(
    TNO NUMBER(8) PRIMARY KEY,
    MID VARCHAR2(15) REFERENCES MEMBER(MID),
    TNAME VARCHAR2(100),
    TSTART NUMBER(8),
    TEND NUMBER(8)
);

SELECT * FROM HASHTAG;
SELECT * FROM BOARD_TAG;
SELECT * FROM RBOARD;

-- 회원
--추가
INSERT INTO MEMBER(MID, MPW, MNAME, MBIRTH,MEMAIL,MMOTTO,MSTATUS  ) 
VALUES ('AAA', '111', '이토끼', '89-01-01', 'bunny@naver.com', '살다보면 좋은 일이 생긴다', 1);

--감상문
--추가
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'AAA', '테스트보드','테스트보드입니다', NULL, SYSDATE, 0,'124.01.01');
--수정

UPDATE RBOARD SET RTITLE = '테스트1',
            RCONTENT='테스트1입니다', 
            RFILENAME = NULL,
            RSTATUS= 1
            WHERE RNUM=2;

            
--삭제(할때 해시태그도 삭제되어야함)
DELETE RBOARD WHERE RNUM =1;

--출력
SELECT *
    FROM(SELECT ROWNUM RN, A.*
    FROM(SELECT R.*, MNAME FROM RBOARD R, MEMBER M WHERE M.MID = R.MID ORDER BY RRDATE DESC)A)
    WHERE RN BETWEEN 1 AND 30;
SELECT ROWNUM RN, A.*
    FROM(SELECT R.*, MNAME FROM RBOARD R, MEMBER M WHERE M.MID = R.MID ORDER BY RRDATE DESC)A;
SELECT R.*, MNAME FROM RBOARD R, MEMBER M WHERE M.MID = R.MID ORDER BY RRDATE DESC;

--세부사항
SELECT * FROM RBOARD WHERE RNUM=2;
--조회수 올리기
UPDATE RBOARD SET RHIT = RHIT+1 WHERE RNUM=1;
--조회수 안 올리고 세부사항
SELECT * FROM RBOARD WHERE RNUM=2;
--전체 글 개수
SELECT COUNT(*)CNT FROM RBOARD;


--감상문 댓글
--작성
INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPSTEP, RPINDENT,RPIP)
    VALUES (RPSEQ.NEXTVAL, 1, 'AAA', '댓글입니다', SYSDATE, RPSEQ.CURRVAL, 0,0,'127.10.10'); 

--수정
UPDATE RPBOARD SET RPCONTENT = '댓글 테스트' WHERE RPNUM = 1;
--삭제
DELETE RPBOARD WHERE RPNUM=1;

--출력
SELECT * 
    FROM(SELECT ROWNUM RN, A.* 
         FROM(SELECT P.*, MNAME FROM RPBOARD P, MEMBER M WHERE M.MID = P.MID ORDER BY RPGROUP DESC, RPSTEP)A)
    WHERE RN BETWEEN 1 AND 30;
    
SELECT ROWNUM RN, A.* 
    FROM(SELECT P.*, MNAME FROM RPBOARD P, MEMBER M WHERE M.MID = P.MID ORDER BY RPGROUP DESC, RPSTEP)A;
SELECT P.*, MNAME FROM RPBOARD P, MEMBER M WHERE M.MID = P.MID ORDER BY RPGROUP DESC, RPSTEP;
--댓글 개수
SELECT COUNT(*) FROM RPBOARD;

--댓글내용보기
SELECT * FROM RPBOARD WHERE RPNUM=1;
--답댓글 전
UPDATE RPBOARD SET RPSTEP = RPSTEP+1 WHERE RPGROUP = 1 AND RPSTEP > 0;
--답댓글
INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPSTEP, RPINDENT,RPIP)
    VALUES(RPSEQ.NEXTVAL, 1, 'AAA', '답댓글', SYSDATE, 1, 1, 1, '127.01.11');
--해시태그
INSERT INTO HASHTAG(HNO, HNAME) VALUES (HSEQ.NEXTVAL, '#진학');

--수정
UPDATE HASHTAG SET HNAME ='#진학'
                WHERE HNO=1;
--삭제
DELETE HASHTAG WHERE HNAME ='#진학';
--해시태그 연결

INSERT INTO BOARD_TAG(RNUM, HNO) VALUES(1, 1);
COMMIT;
SELECT RBOARD.*
    FROM BOARD_TAG
    JOIN RBOARD ON RBOARD.RNUM = BOARD_TAG.RNUM
    WHERE BOARD_TAG.HNO = 1 AND RBOARD.RNUM=2;
    
SELECT HNAME
    FROM HASHTAG
    JOIN BOARD_TAG ON HASHTAG.HNO=BOARD_TAG.HNO
    WHERE BOARD_TAG.RNUM=2;
