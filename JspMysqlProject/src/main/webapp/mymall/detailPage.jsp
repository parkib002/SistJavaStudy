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
<%
	request.setCharacterEncoding("utf-8");

	String num=request.getParameter("num");
	String sangpum=request.getParameter("sangpum");
	String photo=request.getParameter("photo");
	String color=request.getParameter("color");
	String price= request.getParameter("price");
	String ipgoday=request.getParameter("ipgoday");
	
	MymallDao dao=new MymallDao();
	
	MymallDto dto=dao.getOneData(num);
	
%>
</head>
<body>
<div style="margin: 100px 100px; width: 400px;">
	<form action="addAction.jsp" method="post">
	<input type="hidden" value="<%=dto.getNum() %>">
	  <table class="table table-bordered">
	    <tr>
	      <th class="table-success" width="100">상품명</th>
	      <td>
	        <input type="text" name="sangpum" required="required"
	        class="form-control" style="width: 150px;" value="<%=dto.getSangpum()%>">
	      </td>
	    </tr>
	    
	    <tr>
	      <th class="table-success">상품이미지</th>
	      <td class="input-group">
			<input type="text" name="photo" value="<%=dto.getSangpum()%>">
			<img src="<%=dto.getPhoto() %>" width="50" height="50" id="myphoto">
			<script type="text/javascript">
			$("#photo").click(function(){
				var a=$(this).val();
				
				$("#myphoto").attr("src","../image/쇼핑몰사진/"+a+".jpg");
			})
			</script>	      
	      </td>
	    </tr>
	    
	     <tr>
	      <th class="table-success" width="100">색상</th>
	      <td>
	        <input type="color" name="color" 
	        class="form-control" style="width: 150px;" value="<%=dto.getColor()%>">
	      </td>
	    </tr>
	    
	     <tr>
	      <th class="table-success" width="100">가격</th>
	      <td>
	        <input type="text" name="price" required="required"
	        class="form-control" style="width: 150px;" value="<%=dto.getPrice()%>">
	      </td>
	    </tr>
	    
	     <tr>
	      <th class="table-success" width="100">입고날짜</th>
	      <td>
	        <input type="date" name="ipgoday" required="required"
	        class="form-control" style="width: 200px;" value=<%=dto.getIpgoday()%>>
	      </td>
	    </tr>
	    
	    <tr>
	      <td colspan="2" align="center">
	        <input type="submit" class="btn btn-outline-success"
	        value="상품저장">
	      	<input type="button" class="btn btn-outline-info"
	      	value="상품목록" onclick="location.href='mallList.jsp'"> 
	      </td>
	    </tr>
	  </table>
	</form>
</body>
</html>