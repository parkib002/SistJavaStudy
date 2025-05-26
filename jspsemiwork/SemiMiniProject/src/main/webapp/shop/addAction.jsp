<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
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
String realPath=getServletContext().getRealPath("/save");
System.out.println(realPath);

//업로드 크기
int uploadSize=1024*1024*3;

try{
MultipartRequest multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());

//입력한 데이터 읽기
String sangpum=multi.getParameter("sangpum");
String category=multi.getParameter("category");
String photo=multi.getFilesystemName("sang_photo");
String price=multi.getParameter("price");
String ipgoday=multi.getParameter("ipgoday");

//dto에 넣기
ShopDto dto=new ShopDto();

dto.setCategory(category);
dto.setSangpum(sangpum);
dto.setPhoto(photo==null?"no":photo);
dto.setPrice(Integer.parseInt(price));
dto.setIpgoday(ipgoday);

ShopDao dao=new ShopDao();

//dao
dao.insertShop(dto);

//목록이동
}catch(Exception e){
	
}
%>
<script type="text/javascript">
		location.href="../index.jsp?main=shop/shopList.jsp";
</script>
</body>
</html>