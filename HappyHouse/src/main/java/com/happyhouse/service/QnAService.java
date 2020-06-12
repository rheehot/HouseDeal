package com.happyhouse.service;

import java.util.List;

import com.happyhouse.domain.QnA;

public interface QnAService {
	List<QnA> findAll(String key, String word) throws Exception;
	
	QnA findByQnANo(int no) throws Exception;
	
	int regitry(QnA qna) throws Exception;
	
	int modify(QnA qun) throws Exception;
	
	int remove(int no) throws Exception;
}
