package com.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.domain.Shop;
import com.happyhouse.repository.ShopRepository;
import com.happyhouse.util.PageNavigation;

@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	ShopRepository repo;

	@Override
	public List<Shop> selectAll(int curPage, int sitePerPate, String key, String word, String code) {
		RowBounds bounds = new RowBounds(curPage*10, sitePerPate);
		return repo.selectAll(bounds, key, word, code);
	}

	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word, String code) {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; // 페이지 개수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = repo.getTotalCount(key, word, code); // 총 게시글 수
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

}
