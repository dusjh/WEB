<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--주문한 내역에 따라 계산하고 결과를 표시 --%>
<% 	//(실습)

	//1.파라미터값 추출
	//?coffee=4&su=1&money=0 보면서 확인
	String coffee = request.getParameter("coffee");
	int su =  Integer.parseInt(request.getParameter("su"));
	int money =  Integer.parseInt(request.getParameter("money"));

	String menu ="메뉴 없음";
	int dan = 0;
	if("1".equals(coffee)) {
		menu="아메리카노";
		dan=3000;
	} else if ("2".equals(coffee)) {
		menu="카페모카";
		dan=3500;
	} else if ("3".equals(coffee)) {
		menu="에스프레소";
		dan=2500;
	} else if ("4".equals(coffee)) {
		menu="카페라떼";
		dan=4000;
	}
	System.out.println(menu+": "+ dan);
	//2. 계산처리(구입 금액, 잔액)
	int total = dan * su; //구입 총액
	int change = (money - total);  //잔액
	
	//3. 계산결과 화면에 출력
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결과</title>
</head>
<body>
	<h2>주문 계산 결과(응답)</h2>
<%--
	커피 종류: 아메리카노
	단가: 3000원
	수량: 3
	구입 금액: 9000원 (단가*수량)
	--------------------------
	입금액: 10000원
	잔액: 1000원 (입금액-구입 금액)
--%>
	<ul>
		<li>커피 종류: <%=coffee %></li>
		<li>단가: <%=dan %>원</li>
		<li>수량: <%=su %>개</li>
		<li>구입 금액: <%=total %>원</li>
		<hr>
		<li>입금액: <%=money %>원</li>
		<li>잔액: <%=change %>원</li>
	</ul>
	
</body>
</html>