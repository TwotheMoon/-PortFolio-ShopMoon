<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="contactModifyBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
    
	<!-- contactModify.jsp 컨텐츠 -->
	<section class="contactModifyBox opacityBox" >
		
		<img class="contactModify_img" data-aos="fade-down"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/community/contactImg01.png">
		
		<form class="contactModify_form" action="/community/contactModify" method="post"> 
			<input type="hidden" name="contactNo" value="<c:out value='${contactInfo.contactNo }'></c:out>" readonly>
			
			<label class="contactModify_writerLabel">작성자</label>
			<input class="contactModify_writer" name="memberId" value="<c:out value='${contactInfo.memberId }'></c:out>" readonly>
		
			<label class="contactModify_categoryLabel">카테고리</label>
			<input class="contactModify_category" name="contactCategory" value="<c:out value='${contactInfo.contactCategory }'></c:out>" readonly>
			
			<label class="contactModify_regDateLabel">작성일</label>
			<input class="contactModify_regDate" name="contactDate" value="<c:out value='${contactInfo.contactDate }'></c:out>"  readonly> <br>
			
			<label class="contactModify_titleLabel">제목</label>
			<input class="contactModify_title" name="contactTitle" value="<c:out value='${contactInfo.contactTitle }'></c:out>" > <br> <br> <br>
			<span id="warn_contactTitle"> 제목을 입력 해주세요.</span> <br>
			
			<label class="contactModify_contentsLabel">내용</label> <br>
			<textarea class="contactModify_contents" name="contactContents" >${contactInfo.contactContents}</textarea> <br>
			<span id="warn_contactContents"> 내용을 입력 해주세요.</span>
			
			<div class="contactModify_Btns">
				<button class="contactModify_comitBtn">수정 완료</button>	
				<button class="contactModify_modifyCancleBtn">수정 취소</button>				
			</div>
				
		</form>
		
		    <form id="contactModify_moveForm" method="get">
				<input type="hidden" name="contactNo" value='<c:out value="${contactInfo.contactNo }"/>'>
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
