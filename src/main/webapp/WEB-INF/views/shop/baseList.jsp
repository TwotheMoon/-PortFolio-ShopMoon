<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="baseListBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>

    
	<!-- baseListList.jsp 컨텐츠 -->
	<section class="baseListBox opacityBox" >
	
		<div class="baseListBox_title">
			<h1>#Moon - BASE</h1>
		</div>
		
		<div class="baseListBox_nav">
			<a href="/shop/guitarList">Guitar</a> |
			<a href="/shop/baseList">Base</a> |
			<a href="/shop/midiList">Midi</a> |
			<a href="/shop/albumList">Album</a>
		</div>
		
		<div class="baseListBox_section">
			<c:if test="${listCheck != 'empty' }">
				<c:forEach items="${list}" var="list">
					<div class="baseListBox_contents">
					
						<div class="baseList_image_wrap" data-id="${list.imageList[0].productNo}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
							<a class="baseListToDetail" href='<c:out value="${list.productNo}"/>'>
								<img class="baseListBox_imgBox_img">
							</a>
						</div> <br>
						
						<div class="baseListName">
							<a class="baseListToDetail" href='<c:out value="${list.productNo}"/>'>
								<c:out value="${list.productName}"></c:out> 
							</a>
						</div>
						<div class="baseListPrice">
							<c:out value="${list.productPrice}원"></c:out>						
						</div>
						
						
					</div>
				</c:forEach> <br>
			</c:if>
		</div>
			 
			<c:if test="${listCheck == 'empty' }">
				<div class="productListBoard_empty">
					검색 결과가 없어요.
				</div>
			</c:if>
			
				
			<!-- 페이지 이동 인터페이스 -->
			<div class="baseList_pageMaker_box">
				<ul class="baseList_pageMaker">
				
					 <c:if test="${pageMaker.prev}">
		            	<li class="pageMakerBtn baseListPrev">
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
		               	<li class="pageMakerBtn baseListNext">
		             		<a href="${pageMaker.pageEnd + 1 }">다음</a>
		               	</li>
	             	 </c:if>
            	</ul>
             </div>
             
            <form id="baseList_moveForm" action="/shop/baseList" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
			
            <!-- 검색 영역 -->
                <div class="baseListSearch_box">
                	<form id="baseListSearchForm" action="/shop/baseList" method="get">
                		<div class="baseListSearch_input">
                		<label>상품 이름</label>
                			<input class="baseListSearch_text" type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                			<button class='btn baseListSearchBtn'>검 색</button>
                		</div>
                	</form>
                </div>  
	
		
	</section>

<footer class="baseListFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
</footer>

<script type="text/javascript">
//이미지 리스트 출력
$(".baseList_image_wrap").each(function(i, obj){
		
		const bobj = $(obj);
			
		if(bobj.data("path")){
	
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			const fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
			
			console.log("이미지 경로 : " + uploadPath);
			
			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
	
	  	} else {
			
			$(this).find("img").attr('src', '${path}/resources/img/noImgSmall.png');
			
		} 
	});
</script>
	<!-- 글 목록, 페이징 js -->
<script src="${path}/resources/js/baseList.js"></script>

</body>
