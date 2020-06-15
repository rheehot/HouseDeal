package com.happyhouse.service;

import java.util.List;

import com.happyhouse.domain.Gugun;
import com.happyhouse.domain.HouseInfo;
import com.happyhouse.domain.Sido;

public interface MapSelectBoxService {
	public List<Sido> findSido() throws Exception;

	public List<Gugun> findGugun(String sido) throws Exception;

	public List<HouseInfo> findDong(String gugun) throws Exception;

	public List<HouseInfo> findApt(String dong) throws Exception;
}
