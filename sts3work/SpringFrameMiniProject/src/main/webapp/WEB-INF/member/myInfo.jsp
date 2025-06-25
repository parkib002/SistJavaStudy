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
<script type="text/javascript">
	function del(num){
		
		var a=confirm("정말 탈퇴하시겠어요?")
		
		if(a){
		location.href="deleteinfo?num="+num;
		}	
	}
	
</script>
<body>
	<div style="width: 600px;">
		<table class="table table-bordered">
			<c:forEach var="dto" items="${list }">
			
			<c:if test="${sessionScope!=null and sessionScope.myid==dto.id}">
				<tr>
					<td style="width: 200px;" align="center" rowspan="4">
						<img alt="" src="../image/jquery_img.jpg" width="200px;">
						
					</td>
					<td>회원명: ${dto.id }</td>
					<td rowspan="4" valign="middle" align="center">
						<button type="button" class="btn btn-outline-warning btn-sm"
						onclick="location.href='updateform?num=${dto.num}'">수정</button>
						<button type="button" class="btn btn-outline-danger btn-sm"
						onclick="del(${dto.num})">탈퇴</button>
					</td>
				</tr>
				<tr>
					<td>이름: ${dto.name }</td>
				</tr>
				<tr>
					<td>번호: ${dto.hp }</td>
				</tr>
				<tr>
					<td>가입일: ${dto.gaipday }</td>
				</tr>
				
			</c:if>
			</c:forEach>
		</table>	
	</div>
</body>
</html>