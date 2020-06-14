package com.happyhouse.domain;

public class Gugun {
	private String gugunCode;
	private String gugunName;

	public String getGugunCode() {
		return gugunCode;
	}

	public void setGugunCode(String gugunCode) {
		this.gugunCode = gugunCode;
	}

	public String getGugunName() {
		return gugunName;
	}

	public void setGugunName(String gugunName) {
		this.gugunName = gugunName;
	}

	@Override
	public String toString() {
		return "Gugun [gugunCode=" + gugunCode + ", gugunName=" + gugunName + "]";
	}

}
