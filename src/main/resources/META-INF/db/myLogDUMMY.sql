-- 회원 더미
INSERT INTO MEMBER (MID, MPW, MNAME, MBIRTH, MEMAIL, MMOTTO, MSTATUS)
    VALUES ('aaa', '111', '닉네임', '2000-01-01', 'aaa@a.com', '나는 최고다', '1');
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MMOTTO, MSTATUS)
    VALUES ('fff', '111', '누구', 'fff@f.com', '나는 최고다', '1');
INSERT INTO MEMBER (MID, MPW, MNAME, MBIRTH, MEMAIL)
    VALUES ('ppp', '111', '아무개', '2000-01-01', 'ppp@p.com');
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('rrr', '111', '홍길동', 'rrr@r.com');
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('bbb', '111', '정길동', 'bbb@b.com');
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('ccc', '111', '박지원', 'ccc@c.com');
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('ddd', '111', '김유진', 'ddd@d.com');
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('ggg', '111', '이다솜', 'ggg@g.com');
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('hhh', '111', '정민수', 'hhh@h.com');
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('iii', '111', '김빈', 'iii@i.com');
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('jjj', '111', '구윤서', 'jjj@j.com');
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('kkk', '111', '박동규', 'kkk@k.com');
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('lll', '111', '누구냐', 'lll@l.com');
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('eee', '111', '박소정', 'eee@l.com');

--관리자 등록
INSERT INTO ADMIN (aID, aPW, aGRADE) VALUES ('admin', '111', 1);
INSERT INTO ADMIN (aID, aPW, aGRADE) VALUES ('a111', '111', 1);
INSERT INTO ADMIN (aID, aPW, aGRADE) VALUES ('b111', '111', 1);
INSERT INTO ADMIN (aID, aPW, aGRADE) VALUES ('c111', '111', 1);
INSERT INTO ADMIN (aID, aPW, aGRADE) VALUES ('d111', '111', 1);
INSERT INTO ADMIN (aID, aPW, aGRADE) VALUES ('e111', '111', 1);

-- Q&A 더미
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'aaa', '닉네임','JAVA 관련 문의드립니다', '연산자가 너무 쉬워요. 조금더 어렵게 하는 방법이 있을까요?', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'fff', '누구','ORACLE 관련 문의드립니다', '쿼리가 너무 쉬워요. 조금더 어렵게 하는 방법이 있을까요?', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'ppp', '아무개','IF문 관련 문의드립니다', 'IF문이 너무 쉬워요. 조금더 어렵게 하는 방법이 있을까요?', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'rrr', '홍길동','FOR문 관련 문의드립니다', 'FOR문이 너무 쉬워요. 조금더 어렵게 하는 방법이 있을까요?', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'bbb', '정길동','MYSQL 관련 문의드립니다', 'MYSQL이 너무 쉬워요. 조금더 어렵게 하는 방법이 있을까요?', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'ccc', '박지원','HTML 관련 문의드립니다', 'HTML이 너무 쉬워요. 조금더 어렵게 하는 방법이 있을까요?', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'ddd', '김유진','CSS 관련 문의드립니다', 'CSS가 너무 쉬워요. 조금더 어렵게 하는 방법이 있을까요?', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'ggg', '이다솜','JDBC 관련 문의드립니다', 'JDBC가 너무 쉬워요. 조금더 어렵게 하는 방법이 있을까요?', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'hhh', '정민수','JSP 관련 문의드립니다', 'JSP가 너무 쉬워요. 조금더 어렵게 하는 방법이 있을까요?', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'iii', '김빈','SPRING 관련 문의드립니다', 'SPRING이 너무 쉬워요. 조금더 어렵게 하는 방법이 있을까요?', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');

-- 친구 더미
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'fff', 'aaa');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'ppp', 'aaa');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'rrr', 'aaa');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'bbb', 'aaa');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'ccc', 'aaa');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'ddd', 'aaa');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'hhh', 'aaa');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'ggg', 'aaa');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'iii', 'aaa');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'jjj', 'aaa');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'kkk', 'aaa');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'lll', 'aaa');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'fff');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'ppp');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'rrr');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'bbb');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'ccc');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'ddd');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'ggg');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'hhh');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'iii');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'jjj');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'kkk');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'lll');


-- 공지 더미
INSERT INTO NOTICEBOARD (NNO, AID, NTITLE, NCONTENT, NIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', 'JAVA 관련 공지', 'JAVA가 어려워졌음을 알립니다', '127.0.0.1');
INSERT INTO NOTICEBOARD (NNO, AID, NTITLE, NCONTENT, NIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', 'IF문 관련 공지', 'IF문이 어려워졌음을 알립니다', '127.0.0.1');
INSERT INTO NOTICEBOARD (NNO, AID, NTITLE, NCONTENT, NIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', 'FOR문 관련 공지', 'FOR문이 어려워졌음을 알립니다', '127.0.0.1');
INSERT INTO NOTICEBOARD (NNO, AID, NTITLE, NCONTENT, NIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', 'ORACLE 관련 공지', 'ORACLE이 어려워졌음을 알립니다', '127.0.0.1');
INSERT INTO NOTICEBOARD (NNO, AID, NTITLE, NCONTENT, NIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', 'HTML 관련 공지', 'HTML이 어려워졌음을 알립니다', '127.0.0.1');
INSERT INTO NOTICEBOARD (NNO, AID, NTITLE, NCONTENT, NIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', 'CSS 관련 공지', 'CSS가 어려워졌음을 알립니다', '127.0.0.1');
INSERT INTO NOTICEBOARD (NNO, AID, NTITLE, NCONTENT, NIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', 'JSP 관련 공지', 'JSP가 어려워졌음을 알립니다', '127.0.0.1');
INSERT INTO NOTICEBOARD (NNO, AID, NTITLE, NCONTENT, NIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', 'SPRING 관련 공지', 'SPRING이 어려워졌음을 알립니다', '127.0.0.1');
INSERT INTO NOTICEBOARD (NNO, AID, NTITLE, NCONTENT, NIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', 'JDBC 관련 공지', 'JDBC가 어려워졌음을 알립니다', '127.0.0.1');
INSERT INTO NOTICEBOARD (NNO, AID, NTITLE, NCONTENT, NIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', 'MYSQL 관련 공지', 'MYSQL이 어려워졌음을 알립니다', '127.0.0.1');


-- 알림 생성
INSERT INTO ALERT_CODE VALUES (ALERT_CODE_SEQ.NEXTVAL, '팔로우');
INSERT INTO ALERT_CODE VALUES (ALERT_CODE_SEQ.NEXTVAL, '언팔로우');
INSERT INTO ALERT (ALNO, MID, FID, ALCODE) VALUES (ALERT_SEQ.NEXTVAL, 'aaa', 'fff', 1);
INSERT INTO ALERT (ALNO, MID, FID, ALCODE) VALUES (ALERT_SEQ.NEXTVAL, 'aaa', 'rrr', 1);
INSERT INTO ALERT (ALNO, MID, FID, ALCODE) VALUES (ALERT_SEQ.NEXTVAL, 'aaa', 'ccc', 1);
INSERT INTO ALERT (ALNO, MID, FID, ALCODE) VALUES (ALERT_SEQ.NEXTVAL, 'aaa', 'ddd', 1);
INSERT INTO ALERT (ALNO, MID, FID, ALCODE) VALUES (ALERT_SEQ.NEXTVAL, 'aaa', 'eee', 1);
INSERT INTO ALERT (ALNO, MID, FID, ALCODE) VALUES (ALERT_SEQ.NEXTVAL, 'aaa', 'fff', 1);
INSERT INTO ALERT (ALNO, MID, FID, ALCODE, ALCHECK) VALUES (ALERT_SEQ.NEXTVAL, 'aaa', 'ggg', 1, 1);
INSERT INTO ALERT (ALNO, MID, FID, ALCODE, ALCHECK) VALUES (ALERT_SEQ.NEXTVAL, 'aaa', 'hhh', 1, 1);
INSERT INTO ALERT (ALNO, MID, FID, ALCODE, ALCHECK) VALUES (ALERT_SEQ.NEXTVAL, 'aaa', 'iii', 1, 1);
       
-- TEAM
   INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'aaa', 'MYLOG', '아자아자'); 
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'bbb', 'BEEBEE', 'NOpainNOgain');
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'ccc', 'SOLACCI', 'solacci');
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'ddd', 'DD', 'DDistheBest');
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'eee', 'leelee', 'leeee');
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'ddd', 'DIY', 'noGoal');
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'ccc', 'CICI', NULL);
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'bbb', 'BECOME', NULL);
   INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'aaa', 'AYY~!', NULL);
   INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'eee', 'EE', NULL); 
        
-- TEAM_MEMBER
   INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'aaa', 1, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'bbb', 2, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'ccc', 3, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'ddd', 4, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'eee', 5, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'ddd', 6, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'ccc', 7, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'bbb', 8, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'aaa', 9, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'eee', 10, 1);
        
-- TEAMBOARD
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'aaa', '같이 노력하실 분 구합니다', '테스트�', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'ccc', '팀원찾아요', '테스트', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'bbb', '팀원 모집합니다', '테스트', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'eee', '함께 목표를 이룰 분~', '테스트', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'ddd', '팀원모집', '테스트', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'bbb', '같이해요', '테스트', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'aaa', '우리는 모두 할 수 있어요', '테스트', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'ccc', '아자아자 열심히 하실 분!', '테스트', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'ddd', '함께 하실래요?', '테스트', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'eee', '같이 다이어트해요!', '테스트', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'ddd', '같이 공부하실 분 구해요', '테스트', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'bbb', '팀 모집합니다 예~!~!', '테스트', 0, SYSDATE, NULL);
        
--TEAM_TODO
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE) 
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 1, 'ppt 템플릿 정하기', 0, 1, TEAM_TODO_SEQ.CURRVAL , '2022-08-18');
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE) 
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 2, 'ppt 만들기', 0, 1, TEAM_TODO_SEQ.CURRVAL , '2022-08-18');
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE) 
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 3, '발표 대본 작성하기', 0, 1, TEAM_TODO_SEQ.CURRVAL , '2022-08-18');
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE) 
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 4, '주제 선정하기', 0, 1, TEAM_TODO_SEQ.CURRVAL , '2022-08-18');
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE) 
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 5, '발표자 정하기', 0, 1, TEAM_TODO_SEQ.CURRVAL , '2022-08-18');

-- 투두 
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '정처기 필기 1장 공부', '2', '2022-08-17');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '자바 복습', '2', '2022-08-17');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '스프링 필기 정리', '2', '2022-08-17');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '이력서 마무리', '2', '2022-08-17');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '자기소개서 작성 시작', '2', '2022-08-17');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '30분 이상 운동', '2', '2022-08-17');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '소영이랑 저녁 약속', '2', '2022-08-17');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '엄마한테 연락', '2', '2022-08-17');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '추석 기차표 예매', '2', '2022-08-17');

INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '정처기 필기 2장 공부', '0', '2022-08-18');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '정처기 필기 3장 공부', '0', '2022-08-18');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '스프링 복습', '0', '2022-08-18');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '자기소개서 작성', '0', '2022-08-18');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '포토폴리오 작성', '0', '2022-08-18');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '30분 이상 운동', '0', '2022-08-18');


-- 일기
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '반성일기', 'aaa', NULL, '오늘은 아파서 아무것도 하지 못했어요ㅠㅠ 시험이 얼마 안남았는데 아프다니...컨디션 관리 실패...ㅠㅠㅠ', 0, 2, '2022-07-28', '127.00.00.01');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '오늘의 일기', 'bbb', NULL, '오늘은 날씨가 너무 좋아서 기분이 좋아요~ 행복합니다~~', 0, 2, '2022-07-28', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '여러분은 오늘 어떠셨나요?', 'aaa', NULL, '저는 오늘 시험을 보고 왔어요! 아파서 걱정했는데 나름 잘 본 거 같아요!', 0, 1, '2022-07-31', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '오늘 점검', 'aaa', 1, '오늘은 할 일을 전부 완료했다 매일 오늘처럼 부지런하게 살자!', 0, 0, '2022-08-17', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '오늘 기록하기', 'bbb', NULL, '파란 하늘이 인상적인 하루입니다', 0, 2, '2022-08-17', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '비온다면서!', 'ccc', NULL, '비온다고 해서 크록스를 신고 왔는데 비가 안오네요ㅠ', 0, 2, '2022-08-16', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '안녕하세요', 'ddd', NULL, '여러분 안녕하세요 저랑 친구하고 싶은 분들을 구합니다! 댓글 달아주세요~ 같이 교류해요~', 0, 2, '2022-08-12', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '처음입니다', 'eee', NULL, '처음으로 글 써봐요! 저랑 친구하고 싶은 분은 댓글 달아주세요~ 같이 교류해요~', 0, 2, '2022-08-12', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '행복한 날', 'ccc', NULL, '행복합니다', 0, 1, '2022-08-14', '127.00.00.02');
    INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '행복~', 'aaa', NULL, '행복', 0, 2, '2022-08-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '지쳐요', 'ccc', NULL, '지쳐요', 0, 2, '2022-08-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '오늘 기록하기', 'bbb', NULL, '파란 하늘이 인상적인 하루입니다', 0, 2, '2022-07-17', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '지쳐요', 'ddd', NULL, '지쳐요', 0, 2, '2022-08-08', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '안녕하세요', 'bbb', NULL, '지쳐요', 0, 2, '2022-08-04', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '안녕하세요', 'aaa', NULL, '지쳐요', 0, 2, '2022-07-04', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '안녕하세요', 'bbb', NULL, '지쳐요', 0, 2, '2022-07-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, 'DUMMY', 'aaa', NULL, '지쳐요', 0, 2, '2022-06-13', '127.00.00.02');
    
-- 댓글
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, 'aaa', '진짜 날씨가 너무 좋네요~', DIARYREPLY_SEQ.CURRVAL, 0, SYSDATE, '127.0.0.011');
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, 'bbb',  '그쵸! 그래서 너무 행복해요!!', 1, 1, SYSDATE, '127.0.0.02');
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, 'ccc', '마자요 오늘 날씨 좋더라구요', DIARYREPLY_SEQ.CURRVAL, 0, SYSDATE, '127.0.0.011');
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, 'bbb',  '저절로 기분 좋아지는 날씨였어요~', 3, 1, SYSDATE, '127.0.0.02');
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRMENTION, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, 'aaa', '김길동', '오늘의 좋은 날씨만큼 좋은 일만 가득하세요~', 1, 1, SYSDATE, '127.0.0.02');
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, 'ddd', '저 있는 곳은 바람이 너무 많이 불었어요ㅠㅠ', DIARYREPLY_SEQ.CURRVAL, 0, SYSDATE, '127.0.0.011');
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, 'bbb',  '헉! 제주 지방 사시나봐요! 거기는 강풍 특보더라구요ㅜㅠㅠ', 6, 1, SYSDATE, '127.0.0.02');
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, DRMENTION, MID, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, '김아무개' ,'ddd', '맞아요ㅠ 제주는 요즘 바람이 너무 많이 불어서 난리에여ㅠㅠ', 6, 1, SYSDATE, '127.0.0.011');
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, DRMENTION, MID, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, '성춘향' ,'bbb', '조심하세요ㅠㅠ', 6, 1, SYSDATE, '127.0.0.011');    
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 3, 'bbb', '아프시다고 해서 걱정했는데 잘 보신거 같다니 다행이에요!', DIARYREPLY_SEQ.CURRVAL, 0, SYSDATE, '127.0.0.02');




-- 가계부 카테고리
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '월급');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '용돈');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '상여금');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '식비');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '카페');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '교통');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '통신');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '보험');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '저축');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '투자');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '공부');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '도서');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '생활');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '의류');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '화장품');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '문화생활');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '취미');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '운동');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '여행');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '경조사');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '기타');


-- 가계부 
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 1, '월급', 2000000, '2022-08-15', '1');

INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 3, '엄마가 용돈 줌', 100000, '2022-08-05', '1');
    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 4, '점심', 10000, '2022-08-01', '0');     
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 4, '저녁', 20000, '2022-08-01', '0');
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 4, '점심', 8000, '2022-08-02', '0');     
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 4, '저녁', 14000, '2022-08-02', '0');
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 4, '점심', 6500, '2022-08-03', '0');     
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 4, '저녁', 12000, '2022-08-03', '0');
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 4, '점심', 6500, '2022-08-04', '0');     
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 4, '점심', 8000, '2022-08-05', '0');
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 4, '점심', 26000, '2022-08-06', '0');
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 4, '홈플러스에서 장봄', 113500, '2022-08-06', '0');
    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '커피', 1500, '2022-08-01', '0');    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '커피', 2800, '2022-08-02', '0');    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '커피', 1800, '2022-08-03', '0');    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '커피', 4800, '2022-08-04', '0');
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '커피', 1500, '2022-08-05', '0'); 
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '커피', 1500, '2022-08-08', '0');    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '아이스 아메리카노', 2800, '2022-08-09', '0');    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '커피', 1800, '2022-08-10', '0');    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '커피', 4800, '2022-08-11', '0');
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '커피', 1500, '2022-08-12', '0');
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '커피, 조각 케이크', 8900, '2022-08-15', '0');    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '커피', 3600, '2022-08-16', '0');
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 5, '커피', 1500, '2022-08-17', '0'); 
    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 6, '택시비', 10500, TO_DATE('2022-08-09 18:51:00', 'YYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 6, '버스비 결제', 135500, TO_DATE('2022-08-15 08:51:00', 'YYYY-MM-DD HH24:MI:SS'), '0'); 
    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 7, '통신비', 58000, '2022-08-15', '0'); 
    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 11, '인강 결제', 110000, '2022-08-16', '0'); 
    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 12, '정처기 책 구매', 32000, '2022-08-17', '0'); 
    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 14, '여름 옷 3벌 구매', 89000, '2022-08-13', '0'); 

INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 16, '영화', 12000, '2022-08-14', '0'); 
    

--게시판
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '시인들의 시는 그 시풍으로 읽고, 그의 시는 사랑으로 읽겠노라.′','그러므로 그들의 곳이 황금시대를 인생을 이는 청춘의 있으랴? 인간에 그들을 되는 이것이다. 튼튼하며, 자신과 사랑의 황금시대의 사는가 있으며, 생의 청춘이 것이다. 청춘은 날카로우나 가진 되려니와, 따뜻한 그들의 있는 칼이다. 우리의 그들은 사람은 만천하의 힘있다. 생의 속에서 때에, 군영과 청춘의 기쁘며, 앞이 아름다우냐? 눈이 없으면 피가 인생을 하는 새가 가는 청춘의 사막이다. 청춘에서만 못할 남는 같은 못하다 것이다. 바이며, 튼튼하며, 그와 있으며, 새가 용기가 소리다.이것은 것이다. 있을 청춘 것이다.보라, 주며, 것은 풍부하게 끓는 봄바람이다. 심장은 원대하고, 군영과 청춘 사막이다.', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'bbb', '그는 죽고 시인들만 앞으로 나아가고 있으니','오아이스도 끓는 거친 바이며, 투명하되 칼이다. 뜨거운지라, 넣는 있는 행복스럽고 용기가 봄바람이다. 귀는 청춘의 소리다.이것은 청춘의 곳이 보이는 돋고, 뿐이다. 기관과 더운지라 위하여, 사랑의 황금시대다. 불러 열락의 별과 천지는 보는 있으랴? 있으며, 피고, 피어나기 열락의 갑 원질이 얼음 인간의 이것이다. 하는 더운지라 인간은 끓는 불러 약동하다. 청춘 속에 인간은 놀이 풀이 웅대한 황금시대다. 때까지 용감하고 것은 바이며, 있는 봄바람이다. 품고 더운지라 얼음이 같이, 동력은 아름다우냐? 못하다 예수는 놀이 노년에게서 하였으며, 청춘에서만 것이다.', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'ccc', '더 탁월한 시인들과 어깨를 나란히 하고 진군했을 테지만','보는 사랑의 꽃 풀이 것이다. 얼마나 피가 사랑의 용감하고 청춘이 인간은 불어 방황하여도, 것이다. 얼음이 커다란 가는 이상 주는 이상은 품었기 어디 공자는 것이다. 충분히 만천하의 천고에 우리 몸이 풍부하게 얼마나 오직 운다. 실현에 노래하며 그들을 그들의 것은 충분히 이상 있다. 커다란 인생에 이 있는가? 가치를 몸이 그와 넣는 뿐이다. 이상의 뜨거운지라, 인류의 끓는 것이다. 꽃 가슴이 그러므로 되려니와, 품으며, 사랑의 발휘하기 풀이 든 위하여서. 얼음 천자만홍이 천고에 대한 것이다. 곳이 찬미를 돋고, 무엇을 공자는 튼튼하며, 황금시대다. 않는 인간이 모래뿐일 산야에 말이다. 할지라도 얼마나 이상, 같지 뜨거운지라, 청춘이 가는 풀이 앞이 것이다.', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'ddd', '그의 사랑은 이보다 더 빼어난 시를 낳았을 것이고','가치를 뜨고, 그림자는 위하여, 얼마나 뜨거운지라, 있다. 쓸쓸한 것이 되려니와, 불어 봄바람이다. 그것은 풀이 가지에 낙원을 그들은 속에서 가치를 품으며, 불러 것이다. 우리 사라지지 있음으로써 이것을 철환하였는가?', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'eee', '′내 친구의 마음 속 뮤즈가 이 시대와 더불어 살았다면','싶이 노년에게서 가장 없으면, 속잎나고, 가지에 봄바람이다. 별과 없으면 구하지 원질이 넣는 위하여서. 품으며, 가치를 청춘이 위하여서. 청춘의 예가 풍부하게 심장은 위하여서 그들에게 미인을 봄바람이다. 위하여 그들의 고행을 동산에는 과실이 사막이다. 품었기 위하여, 보내는 황금시대를 따뜻한 것이다.보라, 뼈 가지에 것이다.', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '다만 이런 애정어린 생각만 내게 주오','그들은 가는 그와 길지 운다. 산야에 무한한 인간에 곳이 이것이다. 얼마나 산야에 꾸며 우는 노년에게서 이것이다. 않는 투명하되 보배를 우리의 청춘의 희망의 칼이다. 많이 이상의 생명을 끝까지 목숨이 인류의 것이다.', NULL, SYSDATE, 0,'124.01.01');
            
            
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '라임이야 복받은 사람들이 훨씬 잘 써냈을터이니','그들은 아니더면, 기쁘며, 끓는다. 온갖 무엇이 웅대한 가진 듣는다. 청춘의 따뜻한 이상의 눈이 부패뿐이다. 있을 힘차게 그들에게 약동하다. 몸이 그들의 되는 미묘한 인간에 힘있다. 투명하되 없으면, 풀이 붙잡아 그들의 안고, 불러 있으랴? 대고, 돋고, 같으며, 힘차게 생의 이 부패를 봄바람이다. 만천하의 뭇 예수는 따뜻한 구할 이성은 피가 봄바람이다. 풀이 있으며, 날카로우나 찾아 아름다우냐? 찾아다녀도, 속에서 인간의 천자만홍이 그리하였는가?', NULL, SYSDATE, 1,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'bbb', '시를 봐서가 아니라 내 사랑을 봐서 간직해주오','인생을 무엇을 사람은 말이다. 않는 얼음이 군영과 위하여서.', NULL, SYSDATE, 1,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'ccc', '내 시는 그 모든 시인들의 시보다 못할테지만','청춘 열매를 불어 가진 자신과 풀이 돋고, 그리하였는가? 그러므로 동산에는 반짝이는 인간에 사랑의 이 내려온 그들은 쓸쓸하랴? 청춘 가는 얼음이 이것이다. 청춘의 가진 더운지라 따뜻한 아니더면, 우는 구할 없는 있으랴? 만천하의 가슴에 뛰노는 별과 힘차게 얼마나 피가 현저하게 물방아 것이다. 천지는 무엇이 생생하며, 만천하의 못하다 내려온 내는 운다. 군영과 반짝이는 커다란 있음으로써 심장의 것은 이것을 것이다.', NULL, SYSDATE, 1,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'ddd', '세월에 따라 진보한 시들과 비교한다면','따뜻한 위하여서 꾸며 피는 그들을 품었기 맺어, 뛰노는 부패뿐이다. 구하기 역사를 소담스러운 실로 청춘의 커다란 쓸쓸한 일월과 아니다. 찾아다녀도, 위하여, 대한 사람은 있는 어디 있음으로써 희망의 피에 것이다. 이상의 그것은 없으면, 있다. 소담스러운 인류의 무엇을 얼마나 맺어, 새가 그들을 이상이 이것이다. 들어 속에서 인생에 유소년에게서 보는 것이다. 설산에서 풀이 맺어, 트고, 대고, 것이다.', NULL, SYSDATE, 1,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'eee', '세상을 떠난 당신 친구의 이 서툰 시를 읽게 되어','위하여서 피에 고동을 같으며, 평화스러운 이상은 이것이다. 사는가 밥을 군영과 사막이다. 위하여서 풀이 불러 원대하고, 기쁘며, 천지는 이 인생의 것이다. 하는 수 때에, 밝은 되는 보이는 위하여, 이 이상을 끓는다. 굳세게 풍부하게 사는가 아름다우냐?', NULL, SYSDATE, 1,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'bbb', '당신이 나보다 오래 살아 우연히','테스트보드입니다', NULL, SYSDATE, 1,'124.01.01');

            
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '포악한 죽음이 내 뼈를 흙으로 덮은 후','테스트보드입니다', NULL, SYSDATE, 2,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'bbb', '내가 불평없이 이 세상을 떠나고','테스트보드입니다', NULL, SYSDATE, 2,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'ccc', '셰익스피어 소네트 32','테스트보드입니다', NULL, SYSDATE, 2,'124.01.01');



INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'ddd', '모든 밤은 낮이다, 꿈이 당신을 비춰주면','싸인 영락과 이상, 것은 새가 같이, 갑 심장은 황금시대다. 동력은 아니더면, 있는 피가 가진 온갖 물방아 피다. 살았으며, 들어 힘차게 끓는 낙원을 능히 인간의 무엇을 실현에 피다. 쓸쓸한 유소년에게서 이상의 힘차게 방황하였으며, 무엇이 든 뿐이다. 황금시대를 가치를 열락의 용기가 봄바람이다.', NULL, SYSDATE, 2,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'eee', '모든 낮은 밤이다, 당신을 보기 전까지는','풍부하게 산야에 청춘의 말이다. 예가 발휘하기 가는 않는 심장은 싸인 만물은 현저하게 앞이 뿐이다. 타오르고 심장은 구할 인생의 청춘은 힘있다. 눈이 이것은 것은 이것이야말로 청춘 트고, 말이다. 이상의 가는 위하여 인생을 봄바람을 불러 새가 가장 따뜻한 때문이다. 몸이 커다란 이상이 끓는 우는 사막이다.', NULL, SYSDATE, 2,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'ccc', '내 두 눈은 얼마나 영광스럽겠는가','군영과 청춘의 새 얼마나 없으면 피어나는 기관과 이상 찾아 쓸쓸하랴? 있는 수 같이 쓸쓸한 것이다. 살 곳으로 청춘 시들어 방황하였으며, 생의 돋고, 그들의 위하여, 그리하였는가? 가슴에 그들의 것은 오아이스도 심장은 간에 눈이 내는 꽃 뿐이다. 새 꾸며 찬미를 이 우리는 뿐이다. 이는 것은 이것은 찬미를 자신과 내려온 인간은 꾸며 있으랴?', NULL, SYSDATE, 2,'124.01.01');          
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '생동하는 낮 당신을 보게 되면','그러므로 그들의 곳이 황금시대를 인생을 이는 청춘의 있으랴? 인간에 그들을 되는 이것이다. 튼튼하며, 자신과 사랑의 황금시대의 사는가 있으며, 생의 청춘이 것이다. 청춘은 날카로우나 가진 되려니와, 따뜻한 그들의 있는 칼이다. 우리의 그들은 사람은 만천하의 힘있다. 생의 속에서 때에, 군영과 청춘의 기쁘며, 앞이 아름다우냐? 눈이 없으면 피가 인생을 하는 새가 가는 청춘의 사막이다. 청춘에서만 못할 남는 같은 못하다 것이다. 바이며, 튼튼하며, 그와 있으며, 새가 용기가 소리다.이것은 것이다. 있을 청춘 것이다.보라, 주며, 것은 풍부하게 끓는 봄바람이다. 심장은 원대하고, 군영과 청춘 사막이다.', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'bbb', '당신의 아름답고 안개같은 환영 보이는데','오아이스도 끓는 거친 바이며, 투명하되 칼이다. 뜨거운지라, 넣는 있는 행복스럽고 용기가 봄바람이다. 귀는 청춘의 소리다.이것은 청춘의 곳이 보이는 돋고, 뿐이다. 기관과 더운지라 위하여, 사랑의 황금시대다. 불러 열락의 별과 천지는 보는 있으랴? 있으며, 피고, 피어나기 열락의 갑 원질이 얼음 인간의 이것이다. 하는 더운지라 인간은 끓는 불러 약동하다. 청춘 속에 인간은 놀이 풀이 웅대한 황금시대다. 때까지 용감하고 것은 바이며, 있는 봄바람이다. 품고 더운지라 얼음이 같이, 동력은 아름다우냐? 못하다 예수는 놀이 노년에게서 하였으며, 청춘에서만 것이다.', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'ccc', '죽어있는 밤 깊은 잠에 빠진 보이지 않는 두 눈에도','보는 사랑의 꽃 풀이 것이다. 얼마나 피가 사랑의 용감하고 청춘이 인간은 불어 방황하여도, 것이다. 얼음이 커다란 가는 이상 주는 이상은 품었기 어디 공자는 것이다. 충분히 만천하의 천고에 우리 몸이 풍부하게 얼마나 오직 운다. 실현에 노래하며 그들을 그들의 것은 충분히 이상 있다. 커다란 인생에 이 있는가? 가치를 몸이 그와 넣는 뿐이다. 이상의 뜨거운지라, 인류의 끓는 것이다. 꽃 가슴이 그러므로 되려니와, 품으며, 사랑의 발휘하기 풀이 든 위하여서. 얼음 천자만홍이 천고에 대한 것이다. 곳이 찬미를 돋고, 무엇을 공자는 튼튼하며, 황금시대다. 않는 인간이 모래뿐일 산야에 말이다. 할지라도 얼마나 이상, 같지 뜨거운지라, 청춘이 가는 풀이 앞이 것이다.', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'ddd', '당신의 모습 얼마나 더 황홀하겠는가','가치를 뜨고, 그림자는 위하여, 얼마나 뜨거운지라, 있다. 쓸쓸한 것이 되려니와, 불어 봄바람이다. 그것은 풀이 가지에 낙원을 그들은 속에서 가치를 품으며, 불러 것이다. 우리 사라지지 있음으로써 이것을 철환하였는가?', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'eee', '맑은 날 더 밝은 빛 아래에서는','싶이 노년에게서 가장 없으면, 속잎나고, 가지에 봄바람이다. 별과 없으면 구하지 원질이 넣는 위하여서. 품으며, 가치를 청춘이 위하여서. 청춘의 예가 풍부하게 심장은 위하여서 그들에게 미인을 봄바람이다. 위하여 그들의 고행을 동산에는 과실이 사막이다. 품었기 위하여, 보내는 황금시대를 따뜻한 것이다.보라, 뼈 가지에 것이다.', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '감은 두 눈에도 당신의 모습 그토록 빛나는데','그들은 가는 그와 길지 운다. 산야에 무한한 인간에 곳이 이것이다. 얼마나 산야에 꾸며 우는 노년에게서 이것이다. 않는 투명하되 보배를 우리의 청춘의 희망의 칼이다. 많이 이상의 생명을 끝까지 목숨이 인류의 것이다.', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 

            VALUES(RSEQ.NEXTVAL, 'aaa', '꿈 속 환영만으로도 어둠을 빛나게 하는 당신','그러므로 그들의 곳이 황금시대를 인생을 이는 청춘의 있으랴? 인간에 그들을 되는 이것이다. 튼튼하며, 자신과 사랑의 황금시대의 사는가 있으며, 생의 청춘이 것이다. 청춘은 날카로우나 가진 되려니와, 따뜻한 그들의 있는 칼이다. 우리의 그들은 사람은 만천하의 힘있다. 생의 속에서 때에, 군영과 청춘의 기쁘며, 앞이 아름다우냐? 눈이 없으면 피가 인생을 하는 새가 가는 청춘의 사막이다. 청춘에서만 못할 남는 같은 못하다 것이다. 바이며, 튼튼하며, 그와 있으며, 새가 용기가 소리다.이것은 것이다. 있을 청춘 것이다.보라, 주며, 것은 풍부하게 끓는 봄바람이다. 심장은 원대하고, 군영과 청춘 사막이다.', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'bbb', '어둠 속에서도 밝게 빛나 곧바로 당신을 비추는구나','오아이스도 끓는 거친 바이며, 투명하되 칼이다. 뜨거운지라, 넣는 있는 행복스럽고 용기가 봄바람이다. 귀는 청춘의 소리다.이것은 청춘의 곳이 보이는 돋고, 뿐이다. 기관과 더운지라 위하여, 사랑의 황금시대다. 불러 열락의 별과 천지는 보는 있으랴? 있으며, 피고, 피어나기 열락의 갑 원질이 얼음 인간의 이것이다. 하는 더운지라 인간은 끓는 불러 약동하다. 청춘 속에 인간은 놀이 풀이 웅대한 황금시대다. 때까지 용감하고 것은 바이며, 있는 봄바람이다. 품고 더운지라 얼음이 같이, 동력은 아름다우냐? 못하다 예수는 놀이 노년에게서 하였으며, 청춘에서만 것이다.', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'ccc', '잠이 들면 꿈 속에서 내 눈은 당신을 찾아','보는 사랑의 꽃 풀이 것이다. 얼마나 피가 사랑의 용감하고 청춘이 인간은 불어 방황하여도, 것이다. 얼음이 커다란 가는 이상 주는 이상은 품었기 어디 공자는 것이다. 충분히 만천하의 천고에 우리 몸이 풍부하게 얼마나 오직 운다. 실현에 노래하며 그들을 그들의 것은 충분히 이상 있다. 커다란 인생에 이 있는가? 가치를 몸이 그와 넣는 뿐이다. 이상의 뜨거운지라, 인류의 끓는 것이다. 꽃 가슴이 그러므로 되려니와, 품으며, 사랑의 발휘하기 풀이 든 위하여서. 얼음 천자만홍이 천고에 대한 것이다. 곳이 찬미를 돋고, 무엇을 공자는 튼튼하며, 황금시대다. 않는 인간이 모래뿐일 산야에 말이다. 할지라도 얼마나 이상, 같지 뜨거운지라, 청춘이 가는 풀이 앞이 것이다.', NULL, SYSDATE, 2,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'ddd', '눈을 감고서야 가장 잘 보기 시작한다','가치를 뜨고, 그림자는 위하여, 얼마나 뜨거운지라, 있다. 쓸쓸한 것이 되려니와, 불어 봄바람이다. 그것은 풀이 가지에 낙원을 그들은 속에서 가치를 품으며, 불러 것이다. 우리 사라지지 있음으로써 이것을 철환하였는가?', NULL, SYSDATE, 1,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'eee', '온종일 가치없는 것들을 보던 내 두 눈은','싶이 노년에게서 가장 없으면, 속잎나고, 가지에 봄바람이다. 별과 없으면 구하지 원질이 넣는 위하여서. 품으며, 가치를 청춘이 위하여서. 청춘의 예가 풍부하게 심장은 위하여서 그들에게 미인을 봄바람이다. 위하여 그들의 고행을 동산에는 과실이 사막이다. 품었기 위하여, 보내는 황금시대를 따뜻한 것이다.보라, 뼈 가지에 것이다.', NULL, SYSDATE, 0,'124.01.01');
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '셰익스피어 소네트 43','그들은 가는 그와 길지 운다. 산야에 무한한 인간에 곳이 이것이다. 얼마나 산야에 꾸며 우는 노년에게서 이것이다. 않는 투명하되 보배를 우리의 청춘의 희망의 칼이다. 많이 이상의 생명을 끝까지 목숨이 인류의 것이다.', NULL, SYSDATE, 1,'124.01.01');
            
            


--댓글
    INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPINDENT, RPIP)
    VALUES (RPSEQ.NEXTVAL, 1, 'aaa', '댓글입니다', SYSDATE, RPSEQ.CURRVAL, 0,'127.10.10');
      INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPINDENT, RPMENTION, RPIP)
    VALUES (RPSEQ.NEXTVAL, 1, 'aaa', '댓글입니다', SYSDATE, 1, 1,'이토끼토끼','127.10.10');
     INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPINDENT, RPMENTION, RPIP)
    VALUES (RPSEQ.NEXTVAL, 1, 'aaa', '댓글입니다2', SYSDATE, 1, 1,'이토끼토끼','127.10.10');

--타이머
INSERT INTO TIMER(TNO, MID, TTODAY, TNAME, TDO, TPAUSE, TDURING, TSTART, TEND) 
    		VALUES(TSEQ.NEXTVAL, 'aaa', SYSDATE, '테스트' ,1,0 , 60, 0, 0 );
INSERT INTO TTABLE(TBNO, TNO, MID, TBSHOUR, TBSMIN, TBEHOUR, TBEMIN) 
            VALUES(TBSEQ.NEXTVAL, 1, 'aaa', 21, 50 ,22,50 );


COMMIT;