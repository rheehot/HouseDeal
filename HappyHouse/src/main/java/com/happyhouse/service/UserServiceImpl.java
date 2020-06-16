package com.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.domain.User;
import com.happyhouse.repository.UserRepository;
import com.happyhouse.util.PageNavigation;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository repo;

	@Override
	public User login(User user) throws Exception {
		if (user == null && user.getId() == "" && user.getId() == null)
			throw new Exception();
		return repo.select(user);
	}

	@Override
	public int signUp(User user) throws Exception {
		if (user == null)
			throw new Exception();
		return repo.insert(user);
	}

	@Override
	public User detail(String id) throws Exception {
		if (id == null)
			throw new Exception();
		return repo.selectUser(id);
	}

	@Override
	public int Modify(User user) throws Exception {
		if (user == null)
			throw new Exception();
		return repo.update(user);
	}

	@Override
	public List<User> list(int currentPage, int sizePerPage, String key, String word){
		return repo.userList(currentPage * 10, sizePerPage, key, word);
	}

	@Override
	public List<User> search(String type, String value) {
		return repo.searchList(type, value);
	}

	@Override
	public Integer remove(int[] list){
		return repo.delete(list);
	}

	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word) {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; // 페이지 개수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = repo.getTotalCount(key, word); // 총 게시글 수
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / naviSize + 1; // 총 페이지 수 naviSize(sizePerPage)
		pageNavigation.setTotalPageCount(totalPageCount); // 300 / 10 ==> 30
		boolean startRange = currentPage <= naviSize; // true : 이전 x false : 이전 o
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage; // true : 다음 x false : 다음 o
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
}
