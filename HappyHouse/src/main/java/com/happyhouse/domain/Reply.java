package com.happyhouse.domain;

public class Reply {
	private int replyNo;
	private int replyQnaNo;
	private int replyQnaUserNo;
	private String replyContent;
	private String replyDatetime;

	public Reply() {

	}

	public Reply(int replyNo, int replyQnaNo, int replyQnaUserNo, String replyContent, String replyDatetime) {
		this.replyNo = replyNo;
		this.replyQnaNo = replyQnaNo;
		this.replyQnaUserNo = replyQnaUserNo;
		this.replyContent = replyContent;
		this.replyDatetime = replyDatetime;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getReplyQnaNo() {
		return replyQnaNo;
	}

	public void setReplyQnaNo(int replyQnaNo) {
		this.replyQnaNo = replyQnaNo;
	}

	public int getReplyQnaUserNo() {
		return replyQnaUserNo;
	}

	public void setReplyQnaUserNo(int replyQnaUserNo) {
		this.replyQnaUserNo = replyQnaUserNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyDatetime() {
		return replyDatetime;
	}

	public void setReplyDatetime(String replyDatetime) {
		this.replyDatetime = replyDatetime;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyQnaNo=" + replyQnaNo + ", replyQnaUserNo=" + replyQnaUserNo
				+ ", replyContent=" + replyContent + ", replyDatetime=" + replyDatetime + "]";
	}

}
