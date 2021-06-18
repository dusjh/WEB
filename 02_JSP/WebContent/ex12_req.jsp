<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청</title>
</head>
<body>
	<h2>요청(응답 forward)</h2>
	<form>
		아이디: <input type="text" name="id"><br>
		패스워드: <input type="password" name="pwd"><br>
		<input type="button" value="포워딩(forward)" onclick="send_forward(this.form)">
	</form>
<script>
	function send_forward(frm) {
		//포워딩 방식으로 응답처리
		frm.action = "ex12_resp_forward.jsp";
		frm.submit();
	}
</script>
</body>
</html>