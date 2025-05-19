<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	String num=request.getParameter("num");

	MemberDao dao=new MemberDao();
	
	MemberDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<script type="text/javascript">
$(function(){
	
	$(".mod").click(function(){
		
		var name=$("#name").val();
		var email=$("#email").val();
		var num=$("#num").val();
		
		
		location.href='memberUpdate.jsp?num='+num+"&name="+name+"&email="+email;
		
	})
})
</script>
<div style="margin: 200px 100px; width: 700px;">
	<table class="table table-bordered">
		
				<tr>
					<td rowspan="4" align="center">
						<img alt="" src="../image2/img/jquery_img.jpg;"
						style="width: 100px; height: 100px; border: 1px solid gray;">
					</td>
					<td>회원명: <input type="text" value="<%=dto.getName() %>" id="name">
					<input type="hidden" value="<%=dto.getNum() %>" id="num"></td>
					<td rowspan="4" align="center" valign="middle">
						<button type="button" class="btn btn-info mod"
						>수정</button>
					</td>
				</tr>
					
				
				<tr>
					<td>
					이메일: <input type="text" value="<%=dto.getEmail() %>" id="email">	
					</td>
				</tr>
				
			
	</table>
</div>
</body>
</html>