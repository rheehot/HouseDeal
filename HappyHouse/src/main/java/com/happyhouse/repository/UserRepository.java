package com.happyhouse.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.happyhouse.domain.User;

@Mapper
public interface UserRepository {
	User select(User user);
	
	int insert(User user);
	
	int update(User user);
	
	User selectUser(String id);
	
	List<User> userList();
	
	List<User> searchList(String type, String value);
	
	int delete(int no);
}
