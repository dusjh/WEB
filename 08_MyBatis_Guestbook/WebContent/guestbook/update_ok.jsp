<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 데이터 사용해서 DB데이터 수정처리
	수정 성공: list.jsp 또는 onelist.jsp(상세페이지)
	예외 발생: 예외 메시지 표시 후 이전 화면(수정페이지) 이동
--%>

<%	
	//0.한글처리
	request.setCharacterEncoding("utf-8");
	
	//1.파라미터 값 추출해서 vo에 저장
%>
	<jsp:useBean id="vo" class="com.bc.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="vo" />
<%
	System.out.println("> local vo: "+vo);
	System.out.println("> pageContext vo: "+pageContext.getAttributesScope("vo"));

	//2.SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession(true);  //자동커밋 상태(실행시 자동 커밋됨)
	
	//3.매퍼의 insert SQL실행
	try {		
	ss.update("guestbook.update", vo);
	
	//4.페이지 이동처리(정상처리시)
	//response.sendRedirect("list.jsp");  //화면 전환 - 전체목록
	response.sendRedirect("onelist.jsp?idx="+vo.getIdx());
	} catch (Exception e) {
	//4.페이지 이동처리(예외발생)
	e.printStackTrace();
%>
	<script>
		alert("[예외발생] 수정 중 예외가 발생했습니다.\n담당자(8282)에게 연락하세요.\n이전페이지로 이동합니다.");
		history.back();
	</script>
<% 
	} finally {
	ss.close();		
	}
%>	
