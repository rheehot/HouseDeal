package com.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.domain.HouseDeal;
import com.happyhouse.domain.HouseDetail;
import com.happyhouse.domain.HouseInfo;
import com.happyhouse.domain.HousePageBean;
import com.happyhouse.repository.HouseRepository;
import com.happyhouse.util.PageNavigation;

@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	HouseRepository repo;

	@Override
	public List<HouseDeal> searchAll(HousePageBean bean) {
		List<HouseDeal> list = repo.selectAll(bean);
		for (HouseDeal houseDeal : list) {
			System.out.println(houseDeal);
		}
		return list;
	}

	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, HousePageBean bean) {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; // 페이지 개수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = repo.getTotalCount(bean); // 총 게시글 수
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
	public HouseInfo detail(int no) {
		return repo.select(no);
	}

	@Override
	public List<HouseDetail> findHouseDetailByNo(int no) {
		return repo.selectHouseDetailByNo(no);
	}

	@Override
	public List<HouseDetail> findHouseDetailByDongAptName(HouseDetail houseDetail) {
		return repo.selectHouseDetailByDongAptName(houseDetail);
	}
	
	@Override
	public List<HouseDetail> findHouseDetailByDong(HouseDetail houseDetail) {
		return repo.selectHouseDetailByDong(houseDetail);
	}
}
