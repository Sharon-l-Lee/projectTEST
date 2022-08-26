
--회원입력
INSERT INTO MEMBER(MID, MPW, MNAME, MBIRTH,MEMAIL,MMOTTO,MSTATUS  ) 
VALUES ('aaa', '111', '이토끼', '89-01-01', 'bunny0101@naver.com', '살다보면 좋은 일이 생긴다', 1);
INSERT INTO MEMBER(MID, MPW, MNAME, MBIRTH,MEMAIL,MMOTTO,MSTATUS  ) 
VALUES ('bbb', '111', '김길동', '89-06-25', 'hong10@naver.com', '헤맨 만큼 나의 길', 1);
INSERT INTO MEMBER(MID, MPW, MNAME, MBIRTH,MEMAIL,MMOTTO,MSTATUS  ) 
VALUES ('ccc', '111', '박멍멍', '95-02-17', 'bowwow7541@naver.com', '작심삼일도 100번이면 1년', 1);
INSERT INTO MEMBER(MID, MPW, MNAME, MBIRTH,MEMAIL,MMOTTO,MSTATUS  ) 
VALUES ('ddd', '111', '최서희', '98-12-25', 'shee7@gmail.com', '준비된 사람에게 기회가 온다', 1);
INSERT INTO MEMBER(MID, MPW, MNAME, MBIRTH,MEMAIL,MMOTTO,MSTATUS  ) 
VALUES ('eee', '111', '서야옹', '75-04-23', 'meownyang@gmail.com', '열심히 살자', 1);
commit;

--관리자 등록
INSERT INTO ADMIN (aID, aPW, aGRADE) VALUES ('a111', '111', 1);
INSERT INTO ADMIN (aID, aPW, aGRADE) VALUES ('b111', '111', 1);
INSERT INTO ADMIN (aID, aPW, aGRADE) VALUES ('c111', '111', 1);
INSERT INTO ADMIN (aID, aPW, aGRADE) VALUES ('d111', '111', 1);
INSERT INTO ADMIN (aID, aPW, aGRADE) VALUES ('e111', '111', 1);
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
            
            
commit;


--댓글
    INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPINDENT, RPIP)
    VALUES (RPSEQ.NEXTVAL, 1, 'AAA', '댓글입니다', SYSDATE, RPSEQ.CURRVAL, 0,'127.10.10');
      INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPINDENT, RPMENTION, RPIP)
    VALUES (RPSEQ.NEXTVAL, 1, 'aaa', '댓글입니다', SYSDATE, 1, 1,'이토끼토끼','127.10.10');
     INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPINDENT, RPMENTION, RPIP)
    VALUES (RPSEQ.NEXTVAL, 1, 'aaa', '댓글입니다2', SYSDATE, 1, 1,'이토끼토끼','127.10.10');

--타이머
COMMIT;
SELECT * FROM TIMER;
INSERT INTO TIMER(TNO, MID, TTODAY, TNAME, TDO, TPAUSE, TDURING, TSTART, TEND) 
    		VALUES(TSEQ.NEXTVAL,'aaa', SYSDATE, '테스트' ,1,0 , 60, 0, 0 );
INSERT INTO TTABLE(TBNO, TNO, MID, TBSHOUR, TBSMIN, TBEHOUR, TBEMIN) 
VALUES(TBSEQ.NEXTVAL, 4,'aaa', 21, 50 ,22,50 );