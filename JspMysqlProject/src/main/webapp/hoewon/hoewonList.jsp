<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hoewon.HoewonDao"%>
<%@page import="hoewon.HoewonDto"%>
<%@page import="java.util.List"%>
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
	HoewonDao dao=new HoewonDao();

	List<HoewonDto> list=dao.selectHoewon();
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>
<body>
<!-- 번호 회원명 아이디 비밀번호 가입날짜 수정/삭제 -->
<div style="margin: 100px 100px; width: 800px;">
	<table class="table table-bordered">
			<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>전호번호</th>
					<th>가입날짜</th>
					<th>수정/삭제</th>
			</tr>
			
		<%
		for(int i=0;i<list.size();i++)
		{
		HoewonDto dto=list.get(i);%>
			<tr>
					<td><%=list.size()-i %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getMid() %></td>
					<td><%=dto.getPass() %></td>
					<td><%=dto.getHp() %></td>
					<td><%=sdf.format(dto.getGaipday()) %></td>
					<td><button type="button" class="btn btn-info">수정</button>
					<button type="button" class="btn btn-warning">삭제</button>
					</td>
			</tr>
		<%}
		%>	
	</table>
</div>
</body>
</html>