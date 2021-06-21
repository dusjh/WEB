<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 VO 데이터를 화면에 표시하고 수정데이터 작성 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<style>
	#container {
		width: 512px; margin: auto;
		/*border: 1px solid blue;*/
	}
	#container h2 { text-align: center;}
	#container p { text-align: center;}
	 #container table{
      width: 500px;
      padding: 0 5px;
      border: 1px solid black;
      border-collapse: collapse;
   	}
	th, td {
		border: 1px solid black;
	}
	#container table th {
		background-color: #ff99cc;
	}
	#container .center {text-align: center;}
</style>
<script>
	function save_go(frm) {
		//비밀번호 확인 후 DB데이터 수정요청 처리
		let pwd1 = frm.pwd.value; 		//입력값
		let pwd2 = "${guestbookVO.pwd}" //DB에 저장되어 있는 비밀번호 -> 이렇게 쓰면 소스보기에 노출되니까 지양할 것
		
		if(pwd1 != pwd2) {
			alert ("암호 불일치, 암호를 확인하세요.")
			frm.pwd.value= "";
			frm.pwd.focus();
			return false;  //서버전송x
		}
		//DB 수정작업 요청
		frm.action = "update_ok.jsp";
		frm.submit();
	}
</script>
</head>
<body>
	<div id="container">
		<h2>방명록: 입력화면</h2>
		<hr>
		<p><a href="list.jsp">[목록으로 이동]</a></p>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="name" value="${guestbookVO.name}"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" value="${guestbookVO.subject}"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" value="${guestbookVO.email}"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" name="pwd"></td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="content" rows="5" cols="60" value="${guestbookVO.content}"></textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="수정" onclick="save_go(this.form)">
							<input type="reset" value="다시 작성">
							<input type="hidden" name="idx" value="${guestbookVO.idx}">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>