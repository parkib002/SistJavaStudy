<%@page import="uploadboard.UboardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");
	System.out.println(idx);

	UboardAnswerDao dao=new UboardAnswerDao();
	
	dao.deleteUboardAnswer(idx);
%>