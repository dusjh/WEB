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
<title>Insert title here</title>
</head>
<body>
	<h2>포워딩 두번째파일에 위임/전가하기 [prac_resp_forward-2]</h2>
	<p>id: <%=id %></p>
	<p>pw: <%=pwd %></p>
<%
	//포워딩 처리
	RequestDispatcher rd = request.getRequestDispatcher("parc_resp_forward-2.jsp");
	rd.forward(request, response);
%>
</body>
</html>