<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="mymall.MymallDao"%>
<%@page import="mymall.MymallDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String sangpum=request.getParameter("sangpum");
	String photo=request.getParameter("photo");
	String color=request.getParameter("color");
	String price=request.getParameter("price");
	String ipgoday=request.getParameter("ipgoday");
	
	MymallDto dto=new MymallDto();
	
	dto.setSangpum(sangpum);
	dto.setPhoto("../image/쇼핑몰사진/"+photo+".jpg");
	dto.setColor(color);
	dto.setPrice(Integer.parseInt(price));
	dto.setIpgoday(ipgoday);
	
	MymallDao dao=new MymallDao();
	
	dao.insertMymall(dto);
	
	response.sendRedirect("mallList.jsp");
%>
</body>
</html>