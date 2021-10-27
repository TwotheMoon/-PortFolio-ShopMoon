<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page isELIgnored="false" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="deleteMemberViewBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
       	<!-- 회원가입 js -->
<script src="${path}/resources/js/memberDeleteView.js" async></script>
    
	<!-- login.jsp 컨텐츠 -->
	<section class="deleteMemberViewBox opacityBox">
		<div class="deleteMemberView_title">
			<h1>회원 탈퇴</h1>
		</div>		
			<h3 class="deleteMemberView_subTitle">아이디와 비밀번호를 적어주세요 꼭 다시 만나요!</h3>
		
		<form class="deleteMemberView_form"  method="post">
			<input class="loginId" name="memberId" placeholder="아이디" required> <br>
			<input class="loginPw" name="memberPw" type="password" placeholder="비밀번호" required> <br>
			<c:if test="${result == 0}">
				<div class="LoginFail">아이디 또는 비밀번호를 잘못 입력했어요.</div>
			</c:if>
			
			<button class="deleteMemberViewBtn">회원 탈퇴</button>

		</form>

		
	</section>
	
	<!-- 회원삭제 js -->
<script src="${path}/resources/js/memberDelete.js"></script>
	<footer class="loginFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>

</body>
