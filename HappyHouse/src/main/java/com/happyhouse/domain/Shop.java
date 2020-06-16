package com.happyhouse.domain;

public class Shop {
	private int no;
	private String name;
	private String mainName;
	private String midName;
	private String subName;
	private String code;
	private String gu;
	private String dong;
	private String streetAddress;
	private String lon;
	private String lat;

	public Shop() {
	}

	public Shop(int no, String name, String mainName, String midName, String subName, String code, String gu,
			String dong, String streetAddress, String lon, String lat) {
		super();
		this.no = no;
		this.name = name;
		this.mainName = mainName;
		this.midName = midName;
		this.subName = subName;
		this.code = code;
		this.gu = gu;
		this.dong = dong;
		this.streetAddress = streetAddress;
		this.lon = lon;
		this.lat = lat;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMainName() {
		return mainName;
	}

	public void setMainName(String mainName) {
		this.mainName = mainName;
	}

	public String getMidName() {
		return midName;
	}

	public void setMidName(String midName) {
		this.midName = midName;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	@Override
	public String toString() {
		return "Shop [no=" + no + ", name=" + name + ", mainName=" + mainName + ", midName=" + midName + ", subName="
				+ subName + ", code=" + code + ", gu=" + gu + ", dong=" + dong + ", streetAddress=" + streetAddress
				+ "]";
	}

}
