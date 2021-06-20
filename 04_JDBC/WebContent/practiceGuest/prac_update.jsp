<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달받은 파라미터값 확인(추출)
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	int pay = Integer.parseInt(request.getParameter("pay"));

	//DB데이터 수정
	//JDBC 프로그램을 위한 변수 선언
	final String Driver = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "test";
	final String PASSWORD = "test";

	Connection conn = null;
	PreparedStatement pstmt = null;
			
	//사용할 SQL 쿼리 작성
	int result = 0;
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver");
			
		//2. DB연결  - Connection 객체 생성 <-DriverManager
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "test", "test");
			
		//3. Statement문 실행(SQL문 실행)
		//3-1. Connection 객체로부터 PreparedStatement 객체 생성	
		String sql =  " UPDATE GUEST"
          +"    SET NAME = ?, PAY = ?, NALJA = SYSDATE "
          + " WHERE SABUN = ?";
		pstmt = conn.prepareStatement(sql);
			
		//3-2. 바인드 변수에 값 설정
	        pstmt.setString(1, name);
			pstmt.setInt(2, pay);
      		pstmt.setInt(3, sabun);
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
		//3)페이지 이동처리 - 수정 정상완료 시 전체목록페이지로.
		if(result > 0) { //정상입력처리 됨
		response.sendRedirect("prac_list.jsp");
		//response.sendRedirect("detail.jsp?idx="+sabun);
		}
	//수정 실패시 상세페이지로 또는 전체목록페이지로
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보 수정 실패</title>
</head>
<body>
	<h1>사원정보 수정 실패</h1>
	<p>수정처리를 정상적으로 처리하지 못했습니다.<br>
	[상세페이지로 이동]을 선택하여 다시 작업하세요. <br>
	또는 담당자에게 연락하세요.(8282)</p>
	<a href="prac_detail.jsp?idx=<%=sabun %>">상세페이지로 이동</a>
	<a href="prac_list.jsp">전체목록 보기</a>
</body>
</html>