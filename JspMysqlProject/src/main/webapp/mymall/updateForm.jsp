<%@page import="mymall.MymallDto"%>
<%@page import="mymall.MymallDao"%>
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
	MymallDao dao=new MymallDao();
	MymallDto dto=dao.getOneData(num);
%>
<body>
<div style="margin: 100px 100px; width: 400px;">
	<form action="updateAction.jsp" method="post">
	<input type="text" name="num" value="<%=num%>">
	<h3 class="alert alert-info">상품수정</h3>
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
			<select name="photo" id="photo" class="form-control" style="max-width: 250px;">
			  <option value="12" <%=dto.getPhoto().contains("12")?"selected":"" %>>샤넬st단화</option>
			  <option value="2" <%=dto.getPhoto().contains("2")?"selected":"" %>>니트원피스</option>
			  <option value="4" <%=dto.getPhoto().contains("4")?"selected":"" %>>블랙슬랙스</option>
			  <option value="26" <%=dto.getPhoto().contains("26")?"selected":"" %>>곱창헤어밴드</option>
			  <option value="30" <%=dto.getPhoto().contains("30")?"selected":"" %>>보석헤어밴드</option>
			  <option value="34" <%=dto.getPhoto().contains("34")?"selected":"" %>>쁘띠반바지</option>
			</select>&nbsp;&nbsp;&nbsp;
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
	        class="form-control" style="width: 200px;" value=<%=dto.getIpgoday() %>>
	      </td>
	    </tr>
	    
	    <tr>
	      <td colspan="2" align="center">
	        <input type="submit" class="btn btn-outline-success"
	        value="상품수정">
	      	<input type="button" class="btn btn-outline-info"
	      	value="상품목록" onclick="location.href='mallList.jsp'"> 
	      </td>
	    </tr>
	  </table>
	</form>
</div>
</body>
</html>