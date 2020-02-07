<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 홈페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${rootPath}/css/read/list.css">
<link rel="stylesheet" href="${rootPath}/css/pagination.css">
	
<script>
$(function() {
	
	// 리스트 목록을 클릭시 상세페이지로 이동
	$(".content-body").click(function(){
		let id = $(this).attr("data-id")

		document.location.href = "${rootPath}/read/view?id=" + id
	})
	
	$("#main").click(function() {
		document.location.href = "${rootPath}/book/list"
	})
})
</script>
</head>
<body>	
<header>
	<h2>독서록 리스트</h2>
</header>
		<table class="list" border="1" >
			<tr class="list-box">
			
				<th>SEQ</th>
				<th>도서코드</th>
				<th>도서명</th>
				<th>독서일자</th>
				<th>한줄소감</th>
				<th>별점</th>
				<th>작성자</th>
			</tr>
			<c:choose>
			<c:when test="${empty READ_LIST}">
				<tr><td colspan="7">데이터가 없습니다</td>
			</c:when>
			<c:otherwise>
					<c:forEach var="read"  items="${READ_LIST}" varStatus="status">
								<tr class="content-body" data-id="${read.rb_seq}">
									<td>${read.rb_seq }</td>
									<td>${read.rb_bcode}</td>
									<td>${read.bookNameList[0].b_name}</td>
									<td>${read.rb_date}</td>
									<td>${read.rb_subject}</td>
									<td>${read.rb_star}</td>
									<td>${read.rb_writer}</td>
								</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<!-- Pagination -->
		 <article class="page-box">
			<ul class="page-body">
				<li class="page-item">
				<a href="${rootPath}/read/list?currentPageNo=${PAGE.firstPageNo}" class="page-link">&lt;&lt;</a>	
				
				<li class="page-item">
				<a href="${rootPath}/read/list?currentPageNo=${PAGE.prePageNo}" class="page-link">&lt;</a>
				
				<!-- begin ~ end까지 반복 -->
				<c:forEach begin="${PAGE.startPageNo}" end ="${PAGE.endPageNo}" var="page">
				<li class="page-item <c:if test="${page == PAGE.currentPageNo}">active</c:if>" >
				
				<a href="${rootPath}/read/list?currentPageNo=${page}" class="page-link">${page}</a>
				
				</c:forEach>
				
				<li class="page-item">
				<a href="${rootPath}/read/list?currentPageNo=${PAGE.nextPageNo}" class="page-link">&gt;</a>
				<li class="page-item">
				<a href="${rootPath}/read/list?currentPageNo=${PAGE.finalPageNo}" class="page-link">&gt;&gt;</a>
			</ul>
			</article>
		
		<div id="btn-main">
			<button type="button" id="main">메인 화면</button>
		</div>
</body>
</html>