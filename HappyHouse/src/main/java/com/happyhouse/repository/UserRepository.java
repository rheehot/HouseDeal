package com.happyhouse.repository;

import java.util.List;

import com.happyhouse.domain.User;

public interface UserRepository {
	User select(User user);
	
	int insert(User user);
	
	int update(User user);
	
	User selectUser(String id);
	
	List<User> userList(int currentPage, int sizePerPage, String key, String word);
	
	List<User> searchList(String type, String value);
	
	Integer delete(int[] array);

	int getTotalCount(String key, String word);
}
