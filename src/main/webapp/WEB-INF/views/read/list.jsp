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

<style>
	*{
		margin: 0;
		paddin:0;
	}
	.list{
		border:1px solid black;
		margin: auto;
		width: 1000px;
		overflow : auto;
	}
	
	.content-body td{
		padding: 5px;
	}
	.content-body:hover{
		cursor: pointer;
		background-color: #55616a;
		transition: 0.5s;
		color: white;
	}

	header h2{
		text-align: center;
		margin :1rem;
		font-family: 'Open Sans','Helvetica Neue',Helvetica,Arial,sans-serif;
		font-size: 30px;
		color: #55616a;
	}
	.list-box th{
		padding: 5px 7px;
		background-color: #f7f7f7;
	} 

	#read_insert{
		display:block;
		margin: 10px auto;
		text-align: center;
	}
	
	#read_insert button{
		padding: 10px;
		background-color: tomato;
		color:white;
		border-style: none;
		font-weight: bold;
	}
	#read_insert button:hover{
		cursor: pointer;
	}
	section{
		margin: 5px 25.6%;
	}
	#search{
		padding: 0.5rem;
		width: 450px;
	}
	.list{
		border-collapse: collapse;
		text-align: center;
	}
	#main{
		cursor: pointer;
		margin: 5px;
		padding: 6px 8px;
		background-color: #212529;
		border:	none;
		color:white;
		border-radius: 5px;
		font-size: 15px;
	}
	#main:hover{
		cursor: pointer;
		background-color: gray;
	}
	
	#btn-main{
		
		text-align: center !important;
	}

</style>
	
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
				<tr><td colspan="7"></td>
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
		<div id="btn-main">
			<button type="button" id="main">메인 화면</button>
		</div>
</body>
</html>