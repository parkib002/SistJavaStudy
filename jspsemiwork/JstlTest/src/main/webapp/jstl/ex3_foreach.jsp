<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<body>
	<%
		
		List<String> list=new ArrayList<>();
		
		list.add("red");
		list.add("blue");
		list.add("black");
		list.add("gray");
		list.add("green");
		list.add("magenta");
		list.add("orange");
		
		request.setAttribute("list", list);
		request.setAttribute("cnt", list.size());
		
		//세션에 아이디 저장
		session.setAttribute("id", "parkib002");
	%>
	
	<h3>1~10까지 출력</h3>
	<c:forEach var="su" begin="1" end="10">
		${su }&nbsp;
	</c:forEach>
	
	<h3>0~30까지 출력 5의 배수</h3>
	<c:forEach var="s" begin="0" end="30" step="5">
		${s }
	</c:forEach>
	<hr>
	
	<!-- requestScope가 생략됨..request에 저장된 데이터는 자바처럼 getAttribute로 얻지 않아도 출력이 가능하다 -->
	<h3>list에는 총 ${cnt }개의 색상이 있습니다</h3>
	<h3>list에는 총 ${requestScope.cnt }개의 색상이 있습니다</h3>
	
	<h3>세션 아이디 출력</h3>
	<h3>현재 로그인한 아이디는 ${sessionScope.id }입니다</h3>
	<!-- sessionScope는 requestScope와의 구분 측면에서 생략하지 않는걸 권고한다 -->
	<h3>현재 로그인한 아이디는 ${id }입니다</h3>
	
	<h3>list 전체를 테이블로 출력하기</h3>
	<table class="table table-bordered" style="width: 300px;">
		<tr>
			<th>번호</th><th>인덱스</th><th>색상</th>
		</tr>	
		
		<c:forEach var="c" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>  <!-- 무조건 1번부터 출력 -->
				<td>${i.index }</td>  <!-- 실제 list의 index값이 출력 -->
				<td>
				<b style="color: ${c}">${c }</b>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<h3>list 전체를 테이블로 출력하기 인덱스2~4</h3>
	<table class="table table-bordered" style="width: 300px;">
		<tr>
			<th>번호</th><th>인덱스</th><th>색상</th>
		</tr>	
		
		<c:forEach var="c" items="${list }" varStatus="i" begin="2" end="4">
			<tr>
				<td>${i.count }</td>  <!-- 무조건 1번부터 출력 -->
				<td>${i.index }</td>  <!-- 실제 list의 index값이 출력 -->
				<td>
				<b style="color: ${c}">${c }</b>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>