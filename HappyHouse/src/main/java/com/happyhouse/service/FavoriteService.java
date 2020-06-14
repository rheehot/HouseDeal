package com.happyhouse.service;

import java.util.List;

import com.happyhouse.domain.FavoriteLocation;
import com.happyhouse.domain.Gugun;
import com.happyhouse.domain.Sido;

public interface FavoriteService {
	List<Sido> sidoList();
	
	List<Gugun> gugunList(String code);
	
	FavoriteLocation getFavoriteLocation(int userNo);
	
	int setFavoriteLocation(String code, int userNo);
	
	int modify(String code, int userNo);
}
