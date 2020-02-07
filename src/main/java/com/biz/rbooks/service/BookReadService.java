package com.biz.rbooks.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.rbooks.domain.BookReadDTO;
import com.biz.rbooks.repository.BookReadDao;

@Service
public class BookReadService {

	@Autowired
	SqlSession sqlSession;
	
	BookReadDao brDao;
	
	@Autowired
	public void getMapper() {
		brDao = sqlSession.getMapper(BookReadDao.class);
	}
	
	public List<BookReadDTO> SelectAll(long curPage) {
		Map map = new HashMap();
		map.put("curPage", curPage);
		return brDao.selectAll(map);
	}

	public int insert(BookReadDTO bookReadDTO) {
		return brDao.findByRBBCode(bookReadDTO);
	}

	public BookReadDTO findByRBSeq(long rb_seq) {
		
		return brDao.findByRBSeq(rb_seq);
	}

	public int update(BookReadDTO readbookDTO) {
		return brDao.update(readbookDTO);
	}

	public int delete(long rb_seq) {
		
		return brDao.delete(rb_seq);
	}


	

}
