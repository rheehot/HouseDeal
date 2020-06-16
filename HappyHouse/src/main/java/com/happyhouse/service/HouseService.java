package com.happyhouse.service;

import java.util.List;

import com.happyhouse.domain.HouseDeal;
import com.happyhouse.domain.HouseDetail;
import com.happyhouse.domain.HouseInfo;
import com.happyhouse.domain.HousePageBean;
import com.happyhouse.util.PageNavigation;

public interface HouseService {
	List<HouseDeal> searchAll(HousePageBean bean);

	PageNavigation makePageNavigation(int currentPage, int sizePerPage, HousePageBean bean);

	HouseInfo detail(int no);

	List<HouseDetail> findHouseDetailByNo(int no);

	List<HouseDetail> findHouseDetailByDongAptName(HouseDetail houseDetail);
	
	List<HouseDetail> findHouseDetailByDong(HouseDetail houseDetail);
}