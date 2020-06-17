package com.happyhouse.repository;

import java.util.List;

import com.happyhouse.domain.Search;
import com.happyhouse.domain.SearchHit;

public interface SearchRepository {
	int selectCount(Search search) throws Exception;

	int insertSearch(Search search) throws Exception;

	int updateSearch(Search search) throws Exception;

	List<Search> selectAllSearch() throws Exception;

	int selectUserHitCount(SearchHit searchHit) throws Exception;
	
	int insertUserHit(SearchHit searchHit) throws Exception;
}
