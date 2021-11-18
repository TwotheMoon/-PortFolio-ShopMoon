package org.shopmoon.service;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.shopmoon.domain.MemberVO;
import org.shopmoon.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper membermapper;
	
	// 회원등록
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
	}
	
	// 아이디 중복 체크
	@Override
	public int idCheck(String memberId) throws Exception {
		
		return membermapper.idCheck(memberId);
	}
	
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {

		return membermapper.memberLogin(member);
	}
	
	@Override
	public void memberUpdate(MemberVO member) throws Exception {
		
		membermapper.memberUpdate(member);
	}
	
	@Override
	public void memberDelete(MemberVO member) throws Exception {

		membermapper.memberDelete(member);
	}
	
	@Override
	public MemberVO memberFindId(String memberEmail) throws Exception {
		
		return membermapper.memberFindId(memberEmail);	
		
	}
	
	@Override
	public void sendEmail(MemberVO member, String div) throws Exception {
		
		// 메일 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPId = "";
		String hostSMTPPwd = "";
		
		String fromEmail = "";
		String fromName = "";
		String subject = "";
		String msg = "";
		
		if(div.equals("findPw")) {
			subject = "샵문 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getMemberId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getMemberPw() + "</p></div>";
		}
		
		// 받는 사람 이메일 주소
		String mail = member.getMemberEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);
			
			email.setAuthentication(hostSMTPId, hostSMTPPwd);
			email.setTLS(true);
			email.addTo(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일 발송 실패 " + e);
		}
	}
	
	@Override
	public void memberFindPw(HttpServletResponse response, MemberVO member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String memberId = membermapper.memberLogin(member.getMemberId());
		
		if(membermapper.idCheck())
		
	}
	

}
