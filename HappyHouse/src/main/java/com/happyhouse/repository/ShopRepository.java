package com.happyhouse.repository;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.happyhouse.domain.Shop;

public interface ShopRepository {
	public List<Shop> selectAll(RowBounds bounds, String key, String word, String code);

	public int getTotalCount(String key, String word, String code);
}
