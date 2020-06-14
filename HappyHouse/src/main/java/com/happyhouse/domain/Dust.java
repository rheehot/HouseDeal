package com.happyhouse.domain;

public class Dust {
	private String dataTime;
	private String cityName;
	private int pm10Value;
	private int pm25Value;

	public Dust() {

	}

	public Dust(String dataTime, String cityName, int pm10Value, int pm25Value) {
		this.dataTime = dataTime;
		this.cityName = cityName;
		this.pm10Value = pm10Value;
		this.pm25Value = pm25Value;
	}

	public String getDataTime() {
		return dataTime;
	}

	public void setDataTime(String dataTime) {
		this.dataTime = dataTime;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public int getPm10Value() {
		return pm10Value;
	}

	public void setPm10Value(int pm10Value) {
		this.pm10Value = pm10Value;
	}

	public int getPm25Value() {
		return pm25Value;
	}

	public void setPm25Value(int pm25Value) {
		this.pm25Value = pm25Value;
	}

	@Override
	public String toString() {
		return "Dust [dataTime=" + dataTime + ", cityName=" + cityName + ", pm10Value=" + pm10Value + ", pm25Value="
				+ pm25Value + "]";
	}

}
