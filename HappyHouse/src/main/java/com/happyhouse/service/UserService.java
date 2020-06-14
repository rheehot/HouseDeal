package com.happyhouse.service;

import java.util.List;

import com.happyhouse.domain.User;
import com.happyhouse.util.PageNavigation;

public interface UserService {
	User login(User user);
	
	int signUp(User user);
	
	User detail(String id);
	
	int Modify(User user);
	
	List<User> list(int currentPage, int sizePerPage, String key, String word);
	
	List<User> search(String type, String value);
	
	Integer remove(int[] list);

	PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word);
}
