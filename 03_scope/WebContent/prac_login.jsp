<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<%
	//로그인 성공여부
	String login_chk =(String) session.getAttribute("login_chk");
	System.out.println(">>login_chk: "+login_chk);
	if(login_chk == null ) {
%>
	<h2>로그인</h2>
	<form action="prac_loginProc.jsp">
	<p>아이디<input type="text" name="id"></p>
	<p>비밀번호<input type="password" name="pwd"></p>
	<hr>
	<input type="submit" value="로그인">
	</form>
<%
	} else {  //loginPass 속성값이 있으면
		if("ok".equals(login_chk)) {
			//로그인 성공처리
			String id = (String)session.getAttribute("id");
			out.print("<h1>로그인 성공!!!"+id+"님 환영합니다.");
		} else { //로그인 실패처리
			out.print("<h1>땡! 다시 시도해주세요.");
			session.invalidate(); //무효처리
			response.sendRedirect("ex02_loginMessage.jsp");
		}
	}
%>
</body>
</html>