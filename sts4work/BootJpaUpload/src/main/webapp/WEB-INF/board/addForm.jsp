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
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
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
	<form action="insert" method="post" enctype="multipart/form-data">
		<table class="table table border" style="width: 500px;">
			<tr>
				<th width="100px;" class="table-warning">작성자</th>
				<td>
					<input type="text" name="writer" class="form-control"
					style="width: 200px;" required="required">
				</td>
			</tr>
			
			<tr>
				<th width="100px;" class="table-warning">제목</th>
				<td>
					<input type="text" name="subject" class="form-control"
					style="width: 200px;" required="required">
				</td>
			</tr>
			
			<tr>
				<th width="100px;" class="table-warning">사진</th>
				<td>
					 <div style="display: flex; align-items: center; gap: 10px;">
           			 <input type="file" name="upload" class="form-control"
                     style="width: 200px;" id="myphoto">
           			 <img alt="" src="/save/noimage.jpeg" id="showimg" style="width: 50px; height: 50px;">
    			    </div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<textarea style="width: 480px; height: 100px;"
					required="required" name="content" class="form-control"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-danger">추가</button>
					<button type="button" class="btn btn-outline-success"
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>