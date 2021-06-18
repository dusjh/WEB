<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--전달받은 데이터(파라미터)를 화면에 출력 --%>   
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(응답)전달받은 값 출력</title>
</head>
<body>
	<h1>(응답)당신이 입력한 값 맞나요?</h1>
	<h2>아이디: <%=id %></h2>
	<h2>암호: <%=pw %></h2>
</body>
</html>