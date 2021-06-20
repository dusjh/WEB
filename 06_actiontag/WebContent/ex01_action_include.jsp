<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리를 위한 설정
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - include</title>
</head>
<body>
<%--JSP 액션태그: JSP 페이지의 흐름 제어
	사용 형태: <jsp:액션명령></jsp:액션명령>
			<jsp:액션명령 />
--%>
	<h1>디렉티브/액션태그 - include</h1>
	<hr>
	<h2>디렉티브(지시어) - include 복사/붙여넣기 방식</h2>
	<%-- 복붙한 이후에 서블릿파일로 변경되고 컴파일됨--%>
	<%@include file="ex01_includee1.jspf" %>
	<hr>
	<%@include file="ex01_includee2_param.jsp" %>
	<hr><hr>
	
	<%--================================================ --%>
	<h2>액션태그 - jsp:include 실행결과를 사용</h2>
	<%-- 파일을 호출해서 실행결과를 임포트--%>
	<jsp:include page="ex01_includee1.jspf"></jsp:include>
	<hr>
	<jsp:include page="ex01_includee.jsp"></jsp:include>
	<hr><hr>
	
	<h2>액션태그 - jsp:include(파라미터 전달)</h2>
	<jsp:include page="ex01_includee2_param.jsp">
		<jsp:param value="김유신" name="name"/>
		<jsp:param value="30" name="age"/>
	</jsp:include>

</body>
</html>