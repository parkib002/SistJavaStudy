<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<body>
	<h5 class="alert alert-info" style="width: 800px;">총 ${totalCount }개의 데이터가 있습니다</h5>
	<br>
	<button type="button" class="btn btn-info btn-sm"
	onclick="location.href='writeform'">글쓰기</button>
	
	<table class="table table-bordered" style="width: 800px;">
		<tr class="table-warning">
			<th width="100">번호</th>
			<th width="380">작성자</th>
			<th width="180">제목</th>
			<th width="180">작성일</th>		
		</tr>
		
		<c:forEach var="item"  items="${list }" varStatus="i">
		<fmt:formatDate var="date" value="${item.writeday }" pattern="yyyy-MM-dd"/>
		<tr>
			<td width="100">${i.count }</td>
			<td width="380">
			<a href="content?num=${item.num }">${item.subject }</a>
			</td>
			<td width="180">${item.writer }</td>
			<td width="180">${date }</td>	
		</tr>
		</c:forEach>
		
	</table>
</body>
</html>