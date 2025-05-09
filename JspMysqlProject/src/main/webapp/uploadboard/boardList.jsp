<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.UploadDto"%>
<%@page import="java.util.List"%>
<%@page import="uploadboard.UploadDao"%>
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
<style type="text/css">
 a{
 	text-decoration: none;
 	color: black;
 }
</style>
</head>
<% 
	//db선언
	UploadDao dao=new UploadDao();

	//리스트 가져오기
	List<UploadDto> list=dao.getAllDatas();
%>
<body>
<div style="margin: 100px 100px; width: 800px;">
	<b><%=list.size() %>개의 글이 있습니다</b>
	
	<br>
	
	<table class="table table-bordered">
	 <caption align="top"><b>게시판형 목록보기</b>
	 	<button type="button" class="btn btn-warning btn-sm"
	 	onclick="location.href='imageList.jsp'" style="margin-left: 650px;">앨범형게시판</button>
	 	<button type="button" class="btn btn-warning btn-sm"
	 	onclick="location.href='addForm.jsp'" style="margin-left: 650px;">글쓰기</button>
	 </caption>
	 
	 <tr class="table-success">
	 	<th width="100">번호</th>
	 	<th width="350">제목</th>
	 	<th width="130">작성자</th>
	 	<th width="180">작성일</th>
	 	<th width="100">조회수</th>
	 </tr> 
	 
	 <%
	 //날짜형식
	 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	 
	 for(int i=0;i<list.size();i++)
	 {
		 UploadDto dto=list.get(i); //i번째 리스트 값%>
		 
		 <tr>
		 	<td><%=list.size()-i %></td>
		 	<!-- 제목 클릭시 content보기로 간다 -->
		 	<td>
		 		<a href="detailView.jsp?num=<%=dto.getNum() %>"><%=dto.getSubject() %></a>
		 	</td>
		 	<td><%=dto.getWriter() %></td>
		 	<td><%=sdf.format(dto.getWriteday()) %></td>
		 	<td><%=dto.getReadcount() %></td>
		 </tr>
	 <%}
	 %>
	</table>
</div>
</body>
</html>