<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:set var="rootPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>□□□ 나의 JSP 페이지 □□□</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${rootPath}/css/view.css">
</head>

<script>
$(function(){
	
	// 수정 클릭시 update controller로
	$("#btn-update").on("click",function(){
		// 새 페이지를 만들고 페이지 위에 겹치기
		document.location.href 
			= "${rootPath}/book/update?id=${bookDTO.b_code}" 
		
	})
	
	// 삭제 클릭시 delete controller로
	$("#btn-delete").click(function(){
		if(confirm("도서 정보를 삭제합니다!!!")) {
			let query = "${rootPath}/book/delete?id=${bookDTO.b_code}"
			// 	현재 페이지를 지우고, 새로운 페이지로 보여주기
			document.location.replace(query)
		}
	})

	// 독서록 작성 클릭시 read/insert controller로
	$("#btn-read").click(function(){
		document.location.href 
		= "${rootPath}/read/insert?id=${bookDTO.b_code}" 
		
	})
})
</script>

<body>

<table>
	<caption>도서 세부정보</caption>

	<tr>
	<th>BCODE</th><td>${bookDTO.b_code}</td>
	<th>도서명</th><td>${bookDTO.b_name}</td>
	</tr>

	<tr>
	<th>저자</th><td>${bookDTO.b_auther}</td>
	<th>출판사</th><td>${bookDTO.b_comp}</td>
	</tr>

	<tr>
	<th>구입일자</th><td colspan="3">${bookDTO.b_year}</td>
	</tr>
	
	<tr>
	<th>구입가격</th><td colspan="3" class="m-text">${bookDTO.b_iprice}</td>
	</tr>

</table>

<div class="btn-box">
	<a href="javascript:void(0)" 
			class="btn" id="btn-update">수정</a>
	<a href="javascript:void(0)" 
			class="btn" id="btn-delete">삭제</a>
	<a href="javascript:void(0)"
			class="btn" id="btn-read">독서록 작성</a>
</div>


</body>
</html>