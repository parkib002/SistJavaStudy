<%@page import="data.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String num=request.getParameter("num");
%>
<body>
<div>
<h2>비밀번호를 입력하세요</h2>
<form action="board/deleteAction.jsp" method="post">
	<input type="password" name="pass" value="">
	<input type="hidden" name="num" value="<%=num%>">
	<button type="submit">삭제</button>
</form>
</div>
</body>
</html>