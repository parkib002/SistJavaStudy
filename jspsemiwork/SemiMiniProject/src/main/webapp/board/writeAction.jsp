<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="data.dao.BoardDao"/>
<jsp:useBean id="dto" class="data.dto.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
if (request.getParameter("num") != null) {
    dto.setNum(request.getParameter("num"));
    dto.setRegroup(Integer.parseInt(request.getParameter("regroup")));
    dto.setRestep(Integer.parseInt(request.getParameter("restep")));
    dto.setReglevel(Integer.parseInt(request.getParameter("relevel")));
}
  //insert
  dao.insertReboard(dto);
  //insert된 num값
  int num=dao.getMaxNum();
  //content로 바로이동
  response.sendRedirect("../index.jsp?main=board/content.jsp?num="+num);
%>