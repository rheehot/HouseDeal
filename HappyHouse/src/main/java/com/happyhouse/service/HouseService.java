package com.happyhouse.service;

import java.util.List;

import com.happyhouse.domain.HouseDeal;
import com.happyhouse.domain.HousePageBean;

public interface HouseService {
	List<HouseDeal> searchAll(HousePageBean bean);
}
