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
			
			<div>
				<c:if test="${dto.photo!='no' }">
					<c:forTokens var="pho" items="${dto.photo }" delims=",">
						<a href="download?clip=${pho }">
							<i class="bi bi-cloud-download"></i>
							<span>${pho }</span>
						</a>
					</c:forTokens>
				</c:if>
			</div>
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
	
	<!-- 댓글 -->
	<tr>
		<td>
			<div id="answer">댓글 목록 출력</div>
			<table>
			<c:forEach var="adto" items="${alist }" varStatus="i">
				<tr>
					<td>
						닉네임: ${adto.nickname }&nbsp;&nbsp;&nbsp;${adto.writeday }
					</td>
				</tr>
			</c:forEach>
			</table>
			
			<form action="ainsert" method="post">
				<input type="hidden" name="num" value="${dto.num }">
				<input type="hidden" name="currentPage" value="${currentPage }">
				<div class="input-group">
				<input type="text" name="nickname" class="form-control"
				style="width: 100px;" required="required" placeholder="닉네임">
				<input type="password" name="pass" class="form-control"
				style="width: 100px;" required="required" placeholder="비밀번호"></div>
				<br><br>
				<input type="text" name="content" class="form-control"
				style="width: 500px;" required="required" placeholder="댓글내용입력">
				<button type="submit" class="btn btn-info btn-sm">확인</button>
			</form>
		</td>
	</tr>
	
	<tr>
		<td align="right">
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='form'">글쓰기</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글쓰기</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='deleteform?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
			<button type="button" class="btn btn-outline-warning"
			onclick="location.href='list?currentPage=${currentPage}'">목록</button>
		</td>
	</tr>
</table>
</body>
</html>