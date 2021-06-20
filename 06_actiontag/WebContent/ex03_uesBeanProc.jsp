<%@page import="com.mystudy.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 값 표시</title>
</head>
<body>
	<h1>[ex03_uesBeanProc.jsp]</h1>
<%
	//한글처리를 위한 설정
	request.setCharacterEncoding("utf-8");
	
	//파라미터 값 추출
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
	<h2>일반적인 파라미터 처리 방식</h2>
	<h2>이름: <%=name %>(local variable)</h2>
	<h2>나이: <%=age %>(local variable)</h2>
	<hr>
	
	<h2>속성(attribute)을 이용(request scope)</h2>
<%
	request.setAttribute("attr_name", name + "(attr)");
	request.setAttribute("attr_age", age + "attr");
%>
	<h2>이름: <%=request.getAttribute("attr_name") %></h2>
	<h2>나이: <%=request.getAttribute("attr_age") %></h2>
	<hr>
	
	<%--=========== useBean 액션태그 =============== --%>
<%-- 
	//아래의 useBean 태그가 구현된 방식
	PersonVO person = (PersonVO) request.getAttribute("person");
	if(person == null) {
		person = new PersonVO();
		request.setAttribute("person", person);
	}
--%>
	<%--자바 빈(Bean)을 이용해서 파라미터 값 저장 사용 --%>
	<jsp:useBean id="person" class="com.mystudy.PersonVO" scope="request"/>
	<jsp:setProperty property="*" name="person"/>
<%-- 
	<jsp:setProperty property="name" name="person"/>
	<jsp:setProperty property="age" name="person"/>
--%>
<%
	System.out.println("person: "+person);
	System.out.println("request person: "+request.getAttribute("person"));
%>
	<h2>빈(Bean) 저장값 표시</h2>
	<h2>이름(표현식): <%=person.getName() %></h2>
	<h2>나이(표현식): <%=person.getAge() %></h2>
	<hr>

	<h2>데이터 읽기: getProperty 액션태그 (잘 안쓰임)</h2>
	<h2>이름(액션태그): <jsp:getProperty property="name" name="person"/> </h2>
	<h2>나이(액션태그): <jsp:getProperty property="age" name="person"/></h2>
	<hr>
	
	<h2>EL(expression language) getter 이용(request scope 값 사용)</h2>
	<h2>이름(EL): ${person.name } </h2>
	<h2>나이(EL): ${person.age }</h2>
	<p>---------</p>
	<h2>속성명 가지고 접근</h2>
	<h2>이름(EL): ${person.getName() } </h2>
	<h2>나이(EL): ${person.getAge() }</h2>
	<hr>
</body>
</html>