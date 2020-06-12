package com.happyhouse.repository;

import com.happyhouse.domain.User;

public interface UserRepository {
	User select(User user);
	
	int insert(User user);
}
