<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 데이터(idx)로 DB데이터 조회 후 화면출력 --%>
<%
	//1. 전달받은 데이터 확인
	String idx = request.getParameter("idx");

	//2. DB관련작업 - SqlSession객체 생성
	SqlSession ss = DBService.getFactory().openSession(true);

	//3. DB관련작업 - 데이터 가져오기
	GuestbookVO vo = ss.selectOne("guestbook.one", idx);
	ss.close();
	System.out.println(">>vo: "+ vo);

	//EL, JSTL 사용+검색데이터 계속 사용을 위해 session에 등록
	session.setAttribute("guestbookVO", vo);
	System.out.println(">session guestbookVO: "+ session.getAttribute("guestbookVO"));
	
	//4. 화면에 표시하기: HTML태그에 데이터 표시
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 상세화면</title>
<style>
	#container {
		width: 512px; margin: auto;
		/*border: 1px solid blue;*/
	}
	#container h2 { text-align: center;}
	#container p { text-align: center;}
	 #container table{
      width: 500px;
      padding: 0 5px;
      border: 1px solid black;
      border-collapse: collapse;
   	}
	th, td {
		border: 1px solid black;
	}
	#container table th {
		background-color: #ff99cc;
	}
	#container .center {text-align: center;}
</style>
<script>
	function update_go(frm) {
		frm.action = "update.jsp";  //수정 페이지
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "delete.jsp";  //삭제를 위한 암호확인 페이지
		frm.submit();
	}
</script>
</head>
<body>
	<div id="container">
		<h2>방명록: 상세화면</h2>
		<hr>
		<p><a href="list.jsp">[목록으로 이동]</a></p>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<th>작성자</th>
						<td>${guestbookVO.name}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${guestbookVO.subject}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${guestbookVO.email}</td>
					</tr>
					<tr>
						<td colspan="2">${guestbookVO.content}</td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="수정" onclick="update_go(this.form)">
							<input type="button" value="삭제" onclick="delete_go(this.form)">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>