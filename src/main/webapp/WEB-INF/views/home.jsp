<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="includes/header.jsp" />
</header>	
	
<body id="homeBody">
    
	<!-- css AOS 초기화 -->
	<script>
	    AOS.init();
	</script>
	<!-- bsSlide 초기화 -->
	<script> 
	$(document).ready(function(){
	    $('.slider').bxSlider({
	    	auto: true,
	    	speed: 2000,
	    	controls: false
	    });
	  });
	</script>
   
	<section class="homeBox opacityBox" >
		<section class="homeCarouselBox">
			<ul class="slider">
				<li><img src="${path}/resources/img/carousel/carouselImg02.jpg"></li>
				<li><img src="${path}/resources/img/carousel/carouselImg01.jpg"></li>
				<li><img src="${path}/resources/img/carousel/carouselImg03.jpg"></li>
				<li><img src="${path}/resources/img/carousel/carouselImg04.jpg"></li>
			</ul>
		</section>
		
		<!-- 상품 영역 -->
		<section class="homeContentsBox">
			<h1> 상품 영역 </h1>
			<div class="homeContentsBox_poductBox">
				<div>상품 img1</div>
				<div>상품 img2</div>
				<div>상품 img3</div>
				<div>상품 img4</div>
				<div>상품 img5</div>
				<div>상품 img6</div>
			</div>
		</section>
		
		<!-- 게시판 영역 -->
		<section class="homeBoardBox">
			<h1> 문의 게시판 </h1>
			<div class="contactBox_boardBox">
			<c:if test="${listCheck != 'empty' }">
			<table class="contactBox_board">
				<tr class="contactBox_board_header">
					<th>문의 번호</th>
					<th>문의 날짜</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>답변내용</th>
					<th>답변상태</th>
				</tr>
				<c:forEach items="${list}" var="list">
				<tr class="contact_board_contents">
					<td>
						<a class="contactDetail" href='<c:out value="${list.contactNo}"/>'>
							<c:out value="${list.contactNo}"></c:out>
						</a>
					</td>
					<td><c:out value="${list.contactDate}"></c:out></td>
					<td><c:out value="[${list.contactCategory}]"></c:out></td> 
					<td>
						<a class="contactDetail" href='<c:out value="${list.contactNo}"/>'>
							<c:out value="${list.contactTitle}"></c:out> 
						</a>	
					</td>
					<td>
						<a class="contactDetail" href='<c:out value="${list.contactNo}"/>'>
							<c:out value="${list.contactContents}"></c:out>
						</a>
					</td>
					<td><c:out value="${list.memberId}"></c:out></td>
					<td><c:out value="${list.contactReply}"></c:out></td>
					<td><c:out value="${list.contactAnswer}"></c:out></td>
				</tr>
				</c:forEach>
			</table>
			</c:if>
           
		</div>
		    <form id="contactList_moveForm" action="/community/contactList" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
		</section>
	</section>
	
	<script src="${path}/resources/js/contactList.js"></script>
	<footer class="homeFooterBox" >
		<jsp:include page="includes/footer.jsp" />
	</footer>

</body>

