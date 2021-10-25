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
		
		@Test
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
}
