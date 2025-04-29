<%@page import="java.text.SimpleDateFormat"%>
<%@page import="gaip.GaipDto"%>
<%@page import="java.util.Vector"%>
<%@page import="gaip.GaipDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
	background-image: url("../image/avata/b1.png"), 
						url("../image/avata/b10.png"),
						url("../image/avata/b7.png"),
						url("../image/avata/b9.png");
	background-repeat: repeat-x, repeat-x, repeat-y, repeat-y;
	background-position: top center, bottom center, left center, right center;
	background-size: auto, auto, auto, auto;
	
}

div{
	text-align: center;
}
</style>
<meta charset="UTF-8">
   <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<%
	GaipDao dao=new GaipDao();
	Vector<GaipDto> list=dao.getAllGaips();
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>
<body>
<div style="margin: 250px 500px; width: 900px;">
  <table class="table table-dark">
    <tr>
      <th width="80">번호</th><th width="120">회원명</th><th width="80">연령대</th><th width="200">연락처</th><th width="200">가입일자</th><th width="120">상세보기</th>
    </tr>
    <%
     if(list.size()==0){
    	 %>
    	 <tr>
    	   <td colspan="5" align="center">
    	     <h3>가입한 회원정보가 없습니다</h3>
    	   </td>
    	 </tr>
     <%}
     else{
    	for(int i=0;i<list.size();i++){
    		
    		GaipDto dto=list.get(i);%>
    		
    		<tr>
    		  <td><%=list.size()-i %></td>
    		  <td><%=dto.getName() %></td>
    		  <td><%=dto.getAge() %></td>
    		  <td><%=dto.getHp() %></td>
    		  <td><%=sdf.format(dto.getGaipday()) %></td>
    		  <td><button type="button" class="btn btn-warning"
    		  onclick="location.href='detailPage.jsp?num=<%=dto.getNum()%>'">상세보기</button></td>
    		 </tr>
    		   
    	<%}
     }
    %>
     		  <button type="button" style="margin: 20px" class="btn btn-info"
    		  onclick="location.href='addForm.jsp'">회원정보추가</button>  
  </table>
</div>
</body>
</html>