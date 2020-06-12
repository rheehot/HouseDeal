package com.happyhouse.repository;

import java.util.List;
import java.util.Map;

import com.happyhouse.domain.QnA;


public interface QnARepository {
	List<QnA> selectAll(Map<String, String> map) throws Exception;
	
	QnA select(int no) throws Exception;
	
	List<QnA> selectReply(int no) throws Exception;
	
	int insert(QnA qna) throws Exception;
	
	int update(QnA qna) throws Exception;
	
	int delete(int no) throws Exception;
}
