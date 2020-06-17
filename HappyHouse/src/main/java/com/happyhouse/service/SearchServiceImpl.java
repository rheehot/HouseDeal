package com.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.domain.Search;
import com.happyhouse.domain.SearchHit;
import com.happyhouse.repository.SearchRepository;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SearchRepository repository;
	
	@Override
	public int getCountBySearch(Search search) throws Exception {
		return repository.selectCount(search);
	}

	@Override
	public int registrySearch(Search search) throws Exception {
		return repository.insertSearch(search);
	}

	@Override
	public int addHitCount(Search search) throws Exception {
		return repository.updateSearch(search);
	}

	@Override
	public List<Search> findAllSearchs() throws Exception {
		return repository.selectAllSearch();
	}

	@Override
	public int getUserHitCount(SearchHit searchHit) throws Exception {
		return repository.selectUserHitCount(searchHit);
	}

	@Override
	public int registryUserHit(SearchHit searchHit) throws Exception {
		return repository.insertUserHit(searchHit);
	}
	
}
