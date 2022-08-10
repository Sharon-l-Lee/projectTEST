package com.project.mylog.service;

import java.sql.Date;
import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.MemberDao;
import com.project.mylog.model.Member;
import com.project.mylog.util.Paging;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	JavaMailSenderImpl mailSender;
	
	@Override
	public int joinMember(final Member member, String tempmbirth) {
		if ("".equals(tempmbirth)) {
			member.setMbirth(null);
		} else {
			member.setMbirth(Date.valueOf(tempmbirth));
		}
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<div style=\"width : 500px; margin : 0 auto; text-align : center;\">\n" + 
					"	<h1 style=\"color : blue;\">" + member.getMname() + "님 회원가입 감사합니다</h1>\n" +   
					"</div>"; // 메일내용
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemail())); // 받는메일
				mimeMessage.setFrom(new InternetAddress("mylog.cop@gmail.com"));
				mimeMessage.setSubject("[가입인사]" + member.getMname() + "님의 회원가입을 축하드립니다");
				mimeMessage.setText(content, "utf-8", "html");
				
			}
		};
		mailSender.send(message);
		return memberDao.joinMember(member);
	}

	@Override
	public int modifyMember(Member member, String tempmbirth) {
		if ("".equals(tempmbirth)) {
			member.setMbirth(null);
		} else {
			member.setMbirth(Date.valueOf(tempmbirth));
		}
		return memberDao.modifyMember(member);
	}

	@Override
	public int idCheck(String mid) {
		return memberDao.idCheck(mid);
	}

	@Override
	public int deleteMember(String mid) {
		return memberDao.deleteMember(mid);
	}

	@Override
	public int recoverMember(String mid) {	
		return memberDao.recoverMember(mid);
	}

	@Override
	public List<Member> memberList(String pageNum) {
		Paging paging = new Paging(memberDao.countMember(), pageNum);
		Member member = new Member();
		member.setStartRow(paging.getStartRow());
		member.setEndRow(paging.getEndRow());
		return memberDao.memberList(member);
	}

	@Override
	public int countMember() {
		return memberDao.countMember();
	}

	@Override
	public Member getMember(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		return memberDao.getMember(member.getMid());
	}

	@Override
	public String loginCheck(String mid, String mpw, HttpSession session) {
		String result = "로그인 성공"; 
		Member member = memberDao.getMember(mid);
		if (member == null) {
			result = "존재하지 않는 아이디입니다";
		} else if (!mpw.equals(member.getMpw())) {
			result = "비밀번호가 다릅니다";
		} else if (member.getMstatus() == 0) {
			result = "사용이 중단된 아이디입니다";
		} else {
			session.setAttribute("member", member);
		}
		return result;
	}

	@Override
	public String searchIdPw(final String mname, final String memail) {
		String result = "검색 성공";
		final Member member = memberDao.getMemberForEmail(memail);
		if (member == null) {
			result = "입력한 이메일에 해당하는 아이디가 없습니다";
		} else if (!mname.equals(member.getMname())) {
			result = "입력한 닉네임에 해당하는 아이디가 없습니다";
		} else if (member.getMstatus() == 0) {
			result = "사용이 중단된 아이디입니다";
		} else {
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = "<div style=\"width : 500px; margin : 0 auto; text-align : center;\">\n" + 
						"	<h1 style=\"color : blue;\">" + mname + "님 비밀번호를 알려드립니다</h1>\n" +  
						"	<div>\n" + 
						"		비밀번호는 ["+ member.getMpw() +"] 입니다\n" + 
						"	</div>\n" + 
						"</div>"; // 메일내용
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(memail)); // 받는메일
					mimeMessage.setFrom(new InternetAddress("mylog.cop@gmail.com"));
					mimeMessage.setSubject("[Mylog]" + mname + "님의 아이디/비밀번호 찾기 결과입니다");
					mimeMessage.setText(content, "utf-8", "html");
				}
			};
			mailSender.send(message);
		}
		return result;
	}

	@Override
	public Member getMemberForEmail(String memail) {
		return memberDao.getMemberForEmail(memail);
	}

	@Override
	public int emailCheck(String memail) {
		return memberDao.emailCheck(memail);
	}

	@Override
	public List<Member> findFriend(HttpSession session, String mname) {
		Member myInfo = (Member) session.getAttribute("member");
		Member member = new Member();
		member.setMid(myInfo.getMid());
		member.setMname(mname);
		return memberDao.findFriend(member);
	}

}
