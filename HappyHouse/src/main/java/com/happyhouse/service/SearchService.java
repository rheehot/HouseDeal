package com.happyhouse.service;

import java.util.List;

import com.happyhouse.domain.Search;
import com.happyhouse.domain.SearchHit;

public interface SearchService {
	int getCountBySearch(Search search) throws Exception;

	int registrySearch(Search search) throws Exception;

	int addHitCount(Search search) throws Exception;

	List<Search> findAllSearchs() throws Exception;
	
	int getUserHitCount(SearchHit searchHit) throws Exception;
	
	int registryUserHit(SearchHit searchHit) throws Exception;
}
