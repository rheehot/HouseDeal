package com.happyhouse.service;

import java.util.List;

import com.happyhouse.domain.Board;
import com.happyhouse.util.PageNavigation;

public interface BoardService {
	
	public int regist(Board dto);

	public List<Board> selectAll(int curPage, int sitePerPate, String key, String word);

	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word);
	
	public Board select(int id);

	public int update(Board dto);

	public int delete(String[] ids);
}
