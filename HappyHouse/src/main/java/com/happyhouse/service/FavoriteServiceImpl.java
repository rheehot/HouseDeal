package com.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.domain.FavoriteLocation;
import com.happyhouse.domain.Gugun;
import com.happyhouse.domain.Sido;
import com.happyhouse.repository.FavoriteRepository;

@Service
public class FavoriteServiceImpl implements FavoriteService {

	@Autowired
	FavoriteRepository repo;
	
	@Override
	public List<Sido> sidoList() {
		return repo.selectSido();
	}

	@Override
	public List<Gugun> gugunList(String code) {
		return repo.selectGugun(code);
	}

	@Override
	public FavoriteLocation getFavoriteLocation(int userNo) {
		return repo.selectFavoriteLocation(userNo);
	}

	@Override
	public int setFavoriteLocation(String code, int userNo) {
		return repo.insert(code, userNo);
	}

	@Override
	public int modify(String code, int userNo) {
		return repo.update(code, userNo);
	}

}
