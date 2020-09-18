package com.project.domain;

import java.io.Serializable;

public class Message implements Serializable {

	private Integer id;
	private Integer userId;
	private String userName;
	private String message;
	private String time;
	private String userImageUrl;

	public Message() {
	}

	public Message(Integer id, Integer userId, String userName, String message, String time, String userImageUrl) {
		this.id = id;
		this.userId = userId;
		this.userName = userName;
		this.message = message;
		this.time = time;
		this.userImageUrl = userImageUrl;
	}

	public Message(Integer userId, String userName, String message, String time, String userImageUrl) {
		this.userId = userId;
		this.userName = userName;
		this.message = message;
		this.time = time;
		this.userImageUrl = userImageUrl;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserImageUrl() {
		return userImageUrl;
	}

	public void setUserImageUrl(String userImageUrl) {
		this.userImageUrl = userImageUrl;
	}

	@Override
	public String toString() {
		return "Message [id=" + id + ", userId=" + userId + ", userName=" + userName + ", message=" + message
				+ ", time=" + time + ", userImageUrl=" + userImageUrl + "]";
	}

}
