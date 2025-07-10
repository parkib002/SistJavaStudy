<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
body{
	font-family: 'Orbit';
	font-size: 2em;
}
	
.container{
	position: absolute;
	left: 400px;
	top: 100px;
}
</style>
</head>
<body>
<div class="container">
	<div style="margin-left: 330px; margin-bottom: 30px;">
	<button type="button" class="btn btn-outline-primary"
	onclick="location.href='form'">글 작성하기</button>
	</div>
	
	<c:if test="${count==0 }">
		<div class="alert alert-info" style="width: 800px;">
			<b>저장된 정보가 없습니다</b>
		</div>
	</c:if>
	
	<c:if test="${count>0 }">
		<div class="alert alert-info" style="width: 800px;">
			<b>총 ${count }개의 게시글이 있습니다</b>
		</div>
		
		<table class="table table-bordered" style="width: 800px;">
			<tr align="center" valign="middle" class="table-warning">
				<th width="80">번호</th>
				<th width="180">제목</th>
				<th width="120">작성자</th>
				<th width="180">작성일</th>
			</tr>
			
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr align="center" valign="middle">
				<td>${i.count }</td>
				<td>
				<a href="detailform?num=${dto.num }">${dto.subject }</a>
				<c:if test="${dto.photo!='no' }">
				<i class="bi bi-image" style="color: gray;"></i>
				</c:if>
				</td>
				<td>${dto.writer }</td>
				<td>
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
		</table>
	</c:if>
</div>	
</body>
</html>