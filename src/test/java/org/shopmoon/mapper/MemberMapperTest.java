package org.shopmoon.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.shopmoon.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest {

		@Autowired
		private MemberMapper membermapper; // MemberMapper.java 의존성 주입
		
		@Test // 회원 등록 테스트
		public void memberJoin() throws Exception{
			MemberVO member = new MemberVO();
			
			member.setMemberId("test");
			member.setMemberPw("test");
			member.setMemberName("test");
			member.setMemberEmail("test");
			member.setMemberPostNum("test");
			member.setMemberAddr1("test");
			member.setMemberAddr2("test");
			member.setMemberPhone("test");
			
			
			membermapper.memberJoin(member);
		}
		
		@Test // 아이디 중복 검사 테스트
		public void memberIdChk() throws Exception{
			String id1 = "admin";
			String id2 = "dfjsl";
			membermapper.idCheck(id1);
			membermapper.idCheck(id2);
		}
		
		@Test // 로그인 테스트
		public void memberLogin() throws Exception{
			
			MemberVO member = new MemberVO();
			
			member.setMemberId("2theMoon");
			member.setMemberPw("Rjqnrdl94!@");
			
			membermapper.memberLogin(member);
			System.out.println("결과 : " + membermapper.memberLogin(member));
		}
}
