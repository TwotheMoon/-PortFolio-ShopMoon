<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="contactBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>
    	<!-- 구글맵 api -->
    
	<!-- wayToCome.jsp 컨텐츠 -->
	<section class="contactBox opacityBox" >
	
		<div class="contactBox_title">
			<h1>Contact - 문의</h1>
		</div>
		<div class="contactBox_subtitle">
			<P>
				모든 문의 사항에 대해 <br>
				궁금하신 점이 있으시다면 여기에 남겨주세요. <br>
				성실하고 빠르게 답변 드리겠습니다.
			</P>
		</div>
		
		
		<div class="contactBox_nav">
			<a href="/contact">Contact</a> |
			<a href="/wayToCome">Way To Come</a>
		</div>
		
		<div class="contactBox_boardTitle">
			<h1>문의 게시판</h1>		
		</div>
		
		<div class="contactBox_boardBox">
			<table class="contactBox_board">
				<th>문의 날짜</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>상태</th>
				<th>답변시간</th>
				<tr>
					<td>2021.01.01</td> <td>[기타]</td> <td>재고 남아있나요?</td> <td>이더문</td> <td>N</td> <td>2021.01.02</td>
				</tr>
			</table>
			<a href="/contact/contactWriteView"><button class="contactBox_board_writeBtn">글 작성</button></a>
		</div>
		
		
	</section>
	
	<footer class="wayToComeFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>
