<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Ajax</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function(){
       $("#getDataBtn").click(getIdName);
    });
    function getIdName(){
       alert("getIdName() 실행");
       /* jQuery.ajax({url, type, data, datatype...});
       $.ajax({url, type, data, datatype...});
       $.ajax(url, {type, data, datatype...});
       url : 서버 URL 요청
       type : get, post
       data : 서버쪽으로 전송되는 데이터
       datatype : 응답결과 데이터 형태(json, xml, text, ...)
       success : 성공한 경우 처리할 작업 지정
       error : 실패 한 경우
       */
       $.ajax("getIdName",{
          type : "get",
          data : "id=hong&pwd=1234",
          dataType : "json",
          success : function(result){
             alert("성공 -리턴값 :" + result);
             var output = "";
             output += "<h2>아이디 :" + result.id + "</h2>"
             output += "<h2>이름 :" + result.name + "</h2>"
             
             //HTML 출력 영역에 표시
             $("#dataDisp").html(output);
          },
          error : function(){
             alert("[예외발생] Ajax 처리 실패");
          }
       });
    }
    
</script>
</head>
<body>
    <h1>(jQuery)Ajax JSON 요청 처리</h1>
    <button id="getDataBtn">JSON 데이터 가져오기(id, name)</button>
    <hr><hr>
    <div id="dataDisp">가져온 데이터 출력될 영역</div>
    <hr><hr>
    
    
</body>
</html>