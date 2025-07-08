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


<div class="alert alert-success" style="width: 800px;">
	<b>총 ${count }명의 회원이 있습니다</b>
</div>

	<table class="table" style="width: 800px;">
		
		
		<c:forEach var="dto" items="${list }">
		 
		 <tr>
		 <td width="400" rowspan="4" align="center">
		 
		 <c:if test="${dto.photo!=no }">
		 	<c:forTokens var="photoname" items="${dto.photo}" delims="," begin="0" end="0">
				<a href="/membersave/${dto.photo}"><img src="/membersave/${dto.photo}" style="width: 150px; height: 150px;"></a>
		 	</c:forTokens>
		 </c:if>
		 </td>
		 
		 <td>
			회원명: ${dto.name}
		</td>
		</tr>
		<tr>
		<td>
			전화번호: ${dto.hp}
		</td>
		</tr>
		<tr>
		<td>	
			이메일: ${dto.email }
		</td>
		</tr>
		<tr>
		<td>
			<button type="button" class="btn btn-outline-info"
			onclick="location.href=''">수정</button>
			<button type="button" class="btn btn-outline-danger"
			onclick="location.href=''">삭제</button>
		</td>
		</tr>
		
		</c:forEach>
	</table>
	</div>
</body>
</html>