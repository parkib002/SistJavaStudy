<%@page import="data.dto.GuestAnswerDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.GuestAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String idx=request.getParameter("idx");

	GuestAnswerDao dao=new GuestAnswerDao();
	
	String content=dao.getGuestAnswerData(idx);
	
	JSONObject ob=new JSONObject();
	
	ob.put("idx", idx);
	ob.put("content", content);
	

%>
<%=ob.toString()%>