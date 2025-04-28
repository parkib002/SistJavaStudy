<%@page import="ajaxmemo.MemoDto"%>
<%@page import="ajaxmemo.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
	String writer=request.getParameter("uwriter");
	String content=request.getParameter("ucontent");
	String emot=request.getParameter("uemot");
	String num=request.getParameter("unum");
	
	MemoDto dto=new MemoDto();
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setEmot(emot);
	dto.setNum(num);
	
	MemoDao dao=new MemoDao();
	dao.updateMemo(dto);
	
%>