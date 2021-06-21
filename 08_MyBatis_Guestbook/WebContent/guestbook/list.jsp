<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--DB에서 전체 데이터 조회 후 화면에 출력 --%>
<%
	//DB에서 전체데이터 조회 후 화면에 출력
	//openSession(), openSession(false): auto-commit(오토커밋) 해제 상태(트랜잭션 처리 필요)
	//		insert, update, delete 작업 후 명시적으로 commit 처리 필요
	//openSession(true): 자동 커밋 상태로 세션객체 생성
	
	//1. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();

	//2. 매퍼의 SQL 실행
	//SqlSession selectList(매퍼id) : select 결과를 List형태로 받기
	//SqlSession selectOne(매퍼id) : select 결과가 하나(1,0)인 경우
	List<GuestbookVO> list = ss.selectList("guestbook.all");
	ss.close();
	System.out.println("> list : " + list);
	
	//3. 화면출력(EL, JSTL 사용 - scope 등록)
	pageContext.setAttribute("attr_list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
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
</head>
<body>
<div id="container">
	<h2>방명록</h2>
	<hr>
	<p><a href="write.jsp">[방명록 쓰기]</a></p>
	<table>
		<thead>
			<tr>
				<th>글 번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
		<%--  
			<tr>
				<td>1</td>
				<td>홍일동</td>
				<td>제목1</td>
				<td>2021-05-31</td>
			</tr>
		--%>
		
		<%-- SQL 실행 후 결과 List 사용 tr태그 만들기(EL, JSTL 사용) --%>
		<c:if test="${not empty attr_list }">	
		<c:forEach var="vo" items="${attr_list }">
			<tr>
				<td class="center">${vo.getIdx() }</td>
				<td class="center">${vo.name }</td>
				<td>
					<a href="onelist.jsp?idx=${vo.idx}">${vo.subject }</a>
				</td>
				<td>${vo.regdate }</td>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty attr_list}">
			<tr>
				<td colspan="4">검색된 데이터가 없습니다</td>
			</tr>
		</c:if>
		</tbody>
	</table>
</div>
</body>
</html>