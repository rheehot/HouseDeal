package com.happyhouse.service;

import java.util.List;

import com.happyhouse.domain.Search;

public interface SearchService {
	int getCountBySearch(Search search) throws Exception;

	int registrySearch(Search search) throws Exception;

	int addHitCount(Search search) throws Exception;

	List<Search> findAllSearchs() throws Exception;
}
