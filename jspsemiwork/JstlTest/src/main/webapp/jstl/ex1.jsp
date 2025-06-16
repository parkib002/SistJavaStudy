<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Nanum+Brush+Script&family=Orbit&family=Song+Myung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<body>
<h2>Jstl 태그 연습_#1</h2>

<!-- 변수 선언 -->
<c:set var="su1" value="7"/>
<c:set var="su2" value="4"/>
<c:set var="city" value="대전"></c:set>

<!-- if -->
<c:if test="${su1>su2 }">
	<h4>숫자1이 더 크다!!</h4>
</c:if>

<!-- 문자비교 -->
<c:if test="${city=='서울' }">
	<h4>서울은 한강이 아름답다</h4>
</c:if>

<c:if test="${city=='대전' }">
	<h4>대전은 성심당!!</h4>
</c:if>

<b>2개의 변수 출력: su1:${su1 },su2:${su2 }</b>

<table class="table table-bordered" style="width: 400px;">
	<tr>
		<th width="250">\${su1+su2 }</th>
		<td>
		${su1+su2 }
		</td>
	</tr>
	
	<tr>
		<th width="250">\${su1-su2 }</th>
		<td>
		${su1-su2 }
		</td>
	</tr>
	
	<tr>
		<th width="250">\${su1*su2 }</th>
		<td>
		${su1*su2 }
		</td>
	</tr>
	
	<tr>
		<th width="250">\${su1/su2 }</th>
		<td>
		${su1/su2 }
		</td>
	</tr>
	
	<tr>
		<th width="250">\${su1 div su2 }</th>
		<td>
		${su1 div su2 }
		</td>
	</tr>
	
	<tr>
		<th width="250">\${su1 % su2 }</th>
		<td>
		${su1 % su2 }
		</td>
	</tr>
	
	<tr>
		<th width="250">\${su1 mod su2 }</th>
		<td>
		${su1 mod su2 }
		</td>
	</tr>
	
	<tr>
		<th>su1 1증가</th>
		<td>
		<!-- 증감식이 없다 -->
		 증가전 su1: <c:out value="${su1 }"/><br>
		 <c:set var="su1" value="${su1+1 }"/>
		 증가후 su1: ${su1 }
		</td>
	</tr>
</table>

<h2>Jstl 태그 연습_#2</h2>
<c:set var="name" value="홍길동"/>
<c:set var="age" value="42"/>
<c:set var="today" value="<%=new Date() %>"/>
<c:set var="num" value="0.123456"/>
<c:set var="money" value="2500000"/>

<!-- 변수출력 c:out 생략 가능-->
<h4>이름: <c:out value="${name }"/></h4>
<h4>나이: ${age }</h4>
<h4>오늘날짜: ${today }</h4>

<!-- 날짜 형식 변경 -->
<h4><fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm"/></h4>
<h4><fmt:formatDate value="${today }" pattern="yyyy-MM-dd a hh:mm"/></h4>
<h4><fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm EEE"/></h4>
<h4><fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm EEEE"/></h4>

<!-- 숫자 여러 양식으로 출력 -->

<!-- 100%로 출력, 소수점 이하 3자리 출력 -->
<fmt:formatNumber value="${num }" type="percent" maxFractionDigits="3"/>
</body>

<!-- 화폐단위출력,3자리마다 컴마 -->
<fmt:formatNumber value="${money }" type="Currency"/><br>
<fmt:formatNumber value="${money }" type="number"/>
</html>