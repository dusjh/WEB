<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%  //값 추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//2. 전달받은 아이디, 암호 사용 로그인 여부 판단 처리
	//DB연결 안했으니 id, pwd 미리 설정, 나머지 실패
	boolean loginSuccess = false;
	if("psj".equals(id) && "1216".equals(pwd)) {
		loginSuccess = true;
	}
	//3.session에 로그인 성공/실패 값 설정(상태값 설정)
	if(loginSuccess) {
		session.setAttribute("login_chk", "ok");
		session.setAttribute("id", id);
	} else {
		session.setAttribute("login_chk", "fail");
	}
	System.out.println(">> login_chk: "+session.getAttribute("login_chk"));
	
	//4.페이지 전환
	response.sendRedirect("prac_login.jsp");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>;