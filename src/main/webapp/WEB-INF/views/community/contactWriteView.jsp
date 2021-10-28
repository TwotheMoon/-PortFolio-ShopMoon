<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="contactWriteViewBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
    	<!-- 구글맵 api -->
    
	<!-- wayToCome.jsp 컨텐츠 -->
	<section class="contactWriteViewBox opacityBox" >
	
		<div class="contactWriteViewBox_title">
			<h1>문의 글 작성</h1>
		</div>
		<div class="contactWriteViewBox_subtitle">
			<P>
				모든 문의 사항에 대해 <br>
				궁금하신 점이 있으시다면 여기에 남겨주세요. <br>
				성실하고 빠르게 답변 드리겠습니다.

			</P>
		</div>
		
		
		<div class="contactWriteViewBox_nav">
			<a href="/contact">Contact</a> |
			<a href="/wayToCome">Way To Come</a>
		</div>
		
		<div class="contactWriteViewBox_boardTitle">
			<h1>문의 게시판 - 글 작성</h1>		
		</div>
		
		<img class="contactWriteView_img" data-aos="fade-down"  data-aos-easing="ease-in-out" data-aos-duration="1000" src="${path}/resources/img/community/contactImg01.png">
		<form class="contactWriteViewBox_writeForm" method="post">
			
			<label class="contactWrite_writerLabel">작성자</label>
			<input class="contactWrite_writer" name="memberId" value="${memberId}" readonly>
		
			<label class="contactWrite_categoryLabel">카테고리</label>
			<select class="contactWrite_category" name="contactCategory">
				<option value="상품" selected>[상품]</option>
				<option value="기타">[기타]</option>
				<option value="제휴">[제휴]</option>
			</select> <br>
			
			<label class="contactWrite_titleLabel">제목</label>
			<input class="contactWrite_title" type="text" name="contactTitle"> <br> <br> <br>
			
			<label class="contactWrite_contentsLabel">내용</label> <br>
			<textarea class="contactWrite_contents" rows="30" cols="90" name="contactContents"></textarea> <br>
		
			<button class="contactWriteView_writeBtn">작성 완료</button>	
				
		</form>
		
		
	</section>
	
		<!-- 글 등록 js -->
<script src="${path}/resources/js/contactWriteView.js"></script>
	
	<footer class="wayToComeFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>
