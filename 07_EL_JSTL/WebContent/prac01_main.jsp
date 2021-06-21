<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 처리</title>
</head>
<body>
	<h1>데이터처리(EL사용)</h1>
	<form>
		<fieldset>
		<legend>회원가입</legend>
		<p>아이디: <input type="text" name="id"></p>
		<p>암호: <input type="password" name="pwd"></p>
		<p>이름: <input type="text" name="name"></p>
		<p>성별: <input type="radio" name="gender" value="F">여
				<input type="radio" name="gender" value="M">남
		</p>
		<p>취미: <input type="checkbox" name="hobby" value="sports">운동
				<input type="checkbox" name="hobby" value="book">독서
				<input type="checkbox" name="hobby" value="movie">영화
				<input type="checkbox" name="hobby" value="music">음악
				<input type="checkbox" name="hobby" value="game">게임
		</p>
		<input type="button" value="전달1(자바빈)" onclick="send_go1(this.form)">
		<input type="button" value="전달2(EL param)" onclick="send_go2(this.form)">
		<input type="reset" value="초기화">
		</fieldset>
	</form>
<script>
	function send_go1(frm) {
		frm.action="prac01_result01_bean.jsp";
		frm.submit();
	}
	function send_go2(frm) {
		frm.action="prac01_result02_param.jsp";
		frm.submit();
	}
</script>
</body>
</html>