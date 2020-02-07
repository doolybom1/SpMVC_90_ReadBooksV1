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
<link rel="stylesheet" href="${rootPath}/css/read/view.css">
</head>
<style>

</style>
<script>
$(function(){
	
	// 새 페이지를 만들고 페이지 위에 겹치기
	$("#btn-update").on("click",function(){
		document.location.href 
			= "${rootPath}/read/update?id=${readBookDTO.rb_seq}" 
		
	})
	
	// 	현재 페이지를 지우고, 새로운 페이지로 보여주기
	$("#btn-delete").click(function(){
		if(confirm("도서 정보를 삭제합니다!!!")) {
			let query = "${rootPath}/read/delete?id=${readBookDTO.rb_seq}"
			document.location.replace(query)
		}
	})

})
</script>

<body>

<table>
	<caption>독서록 세부정보</caption>

	<tr>
	<th>SEQ</th><td>${readBookDTO.rb_seq}</td>
	<th>도서코드</th><td>${readBookDTO.rb_bcode}</td>
	</tr>

	<tr>
	<th>독서일자</th><td>${readBookDTO.rb_date}</td>
	<th>독서시작시각</th><td>${readBookDTO.rb_stime}</td>
	</tr>

	<tr>
	<th>한줄소감</th><td>${readBookDTO.rb_subject}</td>
	<th>긴줄소감</th><td>${readBookDTO.rb_text}</td>
	</tr>

	<tr>
	<th>별점</th><td>${readBookDTO.rb_star}</td>
	<th>작성자</th><td>${readBookDTO.rb_writer}</td>
	</tr>

</table>

<div class="btn-box">
	<a href="javascript:void(0)" 
			class="btn" id="btn-update">수정</a>
	<a href="javascript:void(0)" 
			class="btn" id="btn-delete">삭제</a>
</div>


</body>
</html>