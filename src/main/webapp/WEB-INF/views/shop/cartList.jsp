<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="headerBox" >
	<jsp:include page="${path }../includes/header.jsp" />
</header>

<body id="albumListBody">
    <!-- css AOS 초기화 -->
    <script>
        AOS.init();
    </script>

    
	<!-- albumListList.jsp 컨텐츠 -->
	<section class="albumListBox opacityBox" >
	
		<div class="albumListBox_title">
			<h1><c:out value="${member.memberId}님의 장바구니"></c:out></h1>
		</div>
		
		<div class="albumListBox_nav">
			<a href="/shop/guitarList">Guitar</a> |
			<a href="/shop/bassList">Bass</a> |
			<a href="/shop/midiList">Midi</a> |
			<a href="/shop/albumList">Album</a>
		</div>
		
		<div class="albumListBox_section">
			<div class="albumListBox_contents">
			
				<div class="albumList_image_wrap" data-id="${list.imageList[0].productNo}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
					<a class="albumListToDetail" href='<c:out value="${list.productNo}"/>'>
						<img class="albumListBox_imgBox_img">
					</a>
				</div> <br>
				
				<div class="albumListName">
					<a class="albumListToDetail" href='<c:out value="${list.productNo}"/>'>
						<c:out value="${list.productName}"></c:out> 
					</a>
				</div>
				<div class="albumListPrice">
					<c:out value="${list.productPrice}원"></c:out>						
				</div>
				
				
			</div>
		</div>
	
	</section>

<footer class="albumListFooterBox" >
		<jsp:include page="${path }../includes/footer.jsp" />
</footer>

<script type="text/javascript">
//이미지 리스트 출력
$(".albumList_image_wrap").each(function(i, obj){
		
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
<script src="${path}/resources/js/albumList.js"></script>

</body>
