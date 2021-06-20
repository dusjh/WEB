<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--request, session scope에 설정된 값 추출해서 화면에 표시 --%>
<%
	//request, session에 저장된 데이터 사용
	String req_name = (String)request.getAttribute("req_name");
	String req_age = (String)request.getAttribute("req_age");
	
	//세션의 id 및 상태 확인
	System.out.println(">> session id: "+session.getId()+", new: "+session.isNew());
	
	String attr_name =(String) session.getAttribute("attr_name");  //object객체이기 때문에 String으로 형변환
	String attr_age =(String) session.getAttribute("attr_age");
	if(attr_age == null) {
		attr_age = "세션에 속성 없음(attr_age)";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션(Session) 범위</title>
<script>
	function sessionSet() {
		location.href = "ex01_sessionSet.jsp?name=kim&age=30";   //파라미터 값 전달(?name=hong&age=27)		
	}
	function sessionRemove() {
		location.href = "ex01_sessionRemove.jsp";
	}
	function sessionInvalidate() {
		location.href = "ex01_sessionInvalidate.jsp";
	}

</script>
</head>
<body>
	<h1>세션(session) 테스트</h1>
	<input type="button" value="세션 속성에 저장" onclick="sessionSet()">
	<input type="button" value="세션 속성 삭제" onclick="sessionRemove()">
	<input type="button" value="세션 초기화(무효화)" onclick="sessionInvalidate()">
	<hr>
	
	<h1>세션스코프(session)</h1>
	<h2>이름(session): <%=attr_name %></h2>
	<h2>나이(session): <%=attr_age %></h2>
	<hr><hr>
	
	<h1>request 스코프(request)</h1>
	<h2>이름(session): <%=req_name %></h2>
	<h2>나이(session): <%=req_age %></h2>
	<hr><hr>
</body>
</html>