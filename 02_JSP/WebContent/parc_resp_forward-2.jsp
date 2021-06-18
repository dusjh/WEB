<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위임받아서 처리하는 파일[parc_resp_forward-2.jsp]</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
	<h2>parc_resp_forward-2.jsp</h2>
	<p>id: <%=id %></p>
	<p>pw: <%=pwd %></p>
</body>
</html>