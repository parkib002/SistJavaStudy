<%@page import="uploadboard.UploadDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="uploadboard.UploadDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
request.setCharacterEncoding("utf-8");

String savePath = application.getRealPath("/save");
int maxSize = 1024 * 1024 * 3; // 3MB

// MultipartRequest 객체를 통해 파일과 폼 데이터를 받음
MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());


String num=multi.getParameter("num");
String currentPage=multi.getParameter("currentPage");
String photo=multi.getFilesystemName("photo");
String pass=multi.getParameter("pass");
String content=multi.getParameter("content");

UploadDto dto=new UploadDto();

dto.setContent(content);
dto.setImgname(photo);
dto.setNum(num);

UploadDao dao=new UploadDao();

boolean flag=dao.isEqualPass(num, pass);

if(flag){
	dao.updateData(dto);
	response.sendRedirect("detailView.jsp?num="+num+"&currentPage="+currentPage);
}else{%>
	<script type="text/javascript">
		alert("비밀번호가 맞지 않습니다");
		history.back();
	</script>
<%}
}catch(Exception e){
	System.out.println("업로드 오류: "+e.getMessage());
}
%>
</body>
</html>