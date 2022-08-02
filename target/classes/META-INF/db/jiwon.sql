-- CREATE TABLE & SEQUENCE
    -- ADMIN
    DROP TABLE ADMIN CASCADE CONSTRAINTS;
    CREATE TABLE ADMIN (
        aID VARCHAR2(15) PRIMARY KEY,
        aPW VARCHAR2(15),
        aGRADE NUMBER(1)
    );
    -- MEMBER
    DROP TABLE MEMBER CASCADE CONSTRAINTS;
    CREATE TABLE MEMBER(
        mID VARCHAR2(15) PRIMARY KEY,
        mPW VARCHAR2(15) NOT NULL,
        mNAME VARCHAR2(30) NOT NULL,
        mBIRTH DATE,
        mEMAIL VARCHAR2(30) UNIQUE NOT NULL,
        mMOTTO VARCHAR2(100),
        mSTATUS NUMBER(1) DEFAULT 1 NOT NULL
    );
    -- TEAM
    DROP SEQUENCE TEAM_SEQ;
    CREATE SEQUENCE TEAM_SEQ
        NOCACHE
        NOCYCLE;
    DROP TABLE TEAM CASCADE CONSTRAINTS;
    CREATE TABLE TEAM(
        tNO NUMBER(8) PRIMARY KEY,
        tNAME VARCHAR2(100) NOT NULL,
        tGOAL VARCHAR2(100)
    );
    --TEAM_MEMBER
    DROP SEQUENCE TEAM_MEMBER_SEQ;
    CREATE SEQUENCE TEAM_MEMBER_SEQ
        NOCACHE
        NOCYCLE;
    DROP TABLE TEAM_MEMBER CASCADE CONSTRAINTS;
    CREATE TABLE TEAM_MEMBER(
        tmNO NUMBER(8) PRIMARY KEY,
        mID VARCHAR2(15) REFERENCES MEMBER(mID) NOT NULL,
        tNO NUMBER(8) REFERENCES TEAM(tNO) NOT NULL
    );
    --TEAM_TODO
    DROP SEQUENCE TEAM_TODO_SEQ;
    CREATE SEQUENCE TEAM_TODO_SEQ
        NOCACHE
        NOCYCLE;
    DROP TABLE TEAM_TODO CASCADE CONSTRAINTS;
    CREATE TABLE TEAM_TODO(
        ttNO NUMBER(8) PRIMARY KEY,
        tNO NUMBER(8) REFERENCES TEAM(tNO),
        ttCONTENT VARCHAR2(4000) NOT NULL,
        ttCHECK NUMBER(2) DEFAULT 0 NOT NULL,
        tmNO NUMBER(8) REFERENCES TEAM_MEMBER(tmNO),
        ttORDER NUMBER(6),
        ttRDATE DATE DEFAULT SYSDATE
    );
    -- TEAMBOARD
    DROP SEQUENCE TEAMBOARD_SEQ;
    CREATE SEQUENCE TEAMBOARD_SEQ
        NOCACHE
        NOCYCLE;
    DROP TABLE TEAMBOARD CASCADE CONSTRAINTS;
    CREATE TABLE TEAMBOARD(
        tNUM NUMBER(8) PRIMARY KEY,
        mID VARCHAR2(15) REFERENCES MEMBER(mID),
        tTITLE VARCHAR2(100) NOT NULL,
        tCONTENT CLOB NOT NULL,
        tFILENAME VARCHAR2(100),
        tHIT NUMBER(8),
        tRDATE DATE DEFAULT SYSDATE,
        tGROUP NUMBER(8),
        tSTEP NUMBER(4),
        tINDENT NUMBER(4),
        tIP VARCHAR2(20)
    );
    -- TEAM_COMMENTBOARD
    DROP SEQUENCE TEAM_COMMENTBOARD_SEQ;
    CREATE SEQUENCE TEAM_COMMENTBOARD_SEQ
        NOCACHE
        NOCYCLE;
    DROP TABLE TEAM_COMMENTBOARD CASCADE CONSTRAINTS;
    CREATE TABLE TEAM_COMMENTBOARD(
        tcNUM NUMBER(8) PRIMARY KEY,
        mID VARCHAR2(15) REFERENCES MEMBER(mID),
        tNUM NUMBER(8) REFERENCES TEAMBOARD(tNUM),
        tcCONTENT VARCHAR2(1000) NOT NULL,
        tcRDATE DATE DEFAULT SYSDATE,
        tcGROUP NUMBER(8),
        tcSTEP NUMBER(4),
        tcINDENT NUMBER(4),
        tcIP VARCHAR2(20)
    );
--DAO QUERY
    -- Member
    INSERT INTO MEMBER (mID, mPW, mNAME, mBIRTH, mEMAIL, mMOTTO, mSTATUS) 
        VALUES ('aaa', '111', '박박박', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'park@park.com', NULL, 1);
    -- ADMIN
    -- 관리자 등록
    INSERT INTO ADMIN (aID, aPW, aGRADE)
        VALUES ('ADMINaaa', '111', 0);
    -- 일반 관리자
    -- 회원 탈퇴 시키기
    UPDATE MEMBER SET mSTATUS = 0
        WHERE mID='aaa';
    SELECT * FROM MEMBER;
    -- 회원 복구
    UPDATE MEMBER SET mSTATUS = 1
        WHERE mID='aaa';
    -- 회원 리스트 출력
    SELECT * FROM 
        (SELECT ROWNUM RN, A.* FROM 
        (SELECT M.* FROM MEMBER M
                    ORDER BY mID, mSTATUS DESC) A)
        WHERE RN BETWEEN 1 AND 11;
    SELECT * FROM MEMBER;
    -- TEAM(make TEAM)
    -- (1) 팀 만들기
    INSERT INTO TEAM (tNO, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'myLOG', '팀프빠샤');
    select * from team;
    -- (2) 팀 삭제
    DELETE FROM TEAM WHERE tNO=2;
    COMMIT;
    -- (3) 팀명 변경, 팀목표 쓰기, 팀목표 변경
    UPDATE TEAM SET tNAME = 'mylog',
                    tGOAL = '팀프빠샤빠샤!'
                WHERE tNO = 1;
    
    -- TEAM_MEMBER(join team)
    -- (1) 팀원 가입
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO)
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'aaa', 1);
    SELECT * FROM TEAM_MEMBER;
    -- (2) 팀원 탈퇴
    DELETE FROM TEAM_MEMBER WHERE tmNO=1;
    DELETE FROM TEAM_MEMBER WHERE mID='aaa' AND tNO=1;
    -- (3) 팀원 리스트
    SELECT mID FROM TEAM_MEMBER WHERE tNO=1;
    -- (4) 팀 인원수
    SELECT COUNT(*) FROM TEAM_MEMBER WHERE tNO=1;

    --TEAM_TODO(★ 수정가능성이 많습니다.)
    -- (1) 팀 투두 리스트     (★되는지 봐야함)
    SELECT TT.*, TM.mID 
        FROM TEAM_TODO TT, TEAM_MEMBER TM, TEAM T
        WHERE TT.tmNO=TM.tmNO AND T.TNO= TT.TNO AND TT.tNO=1
        ORDER BY ttORDER;
    -- (2) 팀 투두 항목 생성
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE)
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 1, 'ppt만들기', 0, 2, TEAM_TODO_SEQ.CURRVAL, SYSDATE);
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE)
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 1, 'service단 만들기', 0, 2, TEAM_TODO_SEQ.CURRVAL, SYSDATE);
    -- (3) 팀 투두 항목 삭제
    DELETE FROM TEAM_TODO WHERE ttNO=3;
    -- (4) 팀 투두 항목 순서 바꾸기
    UPDATE TEAM_TODO SET ttORDER = 2
                    WHERE ttNO=1;
    -- (5) 팀 투두 체크
    UPDATE TEAM_TODO SET ttCHECK = 1
                    WHERE ttNO=1 AND tmNO=1;
    -- (6) 팀 투두 리스트 삭제
    DELETE FROM TEAM_TODO WHERE tNO=1;
                    
    --TEAMBOARD
    -- (1) 글목록(startRow부터 endRow까지)
    SELECT * FROM 
        (SELECT ROWNUM RN, A.* FROM 
        (SELECT T.* FROM TEAMBOARD T
                    ORDER BY tGROUP DESC, tSTEP) A)
        WHERE RN BETWEEN 1 AND 11; -- DAO에 들어갈 QUERY
    -- (2) 글갯수
    SELECT COUNT(*) FROM TEAMBOARD;
    -- (3) 글쓰기(원글)
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tFILENAME,  
            tGROUP, tSTEP, tINDENT, tIP)
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'aaa','title','content', null, 
            TEAMBOARD_SEQ.CURRVAL, 0, 0, '192.168.10.01');
    -- (4) Hit 하나 올리기(1번글 조회수 하나 올리기)
    UPDATE TEAMBOARD SET tHIT = tHIT +1 WHERE tNUM=1;
    -- (5) NUM으로 글 dto보기
    SELECT T.* FROM TEAMBOARD T WHERE tNUM=1;
    -- (6) 글 수정하기
    UPDATE TEAMBOARD SET tTITLE = '바뀐제목',
                        tCONTENT = '본문',
                        tFILENAME = NULL,
                        tIP = '192.168.151.10',
                        tRDATE = SYSDATE
                WHERE tNUM = 1;
    -- (7) 글 삭제하기(NUM으로 삭제하기)
    COMMIT;
    DELETE FROM TEAMBOARD WHERE tNUM=3;
    ROLLBACK;
    -- (8) 답변글 추가전 STEP a 수행
    UPDATE TEAMBOARD SET tSTEP = tSTEP+1 
        WHERE tGROUP = 1 AND tSTEP>0;
    -- (9) 답변글 쓰기
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tFILENAME,
            tGROUP, tSTEP, tINDENT, tIP)
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'aaa','reply','content', null,
            1, 1, 1, '192.168.10.151');
    
    -- TEAM_COMMENTBOARD
    -- (1) 댓글목록(startRow부터 endRow까지)
        -- 그냥 출력 시 사용
        SELECT TR.* FROM TEAM_COMMENTBOARD TR WHERE tNUM=1 
                    ORDER BY tcGROUP DESC, tcSTEP;
    SELECT * FROM 
        (SELECT ROWNUM RN, A.* FROM 
        (SELECT TC.* FROM TEAM_COMMENTBOARD TC WHERE tNUM=1
                    ORDER BY tcGROUP DESC, tcSTEP) A)
        WHERE RN BETWEEN 1 AND 11; -- DAO에 들어갈 QUERY
    -- (2) 댓글갯수
    SELECT COUNT(*) FROM TEAM_COMMENTBOARD;
    -- (3) 댓글쓰기(원글)
    INSERT INTO TEAM_COMMENTBOARD (tcNUM, mID, tNUM, tcCONTENT, 
            tcGROUP, tcSTEP, tcINDENT, tcIP)
        VALUES (TEAM_COMMENTBOARD_SEQ.NEXTVAL, 'aaa', 1, 'commentContent',
            TEAM_COMMENTBOARD_SEQ.CURRVAL, 0, 0, '192.168.10.01');
    -- (4) 댓글 수정하기
    UPDATE TEAM_COMMENTBOARD SET tcCONTENT = '바뀐댓글',
                         tcIP = '192.168.151.10',
                         tcRDATE = SYSDATE
                WHERE tcNUM = 1;
    -- (5) 글 삭제하기(NUM으로 삭제하기)
    COMMIT;
    DELETE FROM TEAM_COMMENTBOARD WHERE tcNUM=1;
    ROLLBACK;
    -- (6) 답댓글 추가전 STEP a 수행
    UPDATE TEAM_COMMENTBOARD SET tcSTEP = tcSTEP+1 
        WHERE tcGROUP = 1 AND tcSTEP>0;
    -- (7) 답댓글 쓰기
    INSERT INTO TEAM_COMMENTBOARD (tcNUM, mID, tNUM, tcCONTENT,
            tcGROUP, tcSTEP, tcINDENT, tcIP)
        VALUES (TEAM_COMMENTBOARD_SEQ.NEXTVAL, 'aaa', 1, 'reply',
            1, 1, 1, '192.168.10.151');
    
    
    