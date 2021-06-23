<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax XML members</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$("#getDataBtn").click(getXmlMembers);
	});
	function getXmlMembers(){
		alert(">> getXmlMembers() 실행");
		$.ajax({
			url: "getXmlMembers",
			type: "get",
			//data: "name="+name+"&age"+age;  //방법1
			//data: $("#inputForm").serialize(); //방법2.form 데이터 파라미터 전달 
			dataType: "xml", //응답받을 데이터 타입 지정
			success: function(data){
				alert("data: "+data);
				var output = "";
				$(data).find("member").each(function(){
					output += "<tr>";
					output += "<td>"+$(this).find("id").text() +"</td>";
					output += "<td>"+$(this).find("name").text() +"</td>";
					output += "<td>"+$(this).find("phone").text() +"</td>";
					output += "<td>"+$(this).find("email").text() +"</td>";
					output += "</tr>";				
				});
				$("#tbody").html(output);
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert("Ajax 처리 실패: \n"+
						"jqXHR.readyState"+jqXHR.readyState+"\n"+
						"textStatus"+textStatus+"\n"+
						"errorThrown"+errorThrown)
			}
		});
	}

</script>
</head>
<body>
	<h1>Ajax XML 데이터 요청처리</h1>
	<button id="getDataBtn">Ajax - XML 데이터 가져오기</button>
	<hr>
	<table border>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<tr>
				<td>hong</td>
				<td>홍길동</td>
				<td>010-1111-1111</td>
				<td>hong@test.com</td>
			</tr>
		</tbody>
	</table>
</body>
</html>