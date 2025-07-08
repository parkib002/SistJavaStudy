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
<style type="text/css">
	body *{
        font-family: 'Nanum Brush Script';
    }
    
    a:link,a:visited {
		color: black;
		text-decoration: none;
	}
	
	a:hover {
		color: hotpink;
	}
	
	ul.mymenu{
		list-style: none;
		margin: 50px;
		display: block;
	}

	ul.mymenu li{
		float: left;
		 width: 100px;
		height: 40px;
		line-height: 40px;
		text-align: center;
		 background-color: #ffe4e1; 
		margin-right: 10px;
		border: 1px solid gray;
		border-radius: 20px; 
	} 
	
	ul.mymenu li:hover{
		background-color: gray;
		box-shadow: 5px 5px 5px gray;
	}

	/* 새로 추가되거나 변경된 CSS */
	.main-header {
		display: flex; /* 플렉스 컨테이너로 설정 */
		align-items: center; /* 세로 중앙 정렬 */
		justify-content: space-between; /* 로고와 로그인 버튼을 양 끝으로 분리 */
		height: 120px;
		padding: 10px 30px;
		position: relative; /* z-index를 위해 필요할 수 있습니다 */
	}

	.header-logo {
		flex-grow: 1; /* 로고가 차지할 수 있는 공간을 유연하게 만듦 */
		text-align: center; /* 로고 이미지 자체를 중앙 정렬 */
	}

	.header-logo a {
		display: inline-block; /* img에 링크가 있을 때 중앙 정렬을 위해 */
	}

	.header-login-section {
		display: flex;
		align-items: center;
		gap: 10px;
		white-space: nowrap;
		/* 기존 margin-left: auto; 대신 justify-content: space-between;으로 해결 */
	}
</style>
<script type="text/javascript">
$(function(){
	
	$("#btnlogin").click(function(){
		
			var id=$("#id").val();
			var pass=$("#pass").val();
			var root='${root}';
			
			$.ajax({
		
			type:"get",
			url:root+"/member/login",
			dataType:"json",
			data:{"id":id,"pass":pass},
			success:function(res){
				
				if(res.result=='success'){
					location.reload();
				}else{
					alert("정보가 맞지 않습니다")
				}
				
			}
			
		})
	})
	
	$("#logout").click(function(){
		
		var root='${root}';
		
		$.ajax({
			
			type:"get",
			url:root+"/member/logout",
			dataType:"html",
			success:function(){
				
				location.reload();
			}
		})
		
		
	})
	
})

</script>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>

<div class="main-header">
  <div class="header-logo">
    <a href="${root}/">
      <img src="/save/jquery_img.jpg" style="height: 70px; max-width: 100%;">
    </a>
  </div>

  <div class="header-login-section">
    <c:if test="${sessionScope.myid == null}">
      <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#myModal" style="white-space: nowrap;">
        Login
      </button>
    </c:if>
    <c:if test="${sessionScope.myid != null}">
      <img src="/membersave/${sessionScope.loginphoto}" style="width: 60px; height: 60px; border-radius: 50%;">
      <button type="button" class="btn btn-outline-danger" id="logout">
        Logout
      </button>
    </c:if>
  </div>
</div>

<ul class="mymenu">
	<li>
		<a href="${root }/">Home</a>
	</li>
	<li>
		<a href="${root }/ipgo/list">상품목록</a>
	</li>
	<li>
		<a href="${root }/member/form">회원가입</a>
	</li>
	<li>
		<a href="${root }/member/list">회원목록</a>
	</li>
	<li>
		<a href="${root }/board/list">게시판</a>
	</li>
</ul>

<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title">Login</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
  <div style="display: flex; gap: 10px; align-items: stretch;">
    
    <div style="display: flex; flex-direction: column; gap: 10px;">
      <input type="text" name="id" id="id" placeholder="아이디입력" style="width: 350px; height: 40px;" class="form-control">
      <input type="password" name="pass" id="pass" placeholder="비밀번호입력" style="width: 350px; height: 40px;" class="form-control">
    </div>
    
    <button type="button" class="btn btn-outline-success" style="width: 100px; height: 90px;" id="btnlogin">Login</button>
  </div>
</div>

      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>