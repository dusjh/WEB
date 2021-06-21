<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 파라미터 값을 자바빈(Bean) VO에 저장하고 사용 
	1. MemberVO 타입의 객체(memberVO)를 생성
	2. 전달받은 파라미터 값을 memberVO객체(인스턴스)에 저장
	3. memberVO 값을 화면 출력
--%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="vo" class="com.mystudy.MemberVO"></jsp:useBean>
	<jsp:setProperty property="*" name="vo"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean 사용</title>
</head>
<body>
	<h1>결과보기(Bean 사용)</h1>
	<ul>
		<li>ID: <%=vo.getId() %></li>
		<li>PWD: <%=vo.getPwd() %></li>
		<li>이름: <%=vo.getName() %></li>
		<li>성별: <%=vo.getGender() %></li>
		<li>취미: <%=vo.getHobby() %></li>
		<li>취미(배열값 처리):
<%
		for(String str: vo.getHobby()) {
			out.println(str + "");
		}
%>
	</li>
	</ul>
	
	<h1>Bean 데이터 EL 사용</h1>
	<p>EL은 null 출력 안함
	<ol>
		<li>ID: ${vo.getId() }</li>
		<li>PWD: ${vo.getPwd() }</li>
		<li>이름: ${vo.getName() }</li>
		<li>성별: ${vo.getGender() }</li>
		<li>취미: ${vo.getHobby() }</li>
		<li>취미(배열값 처리):
			${vo.hobby[0] }
			${vo.hobby[1] }
			${vo.hobby[2] }
			${vo.hobby[3] }		
		</li>
	</ol>
</body>
</html>