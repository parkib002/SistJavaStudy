<%@page import="data.dao.SmartAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Hi+Melody&family=Nanum+Myeongjo&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<%
  //dao
  SmartDao dao=new SmartDao();
  List<SmartDto> list=dao.getAllDatas();
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
  
  SmartAnswerDao adao=new SmartAnswerDao(); //댓글에 관한 dao
  
  for(SmartDto dto:list)
  {
	  //댓글변수에 댓글 총개수 넣기
	  int acount=adao.getAnswerList(dto.getNum()).size();
	  
	  dto.setAnswercount(acount);
  }
%>
<body>
  <div>
    <button type="button" class="btn btn-success"
    onclick="location.href='index.jsp?main=smart/smartform.jsp'">스마트폼</button>
  </div>
  
  <div class="board">
  <table class="table table-bordered" style="width: 800px;">
     <caption align="top"><b>총<%=list.size() %>개의 게시글이 있습니다</b></caption>
     <tr class="table-success">
       <th width="80">번호</th>
       <th width="380">제목</th>
       <th width="120">작성자</th>
       <th width="180">작성일</th>
       <th width="80">조회</th>
     </tr>
     <%
       if(list.size()==0)
       {%>
    	   <tr>
    	     <td colspan="5" align="center">
    	       <b>등록된 게시글이 없습니다</b>
    	     </td>
    	   </tr>
       <%}else{
       
    	   for(int i=0;i<list.size();i++)
    	   {
    	     SmartDto dto=list.get(i);
    	   %>
    		   <tr>
    		     <td align="center"><%=list.size()-i %></td>
    		     <td>
    		            		        
    		        <a href="index.jsp?main=smart/content.jsp?num=<%=dto.getNum()%>"
    		        style="text-decoration: none; color: black;">
    		           <%=dto.getSubject() %></a>
    		           
    		           <!-- 댓글개수 출력 -->
    		           <%
    		           if(dto.getAnswercount()>0)
    		           {%>
    		        	 <a style="color: red;"
    		        	 href="index.jsp?main=smart/content.jsp?num=<%=dto.getNum()%>#alist">[<%=dto.getAnswercount() %>]</a>  
    		           <%}
    		           %>
    		     </td>
    		     <td><%=dto.getWriter() %></td>
    		     <td><%=sdf.format(dto.getWriteday()) %></td>
    		     <td><%=dto.getReadcount() %></td>
    		   </tr>
    		   
    	   <%}
            
       }
     %>
  </table>
</div>
</body>
</html>