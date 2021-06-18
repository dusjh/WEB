<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청한 웹사이트로 이동처리
	String site = request.getParameter("site");
	System.out.println(">> ex11_resp_redirect.jsp site: "+site);
	
	switch(site) {
	case "naver": //네이버 웹페이지로 이동 처리(재요청)
		response.sendRedirect("http://naver.com");
		break;
	case "daum":
		response.sendRedirect("https://daum.net");
		break;
	case "google":
		response.sendRedirect("https://google.com");
		break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답</title>
</head>
<body>
	<h1>응답페이지</h1>
</body>
</html>