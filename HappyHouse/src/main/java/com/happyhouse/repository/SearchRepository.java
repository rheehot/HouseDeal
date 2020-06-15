package com.happyhouse.repository;

import java.util.List;

import com.happyhouse.domain.Search;

public interface SearchRepository {
	int selectCount(Search search) throws Exception;

	int insertSearch(Search search) throws Exception;

	int updateSearch(Search search) throws Exception;

	List<Search> selectAllSearch() throws Exception;

}
