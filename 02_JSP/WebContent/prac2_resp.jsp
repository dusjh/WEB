<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//1.파라미터값 추출
String coffee = request.getParameter("coffee");
int count = Integer.parseInt(request.getParameter("count")); //수량
int money = Integer.parseInt(request.getParameter("money")); //입금액

String menu = "주문 안함";
int dan = 0; //단가

//2. 계산처리(구입 금액, 잔액)
if(coffee.equals("1")) {
	menu = "아메리카노";
	dan = 3000;
} else if(coffee.equals("2")) {
	menu = "라떼";
	dan = 4000;
} else if(coffee.equals("3")) {
	menu = "밀크티";
	dan = 4500;
} else if (coffee.equals("4")) {
	menu = "수박주스";
	dan = 5000;
}
System.out.println("menu: "+menu+", "+"가격: "+dan);

int total = dan * count;
int change = (money - total);


//3. 계산결과 화면에 출력
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결과(응답 페이지)</title>
</head>
<body>
	<h2>주문 계산</h2>
	<ul>
		<li>커피 종류: <%=coffee %> </li>
		<li>단가: <%=dan %></li>
		<li>수량: <%=count %></li>
		<li>구입 금액: <%=total %></li>
		<hr>
		<li>입금액: <%=money %></li>
		<li>잔액: <%=change %></li>
	</ul>
</body>
</html>