package com.happyhouse.domain;

public class Sido {
	private String sidoCode;
	private String sidoName;

	public String getSidoCode() {
		return sidoCode;
	}

	public void setSidoCode(String sidoCode) {
		this.sidoCode = sidoCode;
	}

	public String getSidoName() {
		return sidoName;
	}

	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}

	@Override
	public String toString() {
		return "Sido [sidoCode=" + sidoCode + ", sidoName=" + sidoName + "]";
	}

}
