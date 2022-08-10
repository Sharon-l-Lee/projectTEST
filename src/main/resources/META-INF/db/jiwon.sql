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
        mID VARCHAR2(15) REFERENCES  MEMBER(mID),
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
        tNO NUMBER(8) REFERENCES TEAM(tNO) NOT NULL,
        tmCHECK NUMBER(1) DEFAULT 0 NOT NULL
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
    
    -- TEAMinBOARD
    DROP SEQUENCE TEAMinBOARD_SEQ;
    CREATE SEQUENCE TEAMinBOARD_SEQ
        NOCACHE
        NOCYCLE;
    DROP TABLE TEAMinBOARD CASCADE CONSTRAINTS;
    CREATE TABLE TEAMinBOARD(
        tiNUM NUMBER(8) PRIMARY KEY,
        tNO NUMBER(8) REFERENCES TEAM(tNO),
        tmNO NUMBER(8) REFERENCES TEAM_MEMBER(tmNO),
        tiTITLE VARCHAR2(100) NOT NULL,
        tiCONTENT CLOB NOT NULL,
        tiFILENAME VARCHAR2(100),
        tiHIT NUMBER(8),
        tiRDATE DATE DEFAULT SYSDATE,
        tiGROUP NUMBER(8),
        tiSTEP NUMBER(4),
        tiINDENT NUMBER(4),
        tiIP VARCHAR2(20)
    );
    -- TEAMin_COMMENTBOARD
    DROP SEQUENCE TEAMin_COMMENTBOARD_SEQ;
    CREATE SEQUENCE TEAMin_COMMENTBOARD_SEQ
        NOCACHE
        NOCYCLE;
    DROP TABLE TEAMin_COMMENTBOARD CASCADE CONSTRAINTS;
    CREATE TABLE TEAMin_COMMENTBOARD(
        ticNUM NUMBER(8) PRIMARY KEY,
        tiNUM NUMBER(8) REFERENCES TEAMinBOARD(tiNUM),
        tmNO NUMBER(8) REFERENCES TEAM_MEMBER(tmNO),
        ticCONTENT VARCHAR2(1000) NOT NULL,
        ticRDATE DATE DEFAULT SYSDATE,
        ticGROUP NUMBER(8),
        ticSTEP NUMBER(4),
        ticINDENT NUMBER(4),
        ticIP VARCHAR2(20)
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
        tHIT NUMBER(8) DEFAULT 0,
        tRDATE DATE DEFAULT SYSDATE,
        tGROUP NUMBER(8) DEFAULT 0,
        tSTEP NUMBER(4) DEFAULT 0,
        tINDENT NUMBER(4) DEFAULT 0,
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
        tcGROUP NUMBER(8) DEFAULT 0,
        tcSTEP NUMBER(4) DEFAULT 0,
        tcINDENT NUMBER(4) DEFAULT 0,
        tcIP VARCHAR2(20)
    );

--DAO QUERY
    -- Member
    INSERT INTO MEMBER (mID, mPW, mNAME, mBIRTH, mEMAIL, mMOTTO, mSTATUS) 
        VALUES ('aaa', '111', '박박박', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'park@park.com', NULL, 1);
    -- ADMIN
    select * from admin;
    -- 관리자 등록
    INSERT INTO ADMIN (aID, aPW, aGRADE)
        VALUES ('ADMINaaa', '111', 0);
    -- 일반 관리자
    -- 로그인
    SELECT * FROM ADMIN WHERE AID='aaa' AND APW='111';
    -- 회원 탈퇴 시키기
    UPDATE MEMBER SET mSTATUS = 0
        WHERE mID='aaa';
    SELECT * FROM MEMBER;
    -- 회원 복구
    UPDATE MEMBER SET mSTATUS = 1
        WHERE mID='aaa';
        commit;
    -- 회원 리스트 출력
    SELECT * FROM 
        (SELECT ROWNUM RN, A.* FROM 
        (SELECT M.* FROM MEMBER M
                    ORDER BY mID, mSTATUS DESC) A)
        WHERE RN BETWEEN 1 AND 11;
    commit;
    -- TEAM(make TEAM)
    -- (1) 팀 만들기
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'aaa', 'myLOG', '팀프빠샤');
        -- 팀 번호 가져오기(팀 생성 후 바로, 팀장 가입하기 위함)
        SELECT MAX(tNO) tNO FROM TEAM;
    -- (2) 팀 삭제
    DELETE FROM TEAM WHERE tNO=2;
    -- (3) 팀장 변경, 팀명 변경, 팀목표 쓰기, 팀목표 변경
    UPDATE TEAM SET mID = 'aaa',
                    tNAME = 'mylog',
                    tGOAL = '팀프빠샤빠샤!'
                WHERE tNO = 32;
    -- 팀 디테일
    SELECT * FROM TEAM WHERE tNO=2;
    -- TEAM_MEMBER(join team)
    -- 내 팀 리스트
    SELECT T.tNAME, T.MID FROM TEAM_MEMBER TM, TEAM T WHERE TM.tNO = T.tNO AND TM.tmCHECK=1 AND TM.mID='aaa';
    -- 가입신청한 팀 리스트
    SELECT T.tNAME, T.MID FROM TEAM_MEMBER TM, TEAM T WHERE TM.tNO = T.tNO AND TM.tmCHECK=0 AND TM.mID='aaa';
    SELECT * FROM TEAM_MEMBER;
    COMMIT;
    -- (1) 팀원 가입 신청
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK)
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'aaa', 1, 0);
    -- (2) 팀원 가입 신청 취소
    DELETE FROM TEAM_MEMBER WHERE tmNO='' AND tNO=4;
    DELETE FROM TEAM_MEMBER WHERE mID='aaa' AND tNO=4; 
    -- (2) 팀원 가입(가입허가/팀원 가입)
    UPDATE TEAM_MEMBER SET tmCHECK = 1
                    WHERE tmNO='' AND tNO='';
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK)
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'aaa', 1, 1);
    -- 팀 가입신청자 리스트(팀장만 가입허가 가능)
    SELECT * FROM TEAM_MEMBER WHERE tmCHECK = 0 AND tNO = 1; 
    SELECT * FROM TEAM_MEMBER;
    -- (2) 팀원 탈퇴
    DELETE FROM TEAM_MEMBER WHERE tmNO=1 AND tNO='';
    DELETE FROM TEAM_MEMBER WHERE mID='aaa' AND tNO=1;
    -- (3) 팀원 리스트
    SELECT * FROM TEAM_MEMBER WHERE tmCHECK=1 AND tNO=1;
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
    
     --TEAMinBOARD
    -- (1) 글목록(startRow부터 endRow까지)
    SELECT B.*, TM.mID FROM 
        (SELECT ROWNUM RN, A.* FROM 
            (SELECT TI.* FROM TEAMinBOARD TI
                        ORDER BY tiGROUP DESC, tiSTEP) A) B, TEAM_MEMBER TM
        WHERE B.tmNO = TM.tmNO AND RN BETWEEN 1 AND 11; -- DAO에 들어갈 QUERY
    -- (2) 글갯수
    SELECT COUNT(*) FROM TEAMinBOARD;
    -- (3) 글쓰기(원글)
    INSERT INTO TEAMinBOARD (tNUM, tNO, tmNO, tiTITLE, tiCONTENT, tiFILENAME,  
            tiGROUP, tiSTEP, tiINDENT, tiIP)
        VALUES (TEAMinBOARD_SEQ.NEXTVAL, 1, 1, 'title','content', null, 
            TEAMinBOARD_SEQ.CURRVAL, 0, 0, '192.168.10.01');
    -- (4) Hit 하나 올리기(1번글 조회수 하나 올리기)
    UPDATE TEAMinBOARD SET tiHIT = tiHIT +1 WHERE tiNUM=1;
    -- (5) NUM으로 글 dto보기
    SELECT TI.* FROM TEAMinBOARD TI WHERE tiNUM=1;
    -- (6) 글 수정하기
    UPDATE TEAMinBOARD SET tiTITLE = '바뀐제목',
                        tiCONTENT = '본문',
                        tiFILENAME = NULL,
                        tiIP = '192.168.151.10',
                        tiRDATE = SYSDATE
                WHERE tiNUM = 1;
    -- (7) 글 삭제하기(NUM으로 삭제하기)
    COMMIT;
    DELETE FROM TEAMinBOARD WHERE tiNUM=3;
    ROLLBACK;
    -- (8) 답변글 추가전 STEP a 수행
    UPDATE TEAMinBOARD SET tiSTEP = tiSTEP+1 
        WHERE tiGROUP = 1 AND tiSTEP>0;
    -- (9) 답변글 쓰기
    INSERT INTO TEAMinBOARD (tiNUM, tNO, tmNO, tiTITLE, tiCONTENT, tiFILENAME,
            tiGROUP, tiSTEP, tiINDENT, tiIP)
        VALUES (TEAMinBOARD_SEQ.NEXTVAL, 1, 1, 'reply','content', null,
            1, 1, 1, '192.168.10.151');
    
    -- TEAMin_COMMENTBOARD
    -- (1) 댓글목록(startRow부터 endRow까지)
        -- 그냥 출력 시 사용
        SELECT TiC.* FROM TEAMin_COMMENTBOARD TiC WHERE tiNUM=1 
                    ORDER BY ticGROUP DESC, ticSTEP;
    SELECT B.*, TM.MID FROM 
        (SELECT ROWNUM RN, A.* FROM 
            (SELECT TiC.* FROM TEAMin_COMMENTBOARD TiC WHERE tiNUM=1
                        ORDER BY ticGROUP DESC, ticSTEP) A) B, TEAM_MEMBER TM
        WHERE B.tmNO = TM.tmNO AND RN BETWEEN 1 AND 11; -- DAO에 들어갈 QUERY
    -- (2) 댓글갯수
    SELECT COUNT(*) FROM TEAMin_COMMENTBOARD;
    -- (3) 댓글쓰기(원글)
    INSERT INTO TEAMin_COMMENTBOARD (ticNUM, tiNUM, tmNO, ticCONTENT, 
            ticGROUP, ticSTEP, ticINDENT, ticIP)
        VALUES (TEAMin_COMMENTBOARD_SEQ.NEXTVAL, 1, 1, 'commentContent',
            TEAMin_COMMENTBOARD_SEQ.CURRVAL, 0, 0, '192.168.10.01');
    -- (4) 댓글 수정하기
    UPDATE TEAMin_COMMENTBOARD SET ticCONTENT = '바뀐댓글',
                         ticIP = '192.168.151.10',
                         ticRDATE = SYSDATE
                WHERE ticNUM = 1;
    -- (5) 글 삭제하기(NUM으로 삭제하기)
    COMMIT;
    DELETE FROM TEAMin_COMMENTBOARD WHERE ticNUM=1;
    ROLLBACK;
    -- (6) 답댓글 추가전 STEP a 수행
    UPDATE TEAMin_COMMENTBOARD SET ticSTEP = ticSTEP+1 
        WHERE ticGROUP = 1 AND ticSTEP>0;
    -- (7) 답댓글 쓰기
    INSERT INTO TEAMin_COMMENTBOARD (ticNUM, tiNUM, tmNO, ticCONTENT,
            ticGROUP, ticSTEP, ticINDENT, ticIP)
        VALUES (TEAMin_COMMENTBOARD_SEQ.NEXTVAL, 1, 1, 'reply',
            1, 1, 1, '192.168.10.151');
                    
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
        WHERE tGROUP = 10 AND tSTEP>0;
    -- (9) 답변글 쓰기
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tFILENAME,
            tGROUP, tSTEP, tINDENT, tIP)
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'aaa','reply','content', null,
            10, 1, 1, '192.168.10.151');
    
    -- TEAM_COMMENTBOARD
    select tnum from teamboard;
    -- (1) 댓글목록(startRow부터 endRow까지)
        SELECT TR.* FROM TEAM_COMMENTBOARD TR
                    ORDER BY tcGROUP DESC, tcSTEP;
        -- 그냥 출력 시 사용
        SELECT TR.* FROM TEAM_COMMENTBOARD TR WHERE tNUM=12
                    ORDER BY tcGROUP DESC, tcSTEP;
    SELECT * FROM 
        (SELECT ROWNUM RN, A.* FROM 
        (SELECT TC.* FROM TEAM_COMMENTBOARD TC WHERE tNUM=12
                    ORDER BY tcGROUP DESC, tcSTEP) A)
        WHERE RN BETWEEN 1 AND 11; -- DAO에 들어갈 QUERY
    select * from TEAM_COMMENTBOARD where tcnum=1;
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
    
    
    