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
<script type="text/javascript">
	$(function(){
		
		//id중복체크
		
		$("#btnCheck").click(function(){
			
			var check=$("#id").val();
			
			//alert(check);
			
			$.ajax({
				
				type:"post",
				url:"member/idCheck.jsp",
				data:{"id":check},
				dataType:"json",
				success:function(res){
					
					if(res.count==1)
						//alert("이미 가입된 아이디입니다");
					$("span.idsuccess").text("fail");
					else{
						//alert("사용 가능한 아이디입니다");
					$("span.idsuccess").text("ok!");
					}
				}
			})
		})
		
		$("#selemail").change(function(){
			
			if($(this).val()=='-')
				$("#email2").val('');
			else
				$("#email2").val($(this).val());
		})
	})
	
	function check(f){
			
		if(f.pass1.value!=f.pass2.value){
			alert("비밀번호가 서로 다릅니다")
			f.pass1.value="";
			f.pass2.value="";
			return false;
		}
	}
</script>
</head>
<body>
<div style="margin: 100px 200px;">
<form action="member/memberAdd.jsp" method="post" onsubmit="return check(this)">
	<table class="table table-bordered" style="width: 500px;">
		<caption align="top"><b>회원가입</b></caption>
		<tr>
			<th width="100" class="table-info">아이디</th>
			<td class="input-group">
				<input type="text" name="id" id="id" class="form-control"
				maxlength="10" required="required" style="max-width: 150px;">&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-danger"
				id="btnCheck">중복체크</button>
				<span class="idsuccess"></span>
			</td>
		</tr>
		
		<tr>
			<th width="100" class="table-info">비밀번호</th>
			<td class="input-group">
				<input type="password" name="pass1" class="form-control"
				required="required" style="max-width: 160px;" placeholder="비밀번호">&nbsp;&nbsp;&nbsp;
				<input type="password" name="pass2" class="form-control"
				required="required" style="max-width: 160px;" placeholder="비밀번호확인">
			</td>
		</tr>
		
		<tr>
			<th width="100" class="table-info">이름</th>
			<td class="input-group">
				<input type="text" name="name" class="form-control"
				maxlength="10" required="required" style="max-width: 150px;">&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		
		<tr>
			<th width="100" class="table-info">이메일</th>
			<td class="input-group">
				<input type="text" name="email1" id="email1" class="form-control"
				required="required" style="max-width: 80px;">&nbsp;&nbsp;&nbsp;
				<b>@</b>&nbsp;&nbsp;&nbsp; 
				<input type="text" name="email2" id="email2" class="form-control"
				required="required" style="max-width: 150px;">
				<select id="selemail" class="form-control">
					<option value="-">직접 입력</option>
					<option value="naver.com">네이버</option>
					<option value="gmail.com">구글</option>
					<option value="hanmail.net">다음</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td align="center" colspan="2">
				<button type="submit" class="btn btn-outline-info"
				style="width: 100px;">저장하기</button>
				<button type="reset" class="btn btn-outline-danger"
				style="width: 100px;">초기화</button>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>