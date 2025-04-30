<%@page import="booking.BookingDto"%>
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
	String num=request.getParameter("num");

	BookingDao dao=new BookingDao();
	BookingDto dto=dao.getOneData(num);
	
	String photo=dto.getFoodphoto();
	String [] src=photo.split(",");
	
	String price=dto.getFoodprice();
	String [] tot=price.split(",");
	
	
	String name="";
	int totPrice=0;
	int allPrice=0;
	
%>
<script type="text/javascript">
 $(function(){
	 $("#del").click(function(){
		var del=confirm("예약을 취소하시겠습니까?")
		
		if(del==true)
			location.href="deleteBooking.jsp?num=<%=dto.getNum()%>";
			
	 })
 })
</script>
<body>
<div style="margin: 100px 100px">
<table class="table table-bordered">
	<caption align="top"><h3 class="alert alert-success"><%=dto.getName() %>님의 예약정보</h3></caption>
	<tr>
	<th width="200" class="table-success">성별</th>
	<td><%=dto.getGender().equals("m")?"남자":"여자" %></td>
	</tr>
	<tr>
	<th width="200" class="table-success">메뉴</th>
	<td><%
		
	
		for(int i=0;i<src.length;i++)
		{
			 name="["+src[i].substring(17, src[i].length()-4)+":"+tot[i]+"원]";
			 totPrice=Integer.parseInt(tot[i]);
			 allPrice+=Integer.parseInt(tot[i]);
		%>
			<img src="<%=src[i] %>" width="50px" height="50px">
		  	<h3>메뉴 및 가격:<br> <%=name%></h3>
				
				
			
		<%}
		
	%>  <br><h1>총금액: <%=allPrice %>원</h1>	</td>
	</tr>
	<tr>
	<th width="200" class="table-success">인원수</th>
	<td>
		<h3><%=dto.getInwon() %>명</h3>		
	</td>
	</tr>
	<tr>
	<th width="200" class="table-success">요청사항</th>
	<td><%=dto.getMessage() %></td>
	</tr>
		<tr>
	<th width="200" class="table-success">예약일시</th>
	<td><%=dto.getWriteday() %></td>
	</tr>
	<tr>
	<td colspan="2" align="right">
	 <input type="button" class="btn btn-success" value="수정"
	 onclick="location.href='bookingUpdateForm.jsp?num=<%=dto.getNum() %>'">	
	 <input type="button" id="del" class="btn btn-success" value="취소"
	 onclick="">
	 <input type="button" class="btn btn-success" value="목록"
	 onclick="location.href='bookingList.jsp'">
	 </td>
	</tr>
	
</table>
</div>
</body>
</html>