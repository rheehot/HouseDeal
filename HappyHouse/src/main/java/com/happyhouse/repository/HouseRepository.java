package com.happyhouse.repository;

import java.util.List;

import com.happyhouse.domain.HouseDeal;
import com.happyhouse.domain.HouseDetail;
import com.happyhouse.domain.HouseInfo;
import com.happyhouse.domain.HousePageBean;


public interface HouseRepository {
	List<HouseDeal> selectAll(HousePageBean bean);
	
	Integer getTotalCount(HousePageBean bean);
	
	HouseInfo select(int no);
	
	List<HouseDetail> selectHouseDetailByNo(int no);
	
	List<HouseDetail> selectHouseDetailByDongAptName(HouseDetail houseDetail);
}
