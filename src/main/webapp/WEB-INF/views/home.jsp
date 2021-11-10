<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="includes/header.jsp" />
</header>	
	
<body id="homeBody">

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
			<h1> WHAT'S BEST </h1>
			<div class="homeContentsBox_poductBox">
				<div>
					<a href="http://localhost:8085/shop/guitarDetail?pageNum=1&amount=8&keyword=&productNo=56">
						<img alt="guitar_화이트팔콘" src="${path}/resources/img/home/homeImg01.jpg">
					</a>
				</div>
				<div>
					<a href="http://localhost:8085/shop/guitarDetail?pageNum=1&amount=8&keyword=&productNo=59">
						<img alt="guitar_팬더스트렛" src="${path}/resources/img/home/homeImg02.jpg">
					</a>
				</div>
				<div>
					<a href="http://localhost:8085/shop/guitarDetail?pageNum=1&amount=8&keyword=&productNo=57">
						<img alt="base_코로나베이스" src="${path}/resources/img/home/homeImg03.jpg">
					</a>
				</div>
				<div>
					<a href="http://localhost:8085/shop/guitarDetail?pageNum=1&amount=8&keyword=&productNo=65">
						<img alt="midi_스칼렛2i2" src="${path}/resources/img/home/homeImg04.jpg">
					</a>
				</div>
				<div>
					<a href="http://localhost:8085/shop/guitarDetail?pageNum=1&amount=8&keyword=&productNo=86">
						<img alt="album_베큐엄" src="${path}/resources/img/home/homeImg05.jpg">
					</a>
				</div>
				<div>
					<a href="http://localhost:8085/shop/guitarDetail?pageNum=1&amount=8&keyword=&productNo=84">
						<img alt="album_인큐" src="${path}/resources/img/home/homeImg06.jpg">
					</a>
				</div>
			</div>
		</section>
		
		<!-- 텍스트 영역-->
		<section class="homeContents2Box">
			<div class="homeContents2Box_imgSection1">
				<div class="homeContents2Box_imgSection1_contents">
					<a href="/shop/midiList">
						<img alt="작곡가" src="${path}/resources/img/home/homeImg08.png" >
					</a>
					<span class="homeContents2Box_imgSection1_header">당신이 만약 작곡가라면?</span>
					<span class="homeContents2Box_imgSection1_text">
						Scalett Solo와 PC 또는 MAC에서 스튜디오 퀄리티의 음악을<br>
						제작할 수 있는 도구를 제공합니다.
					</span>
				</div>
				<div class="homeContents2Box_imgSection1_contents">
					<a href="/shop/guitarList">
						<img alt="연주자" src="${path}/resources/img/home/homeImg09.jpg" >
					</a>
					<span class="homeContents2Box_imgSection1_header2">당신이 연주자라면?</span>
					<span class="homeContents2Box_imgSection1_text2">
						Fender, Podera 등 다양한 악기를 통해<br>
						당신의 연주를 표현할 수 있습니다.
					</span>
				</div>
			</div>
			<div class="homeContents2Box_imgSection2">
					<h1 class="homeContents2Box_imgSection2_header">TODAY'S BEST ALBUM</h1>
				<a href="http://localhost:8085/shop/guitarDetail?pageNum=1&amount=8&keyword=&productNo=80">
					<img alt="오늘의 앨범" src="${path}/resources/img/home/homeImg10.jpg" >
				</a>
				<div>
					<div class="homeContents2Box_imgSection2_text">
						백예린 커버 앨범 [선물] <br><br>
						1-1. 그럴때마다 <br>
						1-2. Antifreeze <br>
						1-3. 돌아가자 <br>
						1-4. 왜? 날 <br>
						1-5. 한계 <br>
						1-6. 산책 
					</div>
				</div>
			</div>
		</section>
		
		<!-- 게시판 영역 -->
		<section class="homeBoardBox">
			<h1> CONTACT </h1>
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
	
	<footer class="homeFooterBox" >
		<jsp:include page="includes/footer.jsp" />
	</footer>

	<script src="${path}/resources/js/contactList.js"></script>
	<script src="${path}/resources/js/todoList.js"></script>
</body>

