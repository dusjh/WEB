<%@page import="com.mystudy.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 데이터(파라미터)를 VO에 저장하고 화면출력
	1. MemberVO 타입의 객체(memberVO)를 생성
	2. 전달받은 파라미터 값을 memberVO객체(인스턴스)에 저장
	3. memberVO 값을 화면 출력
--%>
<%--
	MemberVO memberVO = new MemberVO();
	memberVO.setId(request.getParameter("id"));
	memberVO.setPwd(request.getParameter("pwd"));
	
	System.out.println("memberVO: "+memberVO);
	이렇게 하는 방법보다 아래 방법이 더 편리
--%>
	<jsp:useBean id="memberVO" class="com.mystudy.MemberVO"></jsp:useBean>
	<jsp:setProperty property="*" name="memberVO"></jsp:setProperty>
<%
	System.out.println("memberVO: "+memberVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 정보</title>
</head>
<body>
	<h1>회원가입 정보</h1>
	<ul>
		<li>ID: <%=memberVO.getId() %></li>
		<li>PWD: <%=memberVO.getPwd() %></li>
		<li>이름: <%=memberVO.getName() %></li>
		<li>성별: <%=memberVO.getGender() %></li>
		<li>취미: <%=memberVO.getHobby() %></li>  <%--(Hobby는 배열형태이기 때문에 주소값 나옴)--%>
		<li>취미(배열값 처리): 
<%
		for(String str: memberVO.getHobby()) {
			out.print(str+" ");
		}
%>
		</li>
	</ul>
</body>
</html>