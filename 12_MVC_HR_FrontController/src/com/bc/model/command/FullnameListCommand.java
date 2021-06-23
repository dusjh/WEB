package com.bc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

public class FullnameListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파라미터 값 확인(추출)
		String fullname = request.getParameter("fullname");
		
		//2. DB에서 데이터 가져오기
		List<EmployeeVO> list = DAO.fullnameList(fullname);
		
		//3. DB 데이터 request scope에 저장
		request.setAttribute("list", list);
		
		//4. fullnameList.jsp 페이지로 위임(전가) 처리
		//request.getRequestDispatcher("fullnameList.jsp").forward(request, response);
		
		//응답할 페이지 정보
		return "fullnameList.jsp";
	}

}
