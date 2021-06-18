<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청(forward)</title>
</head>
<body>
	<h2>요청페이지-포워드 사용하여 응답</h2>
	<form>
	아이디: <input type="text" name="id"><br>
	비밀번호: <input type="password" name="pwd"><br>
	<hr>
	<input type="submit" value="포워딩(forward)" onclick="send_forward(this.form)">
	</form>
<script>
	function send_forward(frm) {
		frm.action ="prac_resp_forward.jsp";
		frm.submit();
	}
</script>
</body>
</html>