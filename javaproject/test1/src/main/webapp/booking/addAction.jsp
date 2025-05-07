<%@page import="booking.BookingDao"%>
<%@page import="booking.BookingDao"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="booking.BookingDto"%>
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

	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String time=request.getParameter("local");
	String inwons=request.getParameter("inwon");
	String msg=request.getParameter("message");
	String [] menu=request.getParameterValues("food");
	
	String foodname="";
	String foodprice="";
	
	for(String f:menu)
	{
		String [] data=f.split(",");
		foodname+="../image/booking/"+data[0]+",";
		foodprice+=data[1]+",";
	}
	
	//반복문 나와서 마지막 ,지우기
	foodname=foodname.substring(0, foodname.length()-1);
	foodprice=foodprice.substring(0, foodprice.length()-1);
	
	int inwon=Integer.parseInt(inwons);
	
	BookingDto dto=new BookingDto();
	dto.setName(name);
	dto.setGender(gender);
	dto.setBookday(time);
	dto.setInwon(inwon);
	dto.setMessage(msg);
	dto.setFoodphoto(foodname);
	dto.setFoodprice(foodprice);
	
	BookingDao dao=new BookingDao();
	dao.insertBooking(dto);
	
	response.sendRedirect("bookingList.jsp");
	
%>
</body>
</html>