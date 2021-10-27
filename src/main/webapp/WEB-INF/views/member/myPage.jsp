<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page isELIgnored="false" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="myPageBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
   	<!-- 회원가입 js -->
<script src="${path}/resources/js/myPage.js" async></script>
    <!-- 다음 맵 api 임포트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


	<!-- login.jsp 컨텐츠 -->
	<section class="myPageBox opacityBox">
		<div class="myPageBox_title">
			<h1><c:if test="${member != null }"><span>${member.memberName}님 의 </span>My Page</h1></c:if>
		</div>		
		<div class="myPageBox_form">
			
			<label class="labelId">아이디</label>
			<input class="myPageId" value="${member.memberId}" readonly> <br>
			
			<label class="labelName">이름</label>
			<input class="myPageName" value="${member.memberName}" readonly> <br>
			
			<label class="labelPhone">휴대전화</label>
			<input class="myPagePhone" value="${member.memberPhone}" readonly> <br>
			
			<label class="labelEmail">이메일</label>
			<input class="myPageEmail" value="${member.memberEmail}" readonly> <br>
    		
    		<label class="labelAddress">주소</label>
    		<input class="myPageAddress" value="(${member.memberPostNum}) ${member.memberAddr1} ${member.memberAddr2}" readonly> <br>
    		
    		<label class="labelRegDate">가입일</label>
    		<input class="myPageRegDate" value="${member.memberRegDate}" readonly> <br>
    		
    		<div class="myPageBtnBox">
				<a href="/member/memberUpdateView"><button class="modifyMemberBtn" type="button">회원정보 수정</button></a>
				<a href="/member/memberDeleteView"><button class="deleteMemberBtn" type="button">회원 탈퇴</button></a> <br>
    		</div>
		</div>
		
	</section>
	
	<footer class="myPageFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
	

</body>
