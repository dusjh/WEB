package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

@WebServlet("/fullnameList")
public class FullnameListController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//1.파라미터값 확인(추출)
		String fullname = req.getParameter("fullname");
		
		//2.DB에서 데이터 가져오기
		List<EmployeeVO> list = DAO.fullnameList(fullname);
		
		//3.DB 데이터 request scope에 저장
		req.setAttribute("list", list);
		
		//4.FullnameList.jsp 페이지로 위임(전가)처리
		req.getRequestDispatcher("fullnameList.jsp").forward(req, resp);
	}
}
