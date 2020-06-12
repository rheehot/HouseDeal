package com.happyhouse.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.happyhouse.domain.QnA;

@Mapper
public interface QnARepository {
	List<QnA> selectAll(Map<String, String> map) throws Exception;
	
	QnA select(int no) throws Exception;
	
	int insert(QnA qna) throws Exception;
	
	int update(QnA qun) throws Exception;
	
	int delete(int no) throws Exception;
}
