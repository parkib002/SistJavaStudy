<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.UploadDao"%>
<%@page import="uploadboard.UploadDto"%>
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
	String num=request.getParameter("num");

	UploadDao dao=new UploadDao();
	
	dao.updateReadCount(num);
	
	UploadDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>
</head>
<body>
<div>
	<table class="table table-bordered" style="width: 600px;">
		<tr>
		<td>		
		<h1>제목: <%=dto.getSubject() %></h1>
		<br><br>
		<h3>작성자: <%=dto.getWriter() %></h3>
		<h5>작성일: <%=sdf.format(dto.getWriteday()) %>&nbsp;&nbsp;&nbsp;조회수: <%=dto.getReadcount() %></h5>
		</td>
		</tr>
		
		
		<tr>
		<td>
		<%=dto.getContent().replace("\n", "<br>") %>
		<br>
		<a href="../save/<%=dto.getImgname()%>">
		<img src="../save/<%=dto.getImgname()%>" style="max-width: 200px;"></a>
		</td>
		</tr>
		
		<tr>
		<td align="center">
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='addForm.jsp'">글쓰기</button>
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum()%>'">삭제</button>
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='boardList.jsp'">목록</button>
		</td>
		</tr>
	</table>
</div>
</body>
</html>