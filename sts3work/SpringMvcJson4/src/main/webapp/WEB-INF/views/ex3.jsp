<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<body>
<h3 class="alert alert-info">3번째 예제 출력</h3>
<br>
<h4>메뉴 이름을 입력 후 엔터를 눌러주세요</h4>
<input type="text" id="search" name="name" class="form-control"
style="width: 150px;">
<br><br>
<h2 id="foodName"></h2>
<br>
<img alt="" src="" id="photo">

<script type="text/javascript">
	//메뉴명 입력 후 엔터 누를 때 출력
	$("#search").keyup(function(e){
		
		if(e.keyCode==13){
			
			var name=$(this).val();
			
			$.ajax({
				
				type:"get",
				url:"list3",
				dataType:"json",
				data:{"name":name},
				success:function(res){
					
					$("#foodName").empty();
					$("#foodName").append(res.name);
					$("#photo").attr("src","image/Food/"+res.photo)
					
				}
			})
		}
		
	})
	
</script>
</body>
</html>