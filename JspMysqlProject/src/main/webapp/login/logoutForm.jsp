<%@page import="login.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//세션에 저장한 아이디를 읽어온다
	String id=(String)session.getAttribute("idok");
	//아이디에 해당하는 이름을 dao로부터 얻기
	LoginDao dao=new LoginDao();
	String name=dao.getName(id);
%>
<br><br>
<div style="margin: 100px 200px;">
<b><%=name %></b> 님이 로그인중입니다
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-danger btn-sm"
onclick="location.href='logoutAction.jsp'">로그아웃</button>
<br>

<img src="../image/logoImg/img2.jpg">
</div>
</body>
</html>