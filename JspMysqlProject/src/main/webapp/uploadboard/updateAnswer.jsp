<%@page import="uploadboard.UboardAnswerDto"%>
<%@page import="uploadboard.UboardAnswerDao"%>
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
	String idx=request.getParameter("idx");
	String nickname=request.getParameter("nickname");
	String content=request.getParameter("content");

	UboardAnswerDto dto=new UboardAnswerDto();
	
	dto.setNickname(nickname);
	dto.setContent(content);
	dto.setIdx(idx);

	UboardAnswerDao dao=new UboardAnswerDao();
	dao.updateUboardAnswer(dto);
	
%>
</body>
</html>