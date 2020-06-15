package com.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.domain.Gugun;
import com.happyhouse.domain.HouseInfo;
import com.happyhouse.domain.Sido;
import com.happyhouse.repository.MapSelectBoxRepository;

@Service
public class MapSelectBoxServiceImpl implements MapSelectBoxService{

	@Autowired
	private MapSelectBoxRepository repository;
	
	@Override
	public List<Sido> findSido() throws Exception {
		return repository.selectSido();
	}

	@Override
	public List<Gugun> findGugun(String sido) throws Exception {
		return repository.selectGugun(sido);
	}

	@Override
	public List<HouseInfo> findDong(String gugun) throws Exception {
		return repository.selectDong(gugun);
	}

	@Override
	public List<HouseInfo> findApt(String dong) throws Exception {
		return repository.selectApt(dong);
	}
	
}
