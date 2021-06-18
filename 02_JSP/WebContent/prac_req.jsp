<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청페이지</title>
</head>
<body>
	<h2>HTML form input 태그</h2>
    <form>
    <fieldset>
        <legend>로그인 정보</legend>
        아이디: <input type="text" name="userid" placeholder="아이디"><br>
        패스워드: <input type="password" name="password" placeholder="암호(영문숫자 5~20)">
    </fieldset>
    <fieldset>
        <legend>가입자 정보</legend>
        성명: <input type="text" name="name"><br>
        나이: <input type="number" name="age" value="20" min="1" max="150"><br>
        전화번호: <input type="tel" name="tel"><br>
        이메일: <input type="email" name="email"><br>
        생일: <input type="date" name="birth"><br>
        좋아하는 색: <input type="color" name="color"><br>
    </fieldset>
        <input type="submit" value="전송(요청)">
    </form>
</body>
</html>