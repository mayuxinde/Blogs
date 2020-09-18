package com.project.domain;

import java.io.Serializable;

public class ReplyMessage implements Serializable {

	private Integer id;
	private Integer userId;
	private String userName;
	private Integer replyUserId;
	private String replyUserName;
	private String message;
	private String time;
	private String userImageUrl;
	private Integer replyMessageId;

	public ReplyMessage() {
	}

	public ReplyMessage(Integer id, Integer userId, String userName, Integer replyUserId, String replyUserName,
			String message, String time, String userImageUrl, Integer replyMessageId) {
		this.id = id;
		this.userId = userId;
		this.userName = userName;
		this.replyUserId = replyUserId;
		this.replyUserName = replyUserName;
		this.message = message;
		this.time = time;
		this.userImageUrl = userImageUrl;
		this.replyMessageId = replyMessageId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getReplyUserId() {
		return replyUserId;
	}

	public void setReplyUserId(Integer replyUserId) {
		this.replyUserId = replyUserId;
	}

	public String getReplyUserName() {
		return replyUserName;
	}

	public void setReplyUserName(String replyUserName) {
		this.replyUserName = replyUserName;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getUserImageUrl() {
		return userImageUrl;
	}

	public void setUserImageUrl(String userImageUrl) {
		this.userImageUrl = userImageUrl;
	}

	public Integer getReplyMessageId() {
		return replyMessageId;
	}

	public void setReplyMessageId(Integer replyMessageId) {
		this.replyMessageId = replyMessageId;
	}

	@Override
	public String toString() {
		return "ReplyMessage [id=" + id + ", userId=" + userId + ", userName=" + userName + ", replyUserId="
				+ replyUserId + ", replyUserName=" + replyUserName + ", message=" + message + ", time=" + time
				+ ", userImageUrl=" + userImageUrl + ", replyMessageId=" + replyMessageId + "]";
	}

}
