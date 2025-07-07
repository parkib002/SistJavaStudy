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
</head>
<!-- 프로젝트 절대 경로 -->
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>

<!-- 제목 클릭시 메인 페이지 이동  -->

<h2><a href="${root }/"><img src="/save/jquery_img.jpg"></a>
	<br>SpringBoot+Mybatis 프로젝트
</h2>

<ul>
	<li>
		<a href="${root }/">Home</a>
	</li>
	<li>
		<a href="${root }/ipgo/list">상품목록</a>
	</li>
	<li>
		<a href="${root }/member/list">회원목록</a>
	</li>
	<li>
		<a href="${root }/board/list">회원게시판</a>
	</li>
</ul>
</body>
</html>