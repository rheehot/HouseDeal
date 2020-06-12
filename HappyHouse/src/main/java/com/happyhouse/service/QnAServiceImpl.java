package com.happyhouse.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happyhouse.domain.QnA;
import com.happyhouse.repository.QnARepository;

@Service
public class QnAServiceImpl implements QnAService{

	@Autowired
	private QnARepository repository;
	
	@Override
	public List<QnA> findAll(String key, String word) throws Exception {
		HashMap<String, String> map = new HashMap<>();
		map.put("key", "all");
		map.put("word", word);
		List<QnA> list =repository.selectAll(map);
		System.out.println(list.size());
		return list;
	}

	@Override
	public QnA findByQnANo(int no) throws Exception {
		return repository.select(no);
	}

	@Override
	public int regitry(QnA qna) throws Exception {
		return repository.insert(qna);
	}

	@Override
	public int modify(QnA qun) throws Exception {
		return repository.update(qun);
	}

	@Override
	public int remove(int no) throws Exception {
		return repository.delete(no);
	}
	
}
