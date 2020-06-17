package com.happyhouse.domain;

public class SearchHit {
	private int cnt;
	private int userNo;
	private String dong;
	private String aptName;
	private String inputDate;

	public SearchHit() {

	}

	public SearchHit(int cnt, int userNo, String dong, String aptName, String inputDate) {
		this.cnt = cnt;
		this.userNo = userNo;
		this.dong = dong;
		this.aptName = aptName;
		this.inputDate = inputDate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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

	public String getInputDate() {
		return inputDate;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	@Override
	public String toString() {
		return "SearchHit [cnt=" + cnt + ", userNo=" + userNo + ", dong=" + dong + ", aptName=" + aptName
				+ ", inputDate=" + inputDate + "]";
	}

}
