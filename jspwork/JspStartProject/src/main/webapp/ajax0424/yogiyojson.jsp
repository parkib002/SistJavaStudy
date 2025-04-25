<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		s+="\"food_no\":\""+food_no+"\",\"food_name\":\""+food_name+"\",\"food_photo\":\""+food_photo+"\",\"price\":\""+price
				+"\",\"cnt\":\""+cnt+"\"";
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
