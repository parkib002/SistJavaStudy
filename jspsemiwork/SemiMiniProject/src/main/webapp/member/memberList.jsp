<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDao dao=new MemberDao();

	List<MemberDto> list=dao.getAllMembers();

	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<script type="text/javascript">
	function delfunc(num){
		
		var a=confirm("정말 삭제하시겠습니까?");
		
		if(a)
			location.href="member/memberDelete.jsp?num="+num;
		else
			return;
	}
</script>
<div>
	<table class="table table-bordered" style="width: 900px; margin: 100px 100px;">
		<tr class="table-success" align="center">
			<th width="100">번호</th>
			<th width="100">이름</th>
			<th width="100">아이디</th>
			<th width="100">이메일</th>
			<th width="100">가입날짜</th>
			<th width="100">비고</th>
		</tr>
		
	<%
		for(int i=0;i<list.size();i++)
		{
			MemberDto dto=list.get(i);	%>
		
		<tr align="center">
			<td><%=list.size()-i%></td>
			<td><%=dto.getName() %></td> 
			<td><%=dto.getId() %></td> 
			<td><%=dto.getEmail() %></td> 
			<td><%=sdf.format(dto.getGaipday()) %></td>
			<td><button type="button" class="btn btn-warning"
			onclick="delfunc(<%=dto.getNum()%>)">강퇴</button></td> 
		</tr>	
		<%}
		%>
	</table>	
</div>
</body>
</html>