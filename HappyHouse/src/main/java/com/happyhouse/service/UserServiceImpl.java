package com.happyhouse.service;

import java.util.List;

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
	
	@Override
	public User detail(String id) {
		return repo.selectUser(id);
	}

	@Override
	public int Modify(User user) {
		return repo.update(user);
	}

	@Override
	public List<User> list() {
		return repo.userList();
	}

	@Override
	public List<User> search(String type, String value) {
		return repo.searchList(type, value);
	}

	@Override
	public int remove(int no) {
		return repo.delete(no);
	}
}
