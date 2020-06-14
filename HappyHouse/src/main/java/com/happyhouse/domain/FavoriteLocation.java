package com.happyhouse.domain;

public class FavoriteLocation {
	private String code;
	private int userNo;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "FavoriteLocaion [code=" + code + ", userNo=" + userNo + "]";
	}

}
