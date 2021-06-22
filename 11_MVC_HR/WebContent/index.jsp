<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업선택</title>
<script>

	function all_search(frm) {
		//frm.action = "list.jsp";  //예전방식 JSP 직접 호출
		frm.action = "list";  //list 작업 요청
		frm.submit();
	}
	function fullname_search(frm) {
		frm.action="fullname";
		frm.submit();
	}
</script>
</head>
<body>
	<h1>작업선택</h1>
	<form>
		<input type="button" value="전체보기" onclick="all_search(this.form)">
		<input type="button" value="성명 검색(성, 이름포함)" onclick="fullname_search(this.form)">
	</form>
</body>
</html>