package com.happyhouse.service;

import com.happyhouse.domain.User;

public interface UserService {
	User login(User user);
	
	int signUp(User user);
}
