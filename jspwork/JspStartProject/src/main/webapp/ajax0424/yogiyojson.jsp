<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.db.DbConnect"%>
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
	DbConnect db=new DbConnect();
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select * from yogiyo order by food_no";
	
	String s="[";
	
	try{
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next())
	{
		String food_no=rs.getString("food_no");
		String food_name=rs.getString("food_name");
		String food_photo=rs.getString("food_photo");
		String price=rs.getString("price");
		String cnt=rs.getString("cnt");
		
		s+="{";
		s+="\"번호\":\""+food_no+"\",\"음식명\":\""+food_name+"\",\"사진\":\""+food_photo+"\",\"가격\":\""+price
				+"\",\"개수\":\""+cnt+"\"";
		s+="},";
		
	}
	
	//마지막 컴마 제거
	s=s.substring(0, s.length()-1);
	
	}catch(SQLException e){
		
	}finally{
	
	db.dbClose(rs, pstmt, conn);
	}
	
	s+="]";
%>
<%=s %>
</body>
</html>