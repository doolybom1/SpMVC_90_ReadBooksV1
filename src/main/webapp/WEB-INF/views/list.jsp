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
<link rel="stylesheet" href="${rootPath}/css/main-list.css">
<link rel="stylesheet" href="${rootPath}/css/pagination.css">

<script>
$(function() {
	
		// 리스트 목록을 클릭시 상세페이지로 이동
		$(".content-body").click(function(){
			
			if("${MEMBER}" != ""){
				let id = $(this).attr("data-id")
	
				document.location.href = "${rootPath}/book/view?id=" + id
				}else{
					document.location.href = "${rootPath}/member/login"
			}
		})
		
		$("#btn-insert").click(function() {
			if("${MEMBER}" != ""){
				document.location.href = "${rootPath}/book/insert"			
			}else{
				document.location.href = "${rootPath}/member/login"
			}
		})
		$("#btn-list").click(function() {
			if("${MEMBER}" != ""){
				document.location.href = "${rootPath}/read/list"			
			}else{
				document.location.href = "${rootPath}/member/login"
			}
		})
})

</script>


</head>
<body>	
<header>
	<h2>도서 정보</h2>
	
		<div class="tooltip">
			<span><div id="lid-location"><a id="lid" href="${rootPath}/member/logout">${MEMBER.m_id}</a></div></span>
			<div class="tooltip-content">
				<p>클릭시에 로그아웃이 됩니다</p>
			</div>
		</div>
</header>
		<!-- 
		<section>
			<input id="search" type="text" placeholder="검색어를 입력하시오">
		</section>
		 -->
		 <nav>
			 <form>
		 		<input type="text" name="search" id="search" placeholder="도서명으로 검색해주세요">
		 	</form>
			 <div class="login">
			 	<a href="${rootPath}/member/login"><button id="login">로그인</button></a>
			 </div>
			 
			 <div class="join">
			 	<a href="${rootPath}/member/join"><button id="join">회원가입</button></a>
			 </div>
		 </nav>
		 
		 
		<table class="list" border="1">
			<tr class="list-box">
				<th>도서코드</th>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>구입일자</th>
				<th>구입가격</th>
			</tr>
			<c:choose>
			<c:when test="${empty BOOK_LIST}">
				<tr><td colspan="6">데이터가 없습니다</td>
			</c:when>
			<c:otherwise>
					<c:forEach items="${BOOK_LIST}" var="book" varStatus="index">
								<tr class="content-body" data-id="${book.b_code}" data-auth="${book.b_auther}" >
									<td>${book.b_code}</td>
									<td>${book.b_name}</td>
									<td>${book.b_auther}</td>
									<td>${book.b_comp}</td>
									<td>${book.b_year}</td>
									<td>${book.b_iprice}</td>
								</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<!-- Pagination -->
				<article class="page-box">
					<ul class="page-body">
						<li class="page-item">
						<a href="${rootPath}/book/list?search=${search}&currentPageNo=${PAGE.firstPageNo}" class="page-link">&lt;&lt;</a>	
						
						<li class="page-item">
						<a href="${rootPath}/book/list?search=${search}&currentPageNo=${PAGE.prePageNo}" class="page-link">&lt;</a>
						
						<!-- begin ~ end까지 반복 -->
						<c:forEach begin="${PAGE.startPageNo}" end ="${PAGE.endPageNo}" var="page">
						<li class="page-item <c:if test="${page == PAGE.currentPageNo}">active</c:if>" >
						
						<a href="${rootPath}/book/list?search=${search}&currentPageNo=${page}" class="page-link">${page}</a>
						
						</c:forEach>
						
						<li class="page-item">
						<a href="${rootPath}/book/list?search=${search}&currentPageNo=${PAGE.nextPageNo}" class="page-link">&gt;</a>
						<li class="page-item">
						<a href="${rootPath}/book/list?search=${search}&currentPageNo=${PAGE.finalPageNo}" class="page-link">&gt;&gt;</a>
					</ul>
				</article>
		
		<div id="book_insert">
			<button id="btn-insert">도서등록</button>
			<button id="btn-list">독서록 리스트</button>
		</div>
</body>
</html>