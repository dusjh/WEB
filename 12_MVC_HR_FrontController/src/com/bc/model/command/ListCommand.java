package com.bc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

public class ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. DB연결하고 데이터 가져오기
		List<EmployeeVO> list = DAO.getList();
		
		//2. 응답페이지(list.jsp)에 전달(request 객체에 속성값으로 전달)
		request.setAttribute("list", list);
		
		//3. 응답페이지 전환(list.jsp 에게)
		//request.getRequestDispatcher("list.jsp").forward(request, response);
		
		// 응답페이지 정보만 리턴
		return "list.jsp";
	}


}
