<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
 body *{
 	font-family: "Oribit";
 }
</style>
<script type="text/javascript">
  function check() {
	  var len=$("input[name='food']:checked").length;
	  
	  if(len<2){
		  alert("주문 메뉴는 최소 2개 이상 선택해 주세요");
		  return false;
	  }
}
</script>
</head>
<body>
<div style="margin: 100px 100px; width: 800px;">

<!-- onsubmit이벤트는 action이 호출되기 전에 발생
리턴값을 false로 받으면 action이 호출되지 않는다 -->
	<form action="addAction.jsp" method="post" onsubmit="return check()">
	  <table class="table table-bordered">
	    <tr>
	      <th width="100" style="background-color: beige;">예약자명</th>
	      <td>
	        <input type="text" name="name" class="form-control"
	        autofocus="autofocus" required="required" style="width: 200px;"
	        placeholder="예약자명 입력">
	      </td>
	    </tr>
	    
	    <tr>
	      <th width="100" style="background-color: beige;">성별</th>
	      <td>
			<label>
			  <input type="radio" name="gender" value="f">
			  <img src="../image/booking/female.png" width="50">
			</label>
			&nbsp;
			<label>
			  <input type="radio" name="gender" value="m">
			  <img src="../image/booking/male.png" width="50">
			</label>	      
	      </td>
	    </tr>
	    
	    <tr>
		  <th width="100" style="background-color: beige;">예약시간</th>
		  <td>
		    <input type="datetime-local" name="local" class="form-control"
		    style="width: 200px;" required="required">
		  </td>
	    </tr>
	    
	    <tr>
	      <th width="100" style="background-color: beige;">인원수</th>
	      <td>
	        <input type="number" name="inwon" min="2" max="6"
	        class="form-control" style="width: 80px">
	      </td>
	    </tr>
	    
	    <tr>
	      <th width="100" style="background-color: beige;">메뉴선택</th>
	      <td>
	        <label>
	          <input type="checkbox" name="food" value="갈비찜.jpg,23000">갈비찜<br>
	          <img src="../image/booking/갈비찜.jpg" width="80" height="80"
	          border="1">
	        </label>
	         <label>
	          <input type="checkbox" name="food" value="꼬치구이.jpg,18000">꼬치구이<br>
	          <img src="../image/booking/꼬치구이.jpg" width="80" height="80"
	          border="1">
	        </label>
	         <label>
	          <input type="checkbox" name="food" value="순두부라면.jpg,23000">순두부라면<br>
	          <img src="../image/booking/순두부라면.jpg" width="80" height="80"
	          border="1">
	        </label>
	         <label>
	          <input type="checkbox" name="food" value="오므라이스.jpg,23000">오므라이스<br>
	          <img src="../image/booking/오므라이스.jpg" width="80" height="80"
	          border="1">
	        </label>
	         <label>
	          <input type="checkbox" name="food" value="콘치즈.jpg,23000">콘치즈<br>
	          <img src="../image/booking/콘치즈.jpg" width="80" height="80"
	          border="1">
	        </label>
	      </td>
	    </tr>
	     
	    <tr>
	     <th width="100" style="background-color: beige;">메세지</th>
	      <td>
	        <textarea style="width: 500px; height: 80px"
	        class="form-control" required="required" name="message"></textarea>
	      </td>
	    </tr>
	    
	    <tr>
	      <td colspan="2" align="center">
	        <button type="submit" class="btn btn-outline-danger"
	        style="width: 120px;">예약하기</button>
	        <button type="reset" class="btn btn-outline-danger"
	        style="width: 120px;">다시하기</button>
	        <button type="button" class="btn btn-outline-danger"
	        style="width: 120px;" onclick="location.href='bookingList.jsp'">예약목록</button>
	      </td>
	    </tr>
	  </table>
	</form>
</div>
</body>
</html>