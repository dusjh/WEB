<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 데이터를 이용해서 DB에 입력처리. 정상입력시 list.jsp로, 예외 발생시 현재페이지 --%> 
<%
	//파라미터 값 추출
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	int pay = Integer.parseInt(request.getParameter("pay"));

	//DB입력
	final String Driver = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "test";
	final String PASSWORD = "test";

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	//사용할 sql 쿼리
	int result = 0;
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver");
			
		//2. DB연결  - Connection 객체 생성 <-DriverManager
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "test", "test");
			
		//3. Statement문 실행(SQL문 실행)
		//3-1. Connection 객체로부터 PreparedStatement 객체 생성	
		String sql = "INSERT INTO GUEST (SABUN, NAME, NALJA, PAY) VALUES (?, ?, SYSDATE, ?)";
		pstmt = conn.prepareStatement(sql);
			
		//3-2. 바인드 변수에 값 설정
	       pstmt.setInt(1, sabun);
	       pstmt.setString(2, name);
	       pstmt.setInt(3, pay);
		//4. 쿼리 실행
		result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		//5. 클로징 처리에 의한 자원 반납
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
				
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
	}
	//페이지 이동처리
	if(result > 0) {
		response.sendRedirect("prac_list.jsp");
	}
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<%--사원등록에 성공하면 list.jsp로, 예외가 발생하면 현재 페이지에서 이동할 수 있도록. --%>
	<h1>사원등록 실패</h1>
	<p>입력처리를 정상적으로 처리하지 못했습니다.<br>
	[입력페이지로 이동]을 선택하여 다시 작업하세요. <br>
	또는 담당자에게 연락하세요.(8282)</p>
	<a href="prac_addForm.jsp">입력페이지로 이동</a>
	<a href="prac_list.jsp">전체목록 보기</a>
</body>
</html>