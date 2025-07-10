<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
body{
	font-family: 'Orbit';
	font-size: 2em;
}
	
.container{
	position: absolute;
	left: 400px;
	top: 100px;
}
</style>
<script type="text/javascript">
$(function(){
	
	$("#myphoto").change(function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            
            reader.onload = function(event) {
                $("#showimg").attr("src", event.target.result);
            };
            
            reader.readAsDataURL(file);
        }

	});
})
</script>
</head>
<body>
<div style="margin: 100px 10px; width: 500px">
	<form action="updateProc" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${dto.num }">
		<table class="table table border" style="width: 500px;">
			<tr>
				<th width="100px;" class="table-warning">작성자</th>
				<td>
					<input type="text" name="writer" class="form-control"
					style="width: 200px;" readonly="readonly" value="${dto.writer }">
				</td>
			</tr>
			
			<tr>
				<th width="100px;" class="table-warning">제목</th>
				<td>
					<input type="text" name="subject" class="form-control"
					style="width: 200px;" required="required" value="${dto.subject }">
				</td>
			</tr>
			
			<tr>
				<th width="100px;" class="table-warning">사진</th>
				<td>
				
				<div style="display: flex; align-items: center; gap: 10px;">
		            <input type="file" name="upload" class="form-control"
		                   style="width: 200px;" id="myphoto">
            		<c:if test="${dto.photo!='no' }">
					<img alt"" src="/save/${dto.photo }" style="width: 50px; height: 50px;" id="showimg">
					</c:if>
					<c:if test="${dto.photo=='no' }">
					<img alt"" src="/save/noimage.jpeg" style="width: 50px; height: 50px;" id="showimg">
					</c:if>
       			 </div>
					
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<textarea style="width: 480px; height: 100px;"
					required="required" name="content" class="form-control">${dto.content }</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-danger">수정</button>
					<button type="button" class="btn btn-outline-success"
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>