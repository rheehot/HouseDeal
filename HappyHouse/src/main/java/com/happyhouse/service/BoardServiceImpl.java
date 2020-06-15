package com.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.domain.Board;
import com.happyhouse.repository.BoardRepository;
import com.happyhouse.util.PageNavigation;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardRepository repo;
	
	@Override
	public int regist(Board dto) {
		return repo.insert(dto);
	}

	@Override
	public List<Board> selectAll(int curPage, int sitePerPate, String key, String word) {
		RowBounds bounds = new RowBounds(curPage*10, sitePerPate);
		return repo.selectAll(bounds, key, word);
	}
	
	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word) {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; // 페이지 개수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = repo.getTotalCount(key, word); // 총 게시글 수
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / naviSize + 1; // 총 페이지 수 naviSize(sizePerPage)
		pageNavigation.setTotalPageCount(totalPageCount); // 300 / 10 ==> 30
		boolean startRange = currentPage <= naviSize; // true : 이전 x false : 이전 o
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage; // true : 다음 x false : 다음 o
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

	@Override
	public Board select(int id){
		return repo.select(id);
	}

	@Override
	public int update(Board dto) {
		return repo.update(dto);
	}

	@Override
	public int delete(String[] ids) {
		return repo.delete(ids);
	}

}
