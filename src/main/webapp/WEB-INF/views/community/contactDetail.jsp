<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="contactDetailBody">
    
	<!-- contactDetail.jsp 컨텐츠 -->
	<section class="contactDetailBox opacityBox" >
		
		<img class="contactDetail_img" data-aos="fade-down"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/community/contactImg01.png">
		
		<div class="contactDetail_Box">
			
			<label class="contactDetail_writerLabel">작성자</label>
			<input class="contactDetail_writer" value="${contactInfo.memberId}" readonly>
		
			<label class="contactDetail_categoryLabel">카테고리</label>
			<input class="contactDetail_category" value="${contactInfo.contactCategory}" readonly>
			
			<label class="contactDetail_regDateLabel">작성일</label>
			<input class="contactDetail_regDate" value="${contactInfo.contactDate}" readonly> <br>
			
			<label class="contactDetail_titleLabel">제목</label>
			<input class="contactDetail_title" value="${contactInfo.contactTitle}" readonly> <br> <br> <br>
			
			<label class="contactDetail_contentsLabel">내용</label> <br>
			<textarea class="contactDetail_contents" readonly>${contactInfo.contactContents}</textarea> <br>
			
			<div class="contactDetail_Btns">
				<button class="contactDetail_linkContactListBtn">목록으로 돌아가기</button>	
				<button class="contactDetail_modifyWriteBtn">게시글 수정</button>
					
			</div>				
		</div>
		    <form id="contactDetail_moveForm" method="get">
				<input type="hidden" name="contactNo" value='<c:out value="${contactInfo.contactNo}"/>'>
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
			</form>
			
		
	</section>
	
		<!-- 글 등록 js -->
<script src="${path}/resources/js/contactDetail.js"></script>
	
	<footer class="wayToComeFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>
