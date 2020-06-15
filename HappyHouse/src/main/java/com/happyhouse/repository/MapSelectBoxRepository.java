package com.happyhouse.repository;

import java.util.List;

import com.happyhouse.domain.Gugun;
import com.happyhouse.domain.HouseInfo;
import com.happyhouse.domain.Sido;

public interface MapSelectBoxRepository {
	public List<Sido> selectSido() throws Exception;

	public List<Gugun> selectGugun(String sido) throws Exception;

	public List<HouseInfo> selectDong(String gugun) throws Exception;

	public List<HouseInfo> selectApt(String dong) throws Exception;
}
