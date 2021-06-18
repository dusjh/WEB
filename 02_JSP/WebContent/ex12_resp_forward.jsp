<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답</title>
</head>
<body>
	<h2>[ex12_resp_forward.jsp]</h2>
	<h3>ID: <%=id %></h3>
	<h3>PW: <%=pwd %></h3>
<%
	//포워딩 처리(위임, 전가)
	RequestDispatcher rd = request.getRequestDispatcher("ex12_resp_forward-2.jsp");
	rd.forward(request, response);   //request, response: JSP에서 제공되는 내장 객체라서 따로 선언하지 않아도 됨
%>	
</body>
</html>