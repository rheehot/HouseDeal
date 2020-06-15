package com.happyhouse.repository;

import java.util.List;

import com.happyhouse.domain.HouseDeal;
import com.happyhouse.domain.HousePageBean;


public interface HouseRepository {
	List<HouseDeal> selectAll(HousePageBean bean);
}
