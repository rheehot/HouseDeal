package com.happyhouse.domain;

public class Search {
	private int id;
	private String dong;
	private String aptName;
	private int hitCnt;

	public Search() {

	}

	public Search(int id, String dong, String aptName, int hitCnt) {
		this.id = id;
		this.dong = dong;
		this.aptName = aptName;
		this.hitCnt = hitCnt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public int getHitCnt() {
		return hitCnt;
	}

	public void setHitCnt(int hitCnt) {
		this.hitCnt = hitCnt;
	}

	@Override
	public String toString() {
		return "Search [id=" + id + ", dong=" + dong + ", aptName=" + aptName + ", hitCnt=" + hitCnt + "]";
	}

}
