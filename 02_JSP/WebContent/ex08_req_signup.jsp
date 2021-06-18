<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>  //자바스크립트 오류 확인은 브라우저 콘솔로 확인
	function send_go() {
		//alert("send_go() 시작");
		//alert(document.frm.name.value);
		if(document.frm.name.value.trim() == "") { //trim(): 좌우 공백 삭제 메서드
			alert("이름을 입력하세요");
			document.frm.name.value = "";
			document.frm.name.focus();  //커서가 다시 해당 입력칸으로 돌아감(?)
			return false;
		}   
		let vForm = document.frm;
		if(vForm.id.value.trim().length < 1) {
			alert("아이디를 입력하세요");
			vFrom.id.value="";
			vForm.id.focus();
			return false;
		}
		if (vForm.pwd.value.trim().length < 1) { //암호값 입력 여부 확인
			alert("암호를 입력하세요");
			vFrom.pwd.value="";
			vForm.pwd.focus();
			return false;
		}
		if (vForm.pwd2.value.trim().length < 1) {  //암호확인값 입력 여부 확인
			alert("확인암호를 입력하세요");
			vFrom.pwd2.value="";
			vForm.pwd2.focus();
			return false;
		}
		//암호 일치 여부
		if(vForm.pwd.value != vForm.pwd2.value) {
			alert("암호가 다릅니다.\n확인 후 다시 입력하세요");
			vForm.pwd.value = "";   //암호 다시 입력할 수 있게 초기화 해줌
			vForm.pwd2.value = "";
			vForm.pwd2.focus();
			return false;
		}
		alert("회원가입 요청합니다");
		vForm.action = "ex08_resp.jsp";
		vForm.submit();
	}
</script>
</head>
<body>
	<h1>회원가입</h1>
	<form name="frm">
		<fieldset>
		<legend>회원가입</legend>
		<p>이름: <input type="text" name="name" value="홍길동"></p>
		<p>아이디: <input type="text" name="id"></p>
		<p>암호: <input type="password" name="pwd"></p>
		<p>암호 확인: <input type="password" name="pwd2"></p>
		<p>이메일: <input type="text" name="email"></p>
		<p>취미: 
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="게임">게임
			<input type="checkbox" name="hobby" value="영화">영화
			<input type="checkbox" name="hobby" value="독서">독서
		</p>
		<input type="button" value="회원가입" onclick="send_go()">
		<input type="reset" value="초기화">
		</fieldset>	
	</form>
</body>
</html>