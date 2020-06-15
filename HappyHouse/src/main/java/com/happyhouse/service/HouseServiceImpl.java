package com.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.domain.HouseDeal;
import com.happyhouse.domain.HousePageBean;
import com.happyhouse.repository.HouseRepository;

@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	HouseRepository repo;
	
	@Override
	public List<HouseDeal> searchAll(HousePageBean bean) {
		return repo.selectAll(bean);
	}

}
