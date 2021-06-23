<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax JSON</title>
</head>
<body>
   <h1>Ajax JSON 데이터 요청처리</h1>
   
<script>
   // JavaScript 에서 Ajax 를 사용할 때 XMLHttpRequest 객체 사용
   //1. XMLHttpRequest 객체 생성
   var request = new XMLHttpRequest();
   
   request.onreadystatechange = function(){
      if (request.readyState == 4 && request.status == 200){ //4: 응답완료 & 200: 정상실행
         //받은 데이터 확인
         alert("리턴값 : \n"+request.responseText);
      
         //JSON.parse() 사용 : 문자열 --> JS 객체화
         var json = JSON.parse(request.responseText);
         alert("JSON.parse() 처리 후 : "+json);
         console.log(json);
         
         //JSON 객체 데이터 추출
         var output = "";
         for(let i=0; i<json.length; i++){
        	 output += "<h2>";
        	 output += json[i].name + " : "+json[i]["price"];
        	 output += "</h2>";
         }
         document.body.innerHTML += output;
      }
   };
   
   //2. open("전송방식", "요청정보", "비동기여부")
   request.open("GET", "data.json", true);   
   
   //3. send() 실행
   request.send();
   
</script>   
</body>
</html>