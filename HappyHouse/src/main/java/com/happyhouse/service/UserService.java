package com.happyhouse.service;

import java.util.List;

import com.happyhouse.domain.User;
import com.happyhouse.util.PageNavigation;

public interface UserService {
	User login(User user) throws Exception;

	int signUp(User user) throws Exception;

	User detail(String id) throws Exception;

	int Modify(User user) throws Exception;

	List<User> list(int currentPage, int sizePerPage, String key, String word) ;

	List<User> search(String type, String value) ;

	Integer remove(int[] list) ;

	PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word);
}
