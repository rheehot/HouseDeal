package com.happyhouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.domain.User;
import com.happyhouse.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository repo;

	@Override
	public User login(User user) {
		return repo.select(user);
	}

	@Override
	public int signUp(User user) {
		return repo.insert(user);
	}
}
