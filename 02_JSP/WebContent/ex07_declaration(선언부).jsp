<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부 메서드</title>
</head>
<body>
	<h2>덧셈</h2>
	<h3>100+200 =300</h3>
<%
	int a = 200;
	int b = 200;
	int sum = a + b;	//변수 사용 순서 중요
%>
	<h3>100+200 =<%=sum %></h3>
	<hr>
	<h2>선언부의 메서드 사용</h2>
	<h3>sum(a, b): <%=a +"+" +b +"=" %> <%=sum(a,b) %></h3>
	<%
		tot=sum(a, b);
	%>
	<h3>tot 출력: <%=tot %></h3>
<%!
	//선언부에 작성된 코드는 필드 영역에 작성되는 코드 -> 필드 선언은 메서드의 위치가 관계 없음
	
	private int sum(int a, int b) {
	return a+ b;
	}
%>
<%!
	int tot = 0;   //필드 변수 -> 위치 관계x
%>
</body>
</html>