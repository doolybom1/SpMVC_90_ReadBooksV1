package com.biz.rbooks.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.rbooks.domain.BookDTO;
import com.biz.rbooks.repository.BookDao;

@Service
public class BookService {

	@Autowired
	SqlSession sqlSession;
	
	BookDao bDao;

	@Autowired
	public void getMapper() {
		bDao = sqlSession.getMapper(BookDao.class);
	}
	
	public List<BookDTO> bookSelectAll(long curPage) {
		Map map = new HashMap();
		map.put("curPage", curPage);
		List<BookDTO> rList = bDao.bookSelectAll(map);
		
		return rList;	
	}

	public int insert(BookDTO bookDTO) {
			
		return bDao.insert(bookDTO);
	}
	
	public int update(BookDTO bookDTO) {

		return bDao.update(bookDTO);
	}

	public BookDTO findByBCode(String b_code) {
		return bDao.findByBCode(b_code);
	}

	
	
	public List<BookDTO> getSearchList(String search) {
		return bDao.findByTitle(search);
	}

	public List<BookDTO> nameSelectAll(String b_name,long curPage) {
		List<BookDTO> rList = bDao.nameSelectAll(b_name,curPage);
		return rList;
	}

	public int delete(String b_code) {

		return bDao.delete(b_code);
	}

	public long allCount() {
		return bDao.allCount();
	}

	public List<BookDTO> findByTitle(String search) {
		
		return bDao.findByTitle(search);
	}



	
}
