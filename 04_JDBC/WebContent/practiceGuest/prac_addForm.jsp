<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--db연결하고 프로그램 사용해서 사번 구하기( --%>
<%
	final String Driver = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "test";
	final String PASSWORD = "test";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//sql작성
	String sql = "SELECT NVL(MAX(SABUN),0) + 1111 AS SABUN FROM GUEST";
	int sabun = 0;
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver");
		
		//2. DB연결  - Connection 객체 생성 <-DriverManager
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "test", "test");
		//3. Statement문 실행(SQL문 실행)
		//3-1. Connection 객체로부터 PreparedStatement 객체 생성	
		pstmt = conn.prepareStatement(sql);
		
		//4. 쿼리 실행
		rs = pstmt.executeQuery();
		while (rs.next()) { 
			sabun = rs.getInt("SABUN");
		} 
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		//5. 클로징 처리에 의한 자원 반납
		try {
			if(rs != null)rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addForm: 사원등록</title>
</head>
<body>
	<h1>사원등록</h1>
	<form action="prac_insert.jsp">
	<table>
		<tr>
			<th>사번</th>
			<td><input type="text" name="sabun" value=<%=sabun %> readonly></td>	
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" name="name"></td>	
		</tr>
		<tr>
			<th>급여</th>
			<td><input type="text" name="pay"></td>	
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="사원등록">
				<input type="reset" value="초기화">
			</td>
		</tr>	
	</table>
	</form>
</body>
</html>