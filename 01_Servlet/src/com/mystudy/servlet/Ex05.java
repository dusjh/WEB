package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjuk")
public class Ex05 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//(실습)전달받은 데이터를 연산처리 후 결과를 응답
		//1.전달받은 파라미터 값 호출
		//2.연산처리(총점, 평균 구하기)
		//3.응답처리(브라우저 쪽으로)-h3~/table
		
		//요청정보 추출
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		int total = kor + eng + math;
		double avg = total*100/3/100.0;
		
		//콘솔에 출력해보기
		System.out.println("--------------------");
		System.out.println("name: "+name);
		System.out.println("kor: "+kor);
		System.out.println("eng: "+eng);
		System.out.println("math: "+math);
		System.out.println("total: "+total);
		System.out.println("avg: "+avg);
		
		//브라우저에 출력
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<h3>성적처리 결과</h3>");
		out.println("<table border>");
		out.println("<tr>");
		out.println("<th>이름</th>");
		out.println("<td>"+name+"</td>");		
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>국어</th>");
		out.println("<td>"+kor+"</td>");		
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>영어</th>");
		out.println("<td>"+eng+"</td>");		
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>수학</th>");
		out.println("<td>"+math+"</td>");		
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>총점</th>");
		out.println("<td>"+total+"</td>");		
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>평균</th>");
		out.println("<td>"+avg+"</td>");		
		out.println("</tr>");
		out.println("</table>");
	
	}
}
