<%@page import="java.text.SimpleDateFormat"%>
<%@page import="booking.BookingDto"%>
<%@page import="java.util.Vector"%>
<%@page import="booking.BookingDao"%>
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
<%
	BookingDao dao=new BookingDao();
	Vector<BookingDto> list=dao.getAllBookings();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>
<body>
<div style="margin: 250px 500px; width: 900px;">
  <table class="table table-dark">
    <tr>
      <th width="80">번호</th><th width="120">예약자명</th><th width="80">인원수</th><th width="200">예약날짜</th><th width="120">상세보기</th>
    </tr>
    <%
     if(list.size()==0){
    	 %>
    	 <tr>
    	   <td colspan="6" align="center">
    	     <h3>예약정보가 없습니다</h3>
    	   </td>
    	 </tr>
     <%}
     else{
    	for(int i=0;i<list.size();i++){
    		
    		BookingDto dto=list.get(i);%>
    		
    		<tr>
    		  <td><%=list.size()-i %></td>
    		  </td>
    		  <td>
    		  	<img src=<%=dto.getGender().equals("m")?"../image/booking/male.png":"../image/booking/female.png" %> width="30" height="30">
    		  	<%=dto.getName() %>
    		  <td><%=dto.getInwon() %></td>
    		  <td><%=dto.getBookday() %></td>
    		  <td><button type="button" class="btn btn-warning"
    		  onclick="location.href='bookingView.jsp?num=<%=dto.getNum()%>'">상세보기</button></td>
    		 </tr>
    		   
    	<%}
     }
    %>
     		  <button type="button" style="margin: 20px" class="btn btn-info"
    		  onclick="location.href='bookingForm.jsp'">예약추가</button>  
  </table>
</div>
</body>
</html>