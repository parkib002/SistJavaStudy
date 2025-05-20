<%@page import="data.dao.GuestAnswerDao"%>
<%@page import="data.dto.GuestAnswerDto"%>
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
	request.setCharacterEncoding("utf-8");

	String num=request.getParameter("num");
	String myid=request.getParameter("myid");
	String content=request.getParameter("content");
	
	GuestAnswerDto dto=new GuestAnswerDto();
	
	dto.setNum(num);
	dto.setMyid(myid);
	dto.setContent(content);
	
	GuestAnswerDao dao=new GuestAnswerDao();
	
	dao.insertGuestAnswer(dto);
%>
<script type="text/javascript">
location.href="../index.jsp?main=guest/guestList.jsp";
</script>
</body>
</html>