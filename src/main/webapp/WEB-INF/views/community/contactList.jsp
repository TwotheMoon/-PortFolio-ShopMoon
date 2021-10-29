<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<a href="/community/contactList">Contact</a> |
			<a href="/wayToCome">Way To Come</a>
		</div>
		
		<div class="contactBox_boardTitle">
			<h1>문의 게시판</h1>		
		</div>
		
		<div class="contactBox_boardBox">
			<c:if test="${listCheck != 'empty' }">
			<table class="contactBox_board" style=”table-layout:fixed”>
				<tr class="contactBox_board_header" style="word-break:break-all">
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
					<td><c:out value="${list.contactNo}"></c:out></td>
					<td><c:out value="${list.contactDate}"></c:out></td>
					<td><c:out value="[${list.contactCategory}]"></c:out></td> 
					<td><c:out value="${list.contactTitle}"></c:out></td> 
					<td><c:out value="${list.contactContents}"></c:out></td>
					<td><c:out value="${list.memberId}"></c:out></td>
					<td><c:out value="${list.contactReply}"></c:out></td>
					<td><c:out value="${list.contactAnswer}"></c:out></td>
				</tr>
				</c:forEach>
			</table>
			</c:if>
			<c:if test="${listCheck == 'empty' }">
				<div class="contactBoard_empty">
					검색 결과가 없어요.
				</div>
			</c:if>
			<!-- 페이지 이동 인터페이스 -->
			<div class="contactList_pageMaker_box">
				<ul class="contactList_pageMaker">
				
					 <c:if test="${pageMaker.prev}">
		            	<li class="pageMakerBtn contactListPrev">
		            		<a href="${pageMaker.pageStart - 1}">이전</a>
		            	</li>
		             </c:if>
		                	
		              	<!-- 페이지 번호 -->
		             <c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
		              	<li class="pageMakerBtn ${pageMaker.cri.pageNum == num ? "active":""}">
		              		<a href="${num}">${num}</a>
		              	</li>
		             </c:forEach>
		              	
		               	<!-- 다음 버튼 -->
		             <c:if test="${pageMaker.next}">
		               	<li class="pageMakerBtn contactListNext">
		             		<a href="${pageMaker.pageEnd + 1 }">다음</a>
		               	</li>
	             	 </c:if>
            	</ul>
             </div>
             
            <form id="contactList_moveForm" action="/community/contactList" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
			
            <!-- 검색 영역 -->
                <div class="contactListSearch_box">
                	<form id="contactListSearchForm" action="/community/contactList" method="get">
                		<div class="contactListSearch_input">
                		<label>작성자</label>
                			<input class="contactListSearch_text" type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                			<button class='btn contactListSearchBtn'>검 색</button>
                		</div>
                	</form>
                </div>  
		<button class="contactBox_board_writeBtn">글 작성</button>
		${loginConfirm }
		</div>
		
	</section>
	<!-- 글 목록, 페이징 js -->
<script src="${path}/resources/js/contactList.js"></script>
	<footer class="wayToComeFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>
