<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="uploadboard.UploadDto"%>
<%@page import="uploadboard.UploadDao"%>
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
	request.setCharacterEncoding("utf-8");

	String savePath = application.getRealPath("/save");
	int maxSize = 1024 * 1024 * 3; // 3MB

	// MultipartRequest 객체를 통해 파일과 폼 데이터를 받음
	MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());


	String writer=multi.getParameter("writer");
	String subject=multi.getParameter("subject");
	String pass=multi.getParameter("pass");
	String content=multi.getParameter("content");
	String photo=multi.getFilesystemName("photo");
	
	UploadDto dto=new UploadDto();
	
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setPass(pass);
	dto.setContent(content);
	dto.setImgname(photo);
	
	UploadDao dao=new UploadDao();
	dao.insertBoardList(dto);
	
	response.sendRedirect("boardList.jsp");
	
%>
</body>
</html>