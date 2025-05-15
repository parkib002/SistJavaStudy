<%@page import="java.io.File"%>
<%@page import="guest.GuestDao"%>
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
	String num=request.getParameter("num");
	String photo=request.getParameter("photo");

	String uploadPath=getServletContext().getRealPath("/save");
	
	//파일생성
	File file=new File(uploadPath+"\\"+photo);
	//파일삭제
	if(file.exists()) //파일이 존재하면
		file.delete(); //파일 삭제
		
	//db삭제
	
	GuestDao dao=new GuestDao();
	
	dao.deleteGuest(num);
	
	response.sendRedirect("guestList.jsp");
%>
</body>
</html>