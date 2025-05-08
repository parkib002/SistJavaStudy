<%@page import="org.apache.el.parser.AstDiv"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
	ServletContext context=getServletContext();
	String realFolder=context.getRealPath("/save");
	
	System.out.println(realFolder);
	
	int filesize=1024*1024*5;
	
	MultipartRequest multi=null;
	
	try{
	multi=new MultipartRequest(request,realFolder,filesize,"utf-8",new DefaultFileRenamePolicy());
	
	
	String name=multi.getParameter("name");
	String title=multi.getParameter("subject");
	String uploadFile=multi.getFilesystemName("uploadFile");
	String originalName=multi.getOriginalFileName("uploadFile");%>
	
	<div>
		<h3>이름: <%=name %></h3>
		<h3>제목: <%=title %></h3>
		<img alt="" src="../save/<%=uploadFile%>">
		<h5>원래파일명: <%=originalName %></h5>
		<button type="button" onclick="location.href='uploadForm.jsp'">다시 업로드</button>
	</div>
	
	<%}catch(Exception e){
		
	}
%>
</body>
</html>