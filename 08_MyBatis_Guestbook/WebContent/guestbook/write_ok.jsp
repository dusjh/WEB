<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 데이터를 DB에 저장
	입력 성공시: 목록페이지로 (list.jsp) 이동
	입력 실패시(예외): 메시지 표시 후 이전 화면(입력페이지 write.jsp) 이동 
	html 작업 말고 db에 저장만 할거임
--%>
<%	
	//0.한글처리
	request.setCharacterEncoding("utf-8");
	
	//1.파라미터 값 추출해서 vo에 저장
%>
	<jsp:useBean id="guestbookVO" class="com.bc.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="guestbookVO" />
<%
	 System.out.println(">guestbookVO: "+guestbookVO);

	//2.SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession(true);  //자동커밋 상태(실행시 자동 커밋됨)
	
	//3.매퍼의 insert SQL실행
	try {		
	ss.insert("guestbook.insert", guestbookVO);
	//4.페이지 이동처리(정상)
%>
	<script>
		alert("정상입력되었습니다.\n목록페이지로 이동합니다.");
		location.href="list.jsp";
	</script>
<%
	} catch (Exception e) {
	//4.페이지 이동처리(예외발생)
	e.printStackTrace();
%>
	<script>
		alert("[예외발생] 입력 중 예외가 발생했습니다.\n담당자(8282)에게 연락하세요.\n이전페이지로 이동합니다.");
		history.back();
	</script>
<% 
	} finally {
	ss.close();		
	}
%>	

