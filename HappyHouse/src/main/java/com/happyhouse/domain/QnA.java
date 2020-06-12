package com.happyhouse.domain;

import java.util.Date;

public class QnA {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaImage;
	private int qnaUserNo;
	private Date qnaDatetime;
	private int replyCnt;
	private String name;

	public QnA() {

	}

	public QnA(int qnaNo, String qnaTitle, String qnaContent, String qnaImage, int qnaUserNo, Date qnaDatetime,
			int replyCnt, String name) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaImage = qnaImage;
		this.qnaUserNo = qnaUserNo;
		this.qnaDatetime = qnaDatetime;
		this.replyCnt = replyCnt;
		this.name = name;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaImage() {
		return qnaImage;
	}

	public void setQnaImage(String qnaImage) {
		this.qnaImage = qnaImage;
	}

	public int getQnaUserNo() {
		return qnaUserNo;
	}

	public void setQnaUserNo(int qnaUserNo) {
		this.qnaUserNo = qnaUserNo;
	}

	public Date getQnaDatetime() {
		return qnaDatetime;
	}

	public void setQnaDatetime(Date qnaDatetime) {
		this.qnaDatetime = qnaDatetime;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaImage="
				+ qnaImage + ", qnaUserNo=" + qnaUserNo + ", qnaDatetime=" + qnaDatetime + ", replyCnt=" + replyCnt
				+ ", name=" + name + "]";
	}

}
