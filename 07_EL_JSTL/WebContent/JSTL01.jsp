<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<%--JSTL(JSP Standard Tag Library) 
	0.라이브러리 구하기(인터넷)
		다운로드: https://tomcat.apache.org/download-taglibs.cgi
		다운로드: https://mvnrepository.com -> jstl 검색
	1.라이브러리 등록
		WebContent > WEB-INF > lib > jar 파일 등록
	2.JSTL디렉티브(지시어) taglib 추가
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
--%>

	<h2>JTSL 사용</h2>
	<h3>속성 설정: set</h3>
<%-- set: 속성 선언 태그 setAttribute 역할
		<c:set var="속성명" value="속성값" scope="범위" />
--%>
	<c:set var="test" value="Hello JSTL!! - pageScope"></c:set>
	<c:set var="test" value="Hello JSTL!! - request" scope="request"></c:set>
	<c:set var="test" value="Hello JSTL!! - session" scope="session"></c:set>
<%
	System.out.println("test: "+pageContext.getAttribute("test"));
%>
	<hr>
	
	<h3>속성값 출력: out</h3>
	<p><c:out value="Hello World" /></p>
	<p>page test(c:out): <c:out value="${pageScope.test }"/></p>
	<p>page test(EL): ${pageScope.test }</p>
	<p>session test(EL): ${sessionScope.test }</p>
	
	<p>application test(EL): ${applicationScope.test }</p>  <%-- 값 없음 --%>
	<p>application test(c:out): 
		<c:out value=" ${applicationScope.test }" default="데이터 없음" />
	</p>
	<hr>
	
	<h3>삭제: remove</h3>
	<c:remove var="test" scope="page"/>
	<p>EL: ${test }</p>  <%--지정안하면 request에서 읽어옴 --%>
	<p>EL(page): ${pageScope.test }</p>
	<p>EL(request): ${requestScope.test }</p>
	<p>EL(session): ${sessionScope.test }</p>
	<hr><hr>

	<%--=============== if문 ==================--%>
	<h2>JSTL: if 태그의 test 속성</h2>
	<%--JSTL에는 else 문이 제공되지 않음 --%>
	
	<c:if test="${20 > 10}">
		<p>20 &gt; 10 결과 true인 경우 실행문장</p>
	</c:if>
	<c:if test="${20 <= 10}">
		<p>20 le 10 결과 true인 경우 실행문장</p>
	</c:if>
	
	<h3>if 태그 2</h3>
	<c:set var="n1" value="10"/>
	<c:set var="n2" value="20"/>
	 <c:set var="n1" value="10" />
   <c:set var="n2" value="20" />
   <c:if test="${n1>n2 }" var="result">
      <p>if문 결과 n1이 n2보다 큽니다(result: ${result })</p>
   </c:if>
   <c:if test="${n1<=n2 }" var="result">
      <p>if문 결과 n1이 n2보다 작거나 같습니다(result: ${result })</p>
   </c:if>
	<hr>
	
	<%--=============== choose ~ when ~ otherwise ==================--%>
	<h1>if문 choose문 비교 확인</h1>
	<c:set var="jumsu" value="90" />
	<c:if test="${jumsu >= 90 }">
		<p>판정결과(${jumsu }): A</p>
	</c:if>
	<c:if test="${jumsu >= 80 }">
		<p>판정결과(${jumsu }): B</p>
	</c:if>
	<hr>  <%--if는 값이 동시에 나옴 --%>
	
	<h2>JSTL: choose ~ when ~ otherwise</h2>
	<c:set var="jumsu" value="60" />
	<c:choose>
		<c:when test="${jumsu >= 90 }">
			<p>판정결과(${jumsu }): A</p>
		</c:when>
		<c:when test="${jumsu >= 80 }">
			<p>판정결과(${jumsu }): B</p>
		</c:when>
		<c:when test="${jumsu >= 70 }">
			<p>판정결과(${jumsu }): C</p>
		</c:when>
		<c:otherwise>
			<p>판정결과 (${jumsu }): 노력필요</p>
		</c:otherwise>
	</c:choose>
	<hr><hr>
	
	<%--=============== JSTL 반복문 forEach ==================--%>
	<h2>JSTL 반복문: forEach</h2>
	<p>1~10까지의 숫자 출력</p>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }&nbsp;&nbsp;
	</c:forEach>
	<p>forEach문 종료 후 \${i }값 출력: -${i }-</p>
	<hr>
	
	<p>(실습)1~10까지의 숫자 중 짝수 출력(step="1") 사용</p>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i % 2 == 0}">
			${i }&nbsp;&nbsp;
		</c:if>		
	</c:forEach>
	<hr>
	
	<p>(실습)1~10까지의 숫자 중 짝수 출력(step="2") 사용</p>
	<c:forEach var="i" begin="2" end="10" step="2">
			${i }&nbsp;&nbsp;
	</c:forEach>
	<hr><hr>
	
	<%--=============== forEach문 집합객체 처리 ==================--%>
	<h2>forEach문 집합객체 처리</h2>
	<h3>스크립트릿으로 배열값 출력</h3>
<%
	String[] arr = {"홍길동1","홍길동2","홍길동3","홍길동4"};
	for(String name : arr) {
		out.print(name+", ");
	}
%>
	<h3>EL에서 스크립트릿 변수 사용(scope에 등록하여 사용)</h3>
	<c:set var="attr_names" value="<%=arr %>"/>
	
	<h3>forEach문으로 배열데이터 처리</h3>
	<c:forEach var="name" items="${attr_names }">  <%--"${attr_names} " 따옴표 안에 공백있으면 문자열로 인식됨--%> 
		${name },
	</c:forEach>
	
	<%--============= forTokens 태그 =========== --%>
	<h2>forTokens 태그: 문자열 자르기</h2>
	<c:set var="names" value="홍길동/김유신/일지매,임꺽정/둘리,고길동"/>
	<p>데이터: ${names }</p>
	<c:forTokens var="str" items="${names }" delims="/">
		<p>${str }</p>
	</c:forTokens>
	<hr>
	
	<h3>forTokens 구분자 /와 , 사용</h3>
	<c:forTokens var="str" items="${names }" delims="/,">
		<p>${str }</p>
	</c:forTokens>
</body>
</html>