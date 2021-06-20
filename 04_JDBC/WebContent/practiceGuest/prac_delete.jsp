<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달받은 파라미터값 확인
	int sabun = Integer.parseInt(request.getParameter("idx"));

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
	String sql = "DELETE FROM GUEST WHERE SABUN = ?";
	pstmt = conn.prepareStatement(sql);
	
	//3-2. 바인트 변수에 값 설정
	pstmt.setInt(1, sabun);
	
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
	//SQL문장 정상처리 되었으나 데이터가 없어서 삭제가 안될 때
	if(result == 0) {
%>	
	<script>
		alert("[삭제 실패] 삭제할 대상이 없습니다.\n목록페이지로 이동합니다.");
		location.href="prac_list.jsp";
	</script>	
<%	
	// 정상적으로 삭제된 경우
	} else if (result > 0) {
%>
	<script>
		alert("[삭제 완료] 삭제가 완료되었습니다.\n목록페이지로 이동합니다.");
	</script>
<%		
	response.sendRedirect("prac_list.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 예외처리</title>
</head>
<body>
	<h1>사원정보 삭제 실패</h1>
	<p>삭제 처리를 하지 못했습니다.<br>
	[상세페이지로 이동] 클릭해서 다시 작업하세요.
	담당자(8282)에게 연락하세요.</p>
	<a href="prac_detailForm.jsp?idx=<%=sabun %>">상세페이지로 이동</a>
	<a href="prac_list.jsp">전체목록 보기</a>
</body>
</html>