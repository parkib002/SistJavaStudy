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
<title>Insert title here</title>
<style type="text/css">
	i.camera{
		cursor: pointer;
		margin-left: 20px;
		font-size: 2em;
		color: blue;
	}
	
	#showimg{
		position: absolute;
		left: 650px;
		top: 150px;
		max-width: 150px;
		max-height: 150px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("i.camera").click(function(){
			
			$("#photo").trigger("click");
		})
	});
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#showimg').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
<%
	//로그인상태
	String loginok=(String)session.getAttribute("loginok");
	String myid=(String)session.getAttribute("myid");
	

	if(loginok!=null){%>

		<!-- 이미지 미리보기 -->
		<div style="margin: 100px 100px;">
		<img id="showimg">
		<form action="guest/guestProc.jsp" method="post"
		enctype="multipart/form-data">
		
			<!-- hidden으로 아이디 넣기 -->
			<input type="hidden" name="myid" value="<%=myid%>">
			<table class="table table-bordered" style="width: 500px;">
			<caption align="top"><b>회원방명록</b></caption>
			<tr height="150">
				<td>
					<b>사진을 선택해주세요(1개)</b>
					<i class="bi bi-camera-fill fs-2 camera"></i>
					<input type="file" name="photo" id="photo"
					style="display: none;" onchange="readURL(this)">
					<br>
					<textarea style="width: 380px; height: 80px"
					required="required" name="content"></textarea>
					<button type="submit" class="btn btn-outline-success"
					style="width: 80px; height: 80px; float: right">저장</button>
				</td>			
			</tr>
			</table>
		</form>
		</div>		
	<%}else{%>
		<b>먼저 로그인을 해주세요!!!</b>
	<%}
%>
</body>
</html>