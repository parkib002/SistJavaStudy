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
<script type="text/javascript">
$(function(){
	
	$("#del").click(function(){
		
		var a=confirm("해당 상품을 삭제하시겠습니까?")
		
		if(a==true){
			location.href="deleteAction.jsp?num=<%=dto.getNum()%>";
			}
	})
})
</script>
<body>
<div style="margin: 100px 100px; width: 400px;">
	<form action="addAction.jsp" method="post">
	<h3 class="alert alert-info">상세보기</h3>	
	<input type="hidden" value="<%=dto.getNum() %>">
	  <table class="table table-bordered">
	    <tr>
	      <th class="table-success" width="100">상품명</th>
	      <td>
	        <h3><%=dto.getSangpum() %></h3>
	      </td>
	    </tr>
	    
	    <tr>
	      <th class="table-success">상품이미지</th>
	      <td class="input-group">
			
			<img src="<%=dto.getPhoto() %>" width="100" height="50" id="myphoto">
			
	      </td>
	    </tr>
	    
	     <tr>
	      <th class="table-success" width="100">색상</th>
	      <td style="background-color: <%=dto.getColor() %>">
	      </td>
	    </tr>
	    
	     <tr>
	      <th class="table-success" width="100">가격</th>
	      <td>
	       <h3><%=dto.getPrice() %>원</h3>
	      </td>
	    </tr>
	    
	     <tr>
	      <th class="table-success" width="100">입고날짜</th>
	      <td>
	        <h3><%=dto.getIpgoday() %></h3>
	      </td>
	    </tr>
	    
	    <tr>
	      <td colspan="2" align="center">
	        <input type="button" class="btn btn-outline-success"
	        value="상품수정" onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">
	        <input type="button" id="del" class="btn btn-outline-warning"
	        value="상품삭제">
	      	<input type="button" class="btn btn-outline-info"
	      	value="상품목록" onclick="location.href='mallList.jsp'"> 
	      </td>
	    </tr>
	  </table>
	</form>
</body>
</html>