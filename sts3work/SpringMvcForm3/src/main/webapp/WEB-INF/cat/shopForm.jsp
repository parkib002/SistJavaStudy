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
<form action="process2" method="post">
  <table class="table table-bordered" style="width: 400px;">
    <tr>
      <th>상품명</th>
      <td><input type="text" name="sangpum"></td>
    </tr>
    <tr>
      <th>수량</th>
      <td><input type="text" name="su"></td>
    </tr>
    <tr>
      <th>가격</th>
      <td><input type="text" name="price"></td>
    </tr>
    <tr>
      <th>색상</th>
      <td><input type="color" name="color"></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <button type="submit">전송</button>
      </td>
    </tr>
  </table>
</form>
</body>
</html>