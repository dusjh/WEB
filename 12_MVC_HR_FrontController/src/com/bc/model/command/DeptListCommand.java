package com.bc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

public class DeptListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달받은 파라미터 값으로 DB 데이터 조회 후 페이지 이동
		//1. 파라미터 값 확인(추출)
		String deptno = request.getParameter("deptno");
		
		//2. DB에서 데이터 가져오기
		List<EmployeeVO> list = DAO.deptList(deptno);
		
		//3. DB 데이터 request scope에 저장
		request.setAttribute("list", list);
		
		//응답할 페이지 정보
		return "deptList.jsp";
	}

}










