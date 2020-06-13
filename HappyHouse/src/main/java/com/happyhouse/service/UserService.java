package com.happyhouse.service;

import java.util.List;

import com.happyhouse.domain.User;

public interface UserService {
	User login(User user);
	
	int signUp(User user);
	
	User detail(String id);
	
	int Modify(User user);
	
	List<User> list();
	
	List<User> search(String type, String value);
	
	int remove(int no);
}
