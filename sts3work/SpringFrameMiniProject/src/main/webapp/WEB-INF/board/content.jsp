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
<table class="table table-bordered" style="width: 600px;">
	<tr>
		<td>
			<h3>${dto.subject }</h3>
			<br>
			<span style="float: right; margin-right: 20px;">조회: ${dto.readcount }&nbsp;&nbsp;&nbsp;&nbsp;
				<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/>
			</span>
			<h6>작성자: ${dto.writer }</h6>
		</td>
	</tr>
	
	<tr>
		<td>
			<pre>
				${dto.content }
			</pre>
				
				<c:if test="${dto.photo!='no' }">
					<c:forTokens var="im" items="${dto.photo }" delims=",">
						<a><img src="../photo/${im }" 
						style="width: 150px; height: 150px; border-radius: 20px;
						border:2px solid purple;"></a>
					</c:forTokens>
				</c:if>
		</td>
	</tr>
	
	<tr>
		<td align="right">
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='form'">글쓰기</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글쓰기</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href=''">수정</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href=''">삭제</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href=''">목록</button>
		</td>
	</tr>
</table>
</body>
</html>