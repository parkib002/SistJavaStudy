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
</head>
<body>
<% 
	//db선언
	UploadDao dao=new UploadDao();

	//리스트 가져오기
	List<UploadDto> list=dao.getAllDatas();
%>
<body>
<div style="margin: 100px 100px; width: 800px;">
	<b><%=list.size() %>개의 이미지가 있습니다</b>
	
	<br>
	
	
	 <b>이미지형 목록보기</b>
	 	<button type="button" class="btn btn-warning btn-sm"
	 	onclick="location.href='boardList.jsp'" style="margin-left: 650px;">목록형게시판</button>
	 	
	 
	 <table class="table table-bordered"> 
	 <tr>
	 <%
	 //날짜형식
	 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	 
	 for(int i=0;i<list.size();i++)
	 {
		 UploadDto dto=list.get(i); //i번째 리스트 값
		 %>
		 <td>
		 	<a href="detailView.jsp?num=<%=dto.getNum()%>">
		 	<img src="../save/<%=dto.getImgname()%>" style="width: 100px;
		 	height: 100px; margin: 5px; border: 1px solid gray">
		 	<br>
		 	제목: <%=dto.getSubject() %>
		 	</a>
		 	<br>
		 	작성자: <%=dto.getWriter() %>
		 	<br>
		 	작성일: <%=sdf.format(dto.getWriteday()) %>
		 	<br>
		 	조회수: <%=dto.getReadcount() %>
		 	<br>
		 	</td>
	 <%
	 if((i+1)%4==0)
	 {%>
		</tr> 
	 <%}
	 }
	 %>
	</table>
</div>
</body>
</html>