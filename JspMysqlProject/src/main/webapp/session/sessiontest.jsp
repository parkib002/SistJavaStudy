<%@page import="java.util.Date"%>
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
	//세션 저장하는 방법
	session.setAttribute("msg", "Happy day");
    session.setMaxInactiveInterval(60); //60초
%>

<h3>세션값 얻기</h3>
 세션값: <%=session.getAttribute("msg") %><br>
 세션유지시간: <%=session.getMaxInactiveInterval() %>초<br>
 세션생성시간: <%=session.getCreationTime() %><br>
 세션생성시간: <%=new Date(session.getCreationTime()) %>
 
</body>
</html>