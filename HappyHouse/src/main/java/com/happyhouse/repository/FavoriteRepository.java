package com.happyhouse.repository;

import java.util.List;

import com.happyhouse.domain.FavoriteLocation;
import com.happyhouse.domain.Gugun;
import com.happyhouse.domain.Sido;

public interface FavoriteRepository {
	List<Sido> selectSido();
	
	List<Gugun> selectGugun(String code);
	
	FavoriteLocation selectFavoriteLocation(int userNo);
	
	int insert(String code, int userNo);
	
	int update(String code, int userNo);
}
