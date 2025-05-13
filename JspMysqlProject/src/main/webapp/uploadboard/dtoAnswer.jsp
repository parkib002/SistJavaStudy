<%@page import="org.json.simple.JSONObject"%>
<%@page import="netscape.javascript.JSObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="uploadboard.UboardAnswerDto"%>
<%@page import="uploadboard.UboardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UboardAnswerDao dao=new UboardAnswerDao();

String idx=request.getParameter("idx");

//System.out.println(idx);
//전체목록 가져오기
UboardAnswerDto dto=dao.getOnedata(idx);


	JSONObject ob=new JSONObject();
	
	ob.put("nickname", dto.getNickname());
	ob.put("idx",idx);
	ob.put("content", dto.getContent());

%>
<%=ob.toString()%>
