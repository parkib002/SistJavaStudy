<%@page import="booking.BookingDao"%>
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
<%
	String num=request.getParameter("num");
	BookingDao dao=new BookingDao();
	BookingDto dto=dao.getOneData(num);
	
%>
<body>
<div style="margin: 100px 100px; width: 800px;">


<!-- onsubmit이벤트는 action이 호출되기 전에 발생
리턴값을 false로 받으면 action이 호출되지 않는다 -->
	<form action="updateAction.jsp" method="post" onsubmit="return check()">
	<input type="text" name="num" value=<%=num %>>
	  <table class="table table-bordered">
	    <tr>
	      <th width="100" style="background-color: beige;">예약자명</th>
	      <td>
	        <input type="text" name="name" class="form-control"
	        autofocus="autofocus" required="required" style="width: 200px;"
	        placeholder="예약자명 입력" value="<%=dto.getName() %>">
	      </td>
	    </tr>
	    
	    <tr>
	      <th width="100" style="background-color: beige;">성별</th>
	      <td>
			<label>
			  <input type="radio" name="gender" value="f"
			  <%=dto.getGender().equals("f")?"checked":"" %>>
			  <img src="../image/booking/female.png" width="50">
			</label>
			&nbsp;
			<label>
			  <input type="radio" name="gender" value="m"
			  <%=dto.getGender().equals("m")?"checked":"" %>>
			  <img src="../image/booking/male.png" width="50">
			</label>	      
	      </td>
	    </tr>
	    
	    <tr>
		  <th width="100" style="background-color: beige;">예약시간</th>
		  <td>
		    <input type="datetime-local" name="local" class="form-control"
		    style="width: 200px;" required="required" value="<%=dto.getBookday()%>">
		  </td>
	    </tr>
	    
	    <tr>
	      <th width="100" style="background-color: beige;">인원수</th>
	      <td>
	        <input type="number" name="inwon" min="2" max="6"
	        class="form-control" style="width: 80px" value="<%=dto.getInwon()%>">
	      </td>
	    </tr>
	    
	    <tr>
	      <th width="100" style="background-color: beige;">메뉴선택</th>
	      <td>
	        <label>
	          <input type="checkbox" name="food" value="갈비찜.jpg,23000"
	           <%=dto.getFoodphoto().contains("갈비찜")?"checked":"" %>>갈비찜<br>
	          <img src="../image/booking/갈비찜.jpg" width="80" height="80"
	          border="1" >
	        </label>
	         <label>
	          <input type="checkbox" name="food" value="꼬치구이.jpg,18000"
	           <%=dto.getFoodphoto().contains("꼬치구이")?"checked":"" %>>꼬치구이<br>
	          <img src="../image/booking/꼬치구이.jpg" width="80" height="80"
	          border="1">
	        </label>
	         <label>
	          <input type="checkbox" name="food" value="순두부라면.jpg,23000"
	           <%=dto.getFoodphoto().contains("순두부라면")?"checked":"" %>>순두부라면<br>
	          <img src="../image/booking/순두부라면.jpg" width="80" height="80"
	          border="1">
	        </label>
	         <label>
	          <input type="checkbox" name="food" value="오므라이스.jpg,23000"
	           <%=dto.getFoodphoto().contains("오므라이스")?"checked":"" %>>오므라이스<br>
	          <img src="../image/booking/오므라이스.jpg" width="80" height="80"
	          border="1">
	        </label>
	         <label>
	          <input type="checkbox" name="food" value="콘치즈.jpg,23000"
	           <%=dto.getFoodphoto().contains("콘치즈")?"checked":"" %>>콘치즈<br>
	          <img src="../image/booking/콘치즈.jpg" width="80" height="80"
	          border="1">
	        </label>
	      </td>
	    </tr>
	     
	    <tr>
	     <th width="100" style="background-color: beige;">메세지</th>
	      <td>
	        <textarea style="width: 500px; height: 80px"
	        class="form-control" required="required" name="message"><%=dto.getMessage() %></textarea>
	      </td>
	    </tr>
	    
	    <tr>
	      <td colspan="2" align="center">
	        <button type="submit" class="btn btn-outline-danger"
	        style="width: 120px;">수정하기</button>
	        <button type="reset" class="btn btn-outline-danger"
	        style="width: 120px;">다시하기</button>
	        <button type="button" class="btn btn-outline-danger"
	        style="width: 120px;" onclick="location.href='bookingList.jsp'">예약목록</button>
	      </td>
	    </tr>
	  </table>
	</form>
</div>
</body>
</html>