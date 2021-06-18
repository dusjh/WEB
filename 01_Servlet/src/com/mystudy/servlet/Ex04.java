package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Ex04 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청에 대한 처리 - 리턴타입은 String, 파라미터명은 대소문자 구분o
		//request 객체(인스턴스)로부터 파라미터 값 추출
		//1.getParameter(파라미터명): 하나의 파라미터 값 추출
		//2.request.getParameterValues(파라미터명): 배열형태 값 추출(체크박스 등)
		//3.getParameterMap(): 파라미터 값을 Map형태로 추출
		//4.getParameterNames(): 파라미터명 확인시 사용
		
		//전달받은 회원가입 정보를 추출해서 회원가입 정보를 작성 후 응답처리
		//요청정보 추출
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		//서버 콘솔에 값 출력
		System.out.println("--------------------------");
		System.out.println("name: "+name);
		System.out.println("id: "+id);
		System.out.println("pwd: "+pwd);
		System.out.println("email: "+email);
		
		//취미(hobby) 값 추출
		request.getParameter("hobby");
		String[] hobby = request.getParameterValues("hobby");   //배열형태
		
		//서버 콘솔에 값 출력
		System.out.println("--------------------------");
		System.out.println("name: "+name);
		System.out.println("id: "+id);
		System.out.println("pwd: "+pwd);
		System.out.println("email: "+email);
		
		//System.out.println("hobby=: "+hobby);  //주소값 나옴
		System.out.println("hobby 배열값: "+Arrays.toString(hobby));
		//System.out.println("hobby 첫번째: "+hobby[0]);   //null 처리 필요
		
		//========================
		//클라이언트(브라우저)쪽으로 응답 처리
		response.setContentType("text/html;charset=utf-8");  //문자셋 지정(한글처리)
		PrintWriter out = response.getWriter();
		out.println("<h2>회원가입 정보</h2>");
		out.println("<ul>");
		out.println("<li>이름: "+name+"</li>");
		out.println("<li>아이디: "+id+"</li>");
		out.println("<li>암호: "+pwd+"</li>");
		out.println("<li>이메일: "+email+"</li>");	
		
		//선택된 취미 정보
		out.println("<li>취미: ");
		if(hobby == null) {
			out.write("선택사항 없음");
		} else {
			for(String str: hobby) {
				out.write(str+"&nbsp;&nbsp;");   //&nbsp; -> 스페이스
			}
		}
 		out.println("</li>");
		out.println("</ul>");

	}
}
