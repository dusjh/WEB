package com.bc.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.ajax.vo.MemberVO;

@WebServlet("/getXmlMembers")
public class GetXmlMembersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		//응답할 회원정보 목록 만들기
		List<MemberVO> list = new ArrayList<>();
		list.add(new MemberVO("hong", "홍길동", "010-1111-1111", "hong@test.com"));
		list.add(new MemberVO("kim", "김유신", "010-2222-2222", "kim@test.com"));
		
		//XML 데이터 만들어서 응답처리
		PrintWriter out = response.getWriter();
		StringBuilder result = new StringBuilder();
		result.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		result.append("<members>");
		
		for(MemberVO vo: list) {
			result.append("<member>");
				result.append("<id>"+vo.getId()+"</id>");
				result.append("<name>"+vo.getName()+"</name>");
				result.append("<phone>"+vo.getPhone()+"</phone>");
				result.append("<email>"+vo.getEmail()+"</email>");
			result.append("</member>");
		}	
		result.append("</members>");
		System.out.println("result: \n"+result.toString());
		
		out.print(result.toString());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
