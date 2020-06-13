package com.happyhouse.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.happyhouse.domain.QnA;

public interface QnAService {
	List<QnA> findAll(String key, String word) throws Exception;
	
	QnA findByQnANo(int no) throws Exception;
	
	List<QnA> selectReply(int no) throws Exception;
	
	int regitry(MultipartFile file, QnA qna) throws Exception;
	
	int modify(QnA qun) throws Exception;
	
	int remove(int no) throws Exception;
	
	int regitryReply(QnA qna) throws Exception;
	
	int modifyReply(QnA qna) throws Exception;
	
	int removeReply(int no) throws Exception;
	
	QnA getReplyCount(int no) throws Exception;
}
