package com.happyhouse.domain;

import java.util.Date;

public class QnA {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaImage;
	private int qnaUserNo;
	private Date qnaDatetime;
	private String replyContent;
	private Date replyDatetime;
	private int replyNo;
	private int replyQnaUserNo;
	private int replyQnaNo;
	private int replyCnt;
	private String name;
	private String id;

	public QnA() {

	}

	public QnA(int qnaNo, String qnaTitle, String qnaContent, String qnaImage, int qnaUserNo, Date qnaDatetime,
			String replyContent, Date replyDatetime, int replyNo, int replyQnaUserNo, int replyCnt, String name,
			String id, int replyQnaNo) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaImage = qnaImage;
		this.qnaUserNo = qnaUserNo;
		this.qnaDatetime = qnaDatetime;
		this.replyContent = replyContent;
		this.replyDatetime = replyDatetime;
		this.replyNo = replyNo;
		this.replyQnaUserNo = replyQnaUserNo;
		this.replyCnt = replyCnt;
		this.name = name;
		this.id = id;
		this.replyCnt = replyCnt;
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

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyDatetime() {
		return replyDatetime;
	}

	public void setReplyDatetime(Date replyDatetime) {
		this.replyDatetime = replyDatetime;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getReplyQnaUserNo() {
		return replyQnaUserNo;
	}

	public void setReplyQnaUserNo(int replyQnaUserNo) {
		this.replyQnaUserNo = replyQnaUserNo;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getReplyQnaNo() {
		return replyQnaNo;
	}

	public void setReplyQnaNo(int replyQnaNo) {
		this.replyQnaNo = replyQnaNo;
	}

	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaImage="
				+ qnaImage + ", qnaUserNo=" + qnaUserNo + ", qnaDatetime=" + qnaDatetime + ", replyContent="
				+ replyContent + ", replyDatetime=" + replyDatetime + ", replyNo=" + replyNo + ", replyQnaUserNo="
				+ replyQnaUserNo + ", replyQnaNo=" + replyQnaNo + ", replyCnt=" + replyCnt + ", name=" + name + ", id="
				+ id + "]";
	}

}
