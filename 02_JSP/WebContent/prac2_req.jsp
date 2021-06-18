<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피주문</title>
</head>
<body>
<form action="prac2_resp.jsp">
	<h1>커피 주문(요청페이지request)</h1>
	<input type="radio" name="coffee" value="1" checked>아메리카노(3000원)<br>
	<input type="radio" name="coffee" value="2">라떼(4000원)<br>
	<input type="radio" name="coffee" value="3">밀크티(4500원)<br>
	<input type="radio" name="coffee" value="4">수박주스(5000원)<br>
	수량: <input type="number" name="count" size="3" value="1"><br>
	입금액: <input type="number" name="money" size="10" value="0"><br>
	<input type="submit" value="주문하기">
</form>
</body>
</html>