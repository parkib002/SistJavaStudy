<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	MemberDao dao=new MemberDao();

	List<MemberDto> list=dao.getAllMembers();

	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<script type="text/javascript">
$(function(){
	

	
	$(".del").click(function(){
	
		var num=$("#delnum").val();
		var pass=$("#delpass").val();
		
		//alert(num);
		//alert(pass);
		
		location.href="./index.jsp?main=/member/deleteMypage.jsp?num="+num+"&pass="+pass;
	})
	
	
})

	function delMypage(num){
		
		$("#delnum").val(num);
	}
</script>
<div style="margin: 200px 100px; width: 700px;">
	<table class="table table-bordered">
		<%
			for(MemberDto dto:list)
			{%>
				<tr>
					<td rowspan="4" align="center">
						<img alt="" src="image2/img/jquery_img.jpg;"
						style="width: 100px; height: 100px; border: 1px solid gray;">
					</td>
					<td>회원명: <%=dto.getName() %></td>
					<td rowspan="4" align="center" valign="middle">
						<button type="button" class="btn btn-info">수정</button>
						  <button type="button" class="btn btn-primary tal" data-bs-toggle="modal" data-bs-target="#myModal"
						  onclick="delMypage(<%=dto.getNum()%>)">
   							 탈퇴
  						</button>
					</td>
				</tr>
					
				<tr>
					<td>
					아이디: <%=dto.getId() %>
					</td>
				</tr>
				
				<tr>
					<td>
					이메일: <%=dto.getEmail() %>	
					</td>
				</tr>
				
				<tr>
					<td>
					가입일: <%=sdf.format(dto.getGaipday()) %>
					</td>
				</tr>
			<%}
		%>
	</table>
</div>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">삭제확인</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <b>삭제비밀번호: </b>
        <input type="password" class="form-control" id="delpass">
        <input type="hidden" class="form-control" id="delnum" value="">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" class="btn btn-danger del" data-bs-dismiss="modal">Yes</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<script type="text/javascript">

</script>
</body>
</html>