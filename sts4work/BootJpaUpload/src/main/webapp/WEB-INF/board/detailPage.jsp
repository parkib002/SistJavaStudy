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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
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
<table class="table table-bordered" style="width: 600px;">
	<tr>
		<td>
			<h3>${dto.subject }</h3>
			<br>
			<span style="float: right; margin-right: 20px;">
				<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/>
			</span>
			<h6>작성자: ${dto.writer }</h6>
			
	</tr>
	
	<tr>
		<td>
			<div>
				<c:if test="${dto.photo!='no' }">
					<img alt="" src="/save/${dto.photo }">
				</c:if>
			</div>
				
				${dto.content }
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			 <button type="button" class="btn btn-outline-primary"
			 onclick="location.href='update?num=${dto.num}'">수정
  			</button>
			<button type="button" class="btn btn-outline-danger"
			onclick="location.href='delete?num=${dto.num}'">삭제</button>
		</td>
	</tr>
</table>
</div>
</body>
</html>