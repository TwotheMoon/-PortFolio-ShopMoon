<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="productListBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>

    
	<!-- productList.jsp 컨텐츠 -->
	<section class="productListBox opacityBox" >
	
		<div class="productListBox_title">
			<h1>상품 목록</h1>
		</div>
		
		<div class="productListBox_nav">
			<a href="/admin/adminMain">관리자 페이지</a> |
			<a href="/admin/productEnrollView">상품 등록</a> |
			<a href="/admin/productList">상품 관리</a> |
			<a href="#">회원 관리</a> |
		</div>
		
		<div class="productListBox_boardTitle">
			<h1>상품 관리</h1>		
		</div>
		
		<div class="productListBox_boardBox">
			<c:if test="${listCheck != 'empty' }">
			<table class="productList_board" style=”table-layout:fixed”>
				<tr class="productList_board_header" style="word-break:break-all">
					<th>상품 번호</th>
					<th>상품 이미지</th>
					<th>카테고리</th>
					<th>상품 이름</th>
					<th>상품 내용</th>
					<th>가격</th>
					<th>재고</th>
					<th>판매여부</th>
					<th>베스트여부</th>
					<th>입고 날짜</th>
					<th>수정 날짜</th>
				</tr>
				<c:forEach items="${list}" var="list">
				<tr class="productList_board_contents">
					<td>
						<a class="productDetail" href='<c:out value="${list.productNo}"/>'>
							<c:out value="${list.productNo}"></c:out>
						</a>
					</td>
					<td><c:out value="${list.productImg}"></c:out></td>
					<td><c:out value="[${list.productCategory}]"></c:out></td> 
					<td>
						<a class="productDetail" href='<c:out value="${list.productNo}"/>'>
							<c:out value="${list.productName}"></c:out> 
						</a>	
					</td>
					<td>
						<a class="productDetail" href='<c:out value="${list.productNo}"/>'>
							<c:out value="${list.productContents}"></c:out>
						</a>
					</td>
					<td><c:out value="${list.productPrice}"></c:out></td>
					<td><c:out value="${list.productStock}"></c:out></td>
					<td><c:out value="${list.productActive}"></c:out></td>
					<td><c:out value="${list.productBest}"></c:out></td>
					<td><fmt:formatDate value="${list.productRegDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
					<td><fmt:formatDate value="${list.productUpdateDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
				</tr>
				</c:forEach>
			</table>
			</c:if>
			<c:if test="${listCheck == 'empty' }">
				<div class="productListBoard_empty">
					검색 결과가 없어요.
				</div>
			</c:if>
			<!-- 페이지 이동 인터페이스 -->
			<div class="productList_pageMaker_box">
				<ul class="productList_pageMaker">
				
					 <c:if test="${pageMaker.prev}">
		            	<li class="pageMakerBtn productListPrev">
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
		               	<li class="pageMakerBtn productListNext">
		             		<a href="${pageMaker.pageEnd + 1 }">다음</a>
		               	</li>
	             	 </c:if>
            	</ul>
             </div>
             
            <form id="productList_moveForm" action="/admin/productList" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
			
            <!-- 검색 영역 -->
                <div class="productListSearch_box">
                	<form id="productListSearchForm" action="/admin/productList" method="get">
                		<div class="productListSearch_input">
                		<label>상품 이름</label>
                			<input class="contactListSearch_text" type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                			<button class='btn productListSearchBtn'>검 색</button>
                		</div>
                	</form>
                </div>  
			<button class="productListBox_board_writeBtn">글 작성</button>
		</div>

	</section>
	<!-- 글 목록, 페이징 js -->
<script src="${path}/resources/js/productList.js"></script>

	<footer class="wayToComeFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
	</footer>
</body>
