<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page isELIgnored="false" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="memberUpdateViewBody">




	<!-- memberUpdateView.jsp 컨텐츠 -->
	<section class="memberUpdateViewBox opacityBox">
		<div class="memberUpdateViewBox_title">
			<h1>회원정보 수정</h1>
		</div>		
		<form class="memberUpdateViewBox_form" method="post">
	
			<label class="labelId">아이디</label>
			<input class="memberUpdateViewId" name="memberId" placeholder="아이디" value="${member.memberId}" readonly > <br>
					
			<label class="labelName">이름</label>	
			<input class="memberUpdateViewName" name="memberName" placeholder="이름" value="${member.memberName}" > <br>
			
			<label class="labelPhone">휴대전화</label>
			<input class="memberUpdateViewPhone" name="memberPhone" placeholder="전화번호 (숫자만 입력)" value="${member.memberPhone}" > <br>
			
			<label class="labelEmail">이메일</label>
			<input class="memberUpdateViewEmail" name="memberEmail" placeholder="이메일" value="${member.memberEmail}" > <br>
    		
    		<div class="memberUpdateAddressBox">	
   				<input class="memberUpdateAddressBtn" type="button" value="주소검색"> <br><br>
   				<input type="text" id="postcode" placeholder="우편번호" name="memberPostNum" size="6" value="${member.memberPostNum }">
   				<input type="text" id="roadAddress" placeholder="도로명주소" name="memberAddr1" value="${member.memberAddr1 }"> 
   				<input type="text" id="detailAddress" placeholder="상세주소" name="memberAddr2" value="${member.memberAddr2 }"><br><br>
     		</div>
     		
    		
     		<div>
     			<input class="signUpAddress2" type="text" id="jibunAddress" placeholder="지번주소" name="jibunAddress">
				<input type="text" id="extraAddress" placeholder="참고항목" name="extraAddress">
    		</div>
	    		
			<button class="memberUpdateViewBtn" type="submit">회원 수정</button> <br>
			
		</form>

	</section>
	
	<footer class="loginFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
	
<script src="${path}/resources/js/memberUpdate.js"></script>
    <!-- 다음 맵 api 임포트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
