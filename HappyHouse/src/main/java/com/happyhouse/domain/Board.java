package com.happyhouse.domain;

import java.util.Date;

public class Board {
	private int id;
	private String title;
	private String content;
	private Date datetime;

	public Board() {
	}

	public Board(int id, String title, String content, Date datetime) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.datetime = datetime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	@Override
	public String toString() {
		return "Board [id=" + id + ", title=" + title + ", content=" + content + ", datetime=" + datetime + "]";
	}

}
