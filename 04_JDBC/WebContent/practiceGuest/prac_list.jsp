<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--jdbc 프로그램으로 db데이터 가져와서 화면 출력 --%>
<%
final String Driver = "oracle.jdbc.OracleDriver";
final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
final String USER = "test";
final String PASSWORD = "test";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

//sql 쿼리 작성
String sql = "SELECT ROWNUM AS RN, SABUN, NAME, NALJA, PAY FROM GUEST "
        + "ORDER BY SABUN";
int cnt = 0;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록 페이지</title>
</head>
<body>
	<h1>전체목록 페이지</h1>
	<table border>
		<thead>
			<tr>
				<th>번호(RN)</th>
				<th>사번</th>
				<th>성명</th>
				<th>날짜</th>
				<th>급여</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
<%
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
		while(rs.next()) { %>
		<%--읽어오기 RN, SABUN, NAME, NALJA, PAY--%>
			<tr>
				<td><%=rs.getInt("RN") %></td>
				<td><%=rs.getInt("SABUN") %></td>
				<td><%=rs.getString("NAME") %></td>
				<td><%=rs.getDate("NALJA") %></td>
				<td><%=rs.getInt("PAY") %></td>
				<td>
					<a href="prac_detail.jsp?idx=<%=rs.getInt("SABUN")%>">상세정보</a>
				</td>
			</tr>
<%		
		} //while 끝
		rs.close();
		//전체 데이터 건수 확인
		rs = pstmt.executeQuery("SELECT COUNT(*)CNT FROM GUEST");
		if (rs.next()) {
			cnt = rs.getInt("CNT");
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
		</tbody>
	</table>
	<%--사원등록하기 --%>
	<p>전체인원: <%=cnt %></p>
	<p><a href="prac_addForm.jsp">사원등록</a></p>
</body>
</html>