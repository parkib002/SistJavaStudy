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
    width: 100%;
    margin: 0 ;
  }
  
  .container { 
    display: flex;
    flex-direction: column; /* 세로로 쌓기 */
    align-items: center;     /* 가로 정렬 중앙 */
    justify-content: center; /* 세로 정렬 중앙 */
    height: 100%;
  }
</style>
</head>
<body>
<div class="container">
	<jsp:include page="../../layout/header.jsp"/>
<table class="table table-bordered" style="width: 600px;">
	<tr>
		<td width="100">
			<c:if test="${dto.uploadfile=='no' }">
				<img src="/save/noimage.jpeg">
			</c:if>
			
			<c:if test="${dto.uploadfile!='no' }">
				<img src="/boardsave/${dto.uploadfile }">
			</c:if>
		</td>
		
		<td>
			제목: ${dto.subject }<br>
			작성자: ${dto.myid }<br>
			조회수: ${dto.readcount }<br>
			등록일: <fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/><br>
			내용: ${dto.content }
		</td>
	</tr>
	
</table>
</div>
</body>
</html>