package com.biz.rbooks.repository;

import java.util.List;
import java.util.Map;

import com.biz.rbooks.domain.BookReadDTO;

public interface BookReadDao {

	public List<BookReadDTO> selectAll(Map map);

	public int findByRBBCode(BookReadDTO bookReadDTO);

	public BookReadDTO findByRBSeq(long rb_seq);

	public int update(BookReadDTO readbookDTO);

	public int delete(long rb_seq);

	public long allCount();

}
