<%@page import="data.dto.GuestAnswerDto"%>
<%@page import="data.dao.GuestAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    request.setCharacterEncoding("utf-8");

    GuestAnswerDao dao=new GuestAnswerDao();
    
	GuestAnswerDto dto=new GuestAnswerDto();
	
    String idx=request.getParameter("idx");
	String content=request.getParameter("content");
	
	dto.setContent(content);
	dto.setIdx(idx);
	
	dao.updateGuestAnswer(dto);
%>