package com.happyhouse.repository;

import org.apache.ibatis.annotations.Mapper;

import com.happyhouse.domain.User;

@Mapper
public interface UserRepository {
	User login(User user);
}
