<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>아이디: <%=userid %></h2>
	<h2>비밀번호: <%=password %></h2>
</body>
</html>