package com.happyhouse.service;

import java.util.List;

import com.happyhouse.domain.Shop;
import com.happyhouse.util.PageNavigation;

public interface ShopService {
	public List<Shop> selectAll(int curPage, int sitePerPate, String key, String word, String code);

	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word, String code);
}
