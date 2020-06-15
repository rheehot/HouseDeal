package com.happyhouse.repository;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.happyhouse.domain.Board;

public interface BoardRepository {
	public int insert(Board dto);

	public Board select(int id);

	public int update(Board dto);

	public int delete(String[] ids);

	public List<Board> selectAll(RowBounds bounds, String key, String word);

	public int getTotalCount(String key, String word);

}
