package com.bc.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.bc.bbs.mybatis.DBService;
import com.bc.bbs.vo.BBSVO;
import com.bc.bbs.vo.CommVO;

public class DAO {
	//게시글(BBS_T)의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("BBS.totalCount");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기
	//방법1
	public static List<BBSVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BBSVO> list = ss.selectList("list", map);
		ss.close();
		return list;
	}
	//방법2
	public static List<BBSVO> getList(int begin, int end) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		List<BBSVO> list = ss.selectList("list", map);
		ss.close();
		return list;
	}
	
	//조회수 1 증가 처리(실습)
	public static void updateHit(int b_idx) {
		
	}
	
	//게시글 데이터 1개 조회
	public static BBSVO selectOne(String b_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		BBSVO vo = ss.selectOne("BBS.one", b_idx);
		ss.close();
		return vo;
	}
	
	//============== 댓글 관련 =============
	 public static List<CommVO> getCommList(String b_idx){
	      SqlSession ss = DBService.getFactory().openSession();
	      List<CommVO> list = ss.selectList("BBS.commList", b_idx);
	      ss.close();
	      return list;
	   }
}


