--DAO QUERY
-- ADMIN
    -- admin
    INSERT INTO ADMIN (aID, aPW, aGRADE)
        VALUES ('ADMINaaa', '111', 0);
    -- login admin
    SELECT * FROM ADMIN WHERE AID='aaa' AND APW='111';
    -- member return
    UPDATE MEMBER SET mSTATUS = 0
        WHERE mID='aaa';
    -- member drawal
    UPDATE MEMBER SET mSTATUS = 1
        WHERE mID='aaa';
    -- memberList
    SELECT * FROM 
        (SELECT ROWNUM RN, A.* FROM 
            (SELECT M.* FROM MEMBER M
                        ORDER BY mID, mSTATUS DESC) A)
        WHERE RN BETWEEN 1 AND 11;
    
-- TEAM(make TEAM)
    -- (1) makeTeam
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        	VALUES (TEAM_SEQ.NEXTVAL, 'aaa', 'team_a', 'we go up!');
    -- (2) getTno(max)
    SELECT MAX(tNO) tNO FROM TEAM;
    -- (3) deleteTeam
    DELETE FROM TEAM WHERE tNO=6;
    -- (4) modifyTeam
    UPDATE TEAM SET mID = 'aaa',
						tNAME = 'team_A!',
                    	tGOAL = 'we go UP!'
                	WHERE tNO = 5;
    -- (5) getTeamDetail
    SELECT T.*, M.mNAME FROM TEAM T, MEMBER M 
        WHERE T.MID=M.MID AND tNO=5;
    -- (6) teamList(search)
    -- search
    SELECT * FROM 
		(SELECT ROWNUM RN, A.* FROM 
            (SELECT T.*, M.mNAME FROM TEAM T, MEMBER M
                WHERE T.MID = M.MID
		        ORDER BY TNO DESC) A)
			 WHERE RN BETWEEN 1 AND 1;
	-- 	search_tname/mname
    SELECT * FROM 
		(SELECT ROWNUM RN, A.* FROM 
            (SELECT T.*, M.mNAME FROM TEAM T, MEMBER M
                WHERE T.MID = M.MID AND (T.tNAME LIKE '%'||'Î∞?'||'%' OR M.mNAME LIKE '%'||'Î∞?'||'%')
		        ORDER BY TNO DESC) A)
            WHERE RN BETWEEN 1 AND 1;
    -- (7) teamTotCnt
    SELECT COUNT(*) FROM TEAM;
    
-- TEAM_MEMBER(join team)
    -- (1) myTeamList
    SELECT T.*, M.mNAME 
        FROM TEAM_MEMBER TM, TEAM T, MEMBER M 
        WHERE TM.tNO = T.tNO AND T.mID=M.mID AND TM.tmCHECK=1 AND TM.mID='aaa';
    -- (2) myApplyTeamList
    SELECT T.*, M.mNAME 
        FROM TEAM_MEMBER TM, TEAM T, MEMBER M 
        WHERE TM.tNO = T.tNO AND T.mID=M.mID AND TM.tmCHECK=0 AND TM.mID='aaa';
	-- (3) applyTeamMember
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK)
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'aaa', 1, 0);
    -- (4) deleteApplyTeam
    DELETE FROM TEAM_MEMBER 
        WHERE tmCHECK = 0 AND tmNO=41 AND tNO=1;
    -- (5) permitApplyTeam
    UPDATE TEAM_MEMBER SET tmCHECK = 1
        WHERE tmNO=1 AND tNO=1;
    -- (6) joinTeamMember
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK)
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'aaa', 1, 1);
    -- (7) teamApplyList
    SELECT TM.*, M.mNAME 
        FROM TEAM_MEMBER TM, MEMBER M 
        WHERE TM.mID=M.mID AND tmCHECK = 0 AND tNO = 1;
    -- (8) drawalTeamMember
    DELETE FROM TEAM_MEMBER 
        WHERE tmCHECK = 1 AND tmNO=1 AND tNO=1;
    -- (9) teamMemberList
    SELECT TM.*, M.mNAME 
        FROM TEAM_MEMBER TM, MEMBER M 
        WHERE TM.mID=M.mID AND tmCHECK=1 AND tNO=1;
    -- (10) teamMemberTotCnt
    SELECT COUNT(*) 
        FROM TEAM_MEMBER 
        WHERE tmCHECK=1 AND tNO=1;
    -- (11) getTeamMemberDetail
    SELECT * FROM TEAM_MEMBER WHERE tNO=1 AND MID='aaa';
    -- (12) deleteTeamMember
    DELETE FROM TEAM_MEMBER WHERE tNO=1;

-- TEAM_TODO
    -- (1) teamTodoList
    SELECT TT.*, TM.mID, M.mNAME 
        FROM TEAM_TODO TT, TEAM_MEMBER TM, TEAM T, MEMBER M
        WHERE TT.tmNO=TM.tmNO AND TM.mID=M.mID AND T.TNO= TT.TNO AND TT.tNO=1 AND TT.ttRDATE LIKE TO_DATE('2022-08-18', 'YYYY-MM-DD')
        ORDER BY ttCHECK, ttORDER;
    -- (2) getTeamTodo
    SELECT TT.*, TM.mID, M.mNAME 
        FROM TEAM_TODO TT, TEAM_MEMBER TM, MEMBER M 
        WHERE TT.tmNO=TM.tmNO AND TM.mID=M.mID AND TTNO=1;
    -- (3) makeTeamTodo
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE)
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 1, '?ã§?ïò?ûê', 0, 1, TEAM_TODO_SEQ.CURRVAL, '2022-08-18');
    -- (4) deleteTeamTodo
    DELETE FROM TEAM_TODO WHERE ttNO=1;
    -- (5) modifyTeamTodo
    UPDATE TEAM_TODO SET ttCONTENT='?ã§?ïòÍ∏?!',
        tmNO=1
        WHERE ttNO = 1 AND tNO=1;
    -- (6) orderingTeamTodo
    UPDATE TEAM_TODO SET ttORDER = 1
        WHERE ttNO=1;
    -- (7) checkTeamTodo
    UPDATE TEAM_TODO SET ttCHECK = 1
        WHERE ttNO=1;
    -- (8) deleteTeamTodoList
    DELETE FROM TEAM_TODO WHERE tNO=1;
                    
-- TEAMBOARD
    -- (1) teamBoardList
    SELECT * FROM 
        (SELECT ROWNUM RN, A.* FROM 
            (SELECT T.*, M.mNAME FROM TEAMBOARD T, MEMBER M
                WHERE T.MID = M.MID
	            ORDER BY trdate DESC) A)
            WHERE RN BETWEEN 1 AND 1;
    -- (2) teamBoardTotCnt
    SELECT COUNT(*) FROM TEAMBOARD;
    -- (3) teamBoardWrite
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tIP)
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'aaa', 'title', 'content', 'ip');
	-- (4) teamBoardHitUp
    UPDATE TEAMBOARD SET tHIT = tHIT+1 WHERE tNUM=1;
    -- (5) teamBoardDetail
    SELECT T.*, M.mNAME 
        FROM TEAMBOARD T, MEMBER M 
        WHERE T.MID = M.MID AND tNUM=1;
    -- (6) teamBoardModify
    UPDATE TEAMBOARD SET tTITLE = 'title',
        tCONTENT = 'content',
        tIP = 'ip',
        tRDATE = SYSDATE
        WHERE tNUM = 1;
    -- (7) teamBoardDelete
    DELETE FROM TEAMBOARD WHERE tNUM=1;

-- TEAM_COMMENTBOARD
    -- (1) teamCommentList
    SELECT * FROM 
        (SELECT ROWNUM RN, A.* FROM 
        (SELECT TC.*, M.mNAME FROM TEAM_COMMENTBOARD TC, MEMBER M WHERE TC.mID=M.mID AND tNUM=1
            ORDER BY tcGROUP DESC, tcINDENT, tcRDATE) A)
        WHERE RN BETWEEN 1 AND 1;
    -- (2) teamCommentTotCnt
    SELECT COUNT(*) FROM TEAM_COMMENTBOARD	WHERE tNUM=1;
    -- (3) teamCommentWrite
    INSERT INTO TEAM_COMMENTBOARD (tcNUM, mID, tNUM, tcCONTENT, tcGROUP,tcINDENT, tcIP)
        VALUES (TEAM_COMMENTBOARD_SEQ.NEXTVAL, 'aaa', 1, 'content', TEAM_COMMENTBOARD_SEQ.CURRVAL, 0, 'ip');
    -- (4) teamCommentModify
    UPDATE TEAM_COMMENTBOARD SET tcCONTENT = 'content',
        tcIP = 'ip'
        WHERE tcNUM = 1;
    -- (5) teamCommentDelete
    DELETE FROM TEAM_COMMENTBOARD WHERE tcNUM=1;
    -- (6) teamCommentDetail
    SELECT TC.*, M.mNAME 
        FROM TEAM_COMMENTBOARD TC, MEMBER M 
        WHERE TC.MID=M.MID AND TCNUM=1;
    -- (7) teamCommentReply
    INSERT INTO TEAM_COMMENTBOARD (tcNUM, mID, tcMENTION, tNUM, tcCONTENT, tcGROUP, tcINDENT, tcIP)
        VALUES (TEAM_COMMENTBOARD_SEQ.NEXTVAL, 'aaa', 'mention', 1,  'content', 1, 1, 'ip');
