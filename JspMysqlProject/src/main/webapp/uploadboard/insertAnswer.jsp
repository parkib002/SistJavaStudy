<%@page import="uploadboard.UboardAnswerDto"%>
<%@page import="uploadboard.UboardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <jsp:useBean id="dao" class="uploadboard.UboardAnswerDao"/>
   <jsp:useBean id="dto" class="uploadboard.UboardAnswerDto"/>
   <jsp:setProperty property="*" name="dto"/>
<%
//인서트 메서드 호출
dao.insertAnswer(dto);
%>