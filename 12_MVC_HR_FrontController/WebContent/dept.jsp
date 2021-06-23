<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서검색</title>
</head>
<body>
	<h2>부서검색(dept.jsp)</h2>
	<form action="controller?type=deptList" method="post">
		이름 : <input type="text" name="deptno">
		<input type="submit" value="부서코드로 검색">
	</form>
</body>
</html>





