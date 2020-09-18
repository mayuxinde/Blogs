package com.project.domain;

import java.io.Serializable;

public class User implements Serializable {

	private Integer id;
	private String username;
	private String password;
	private String imageurl;
	private String usermode;
	private String email;

	public User() {
	}

	public User(Integer id, String username, String password, String imageurl, String usermode, String email) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.imageurl = imageurl;
		this.usermode = usermode;
		this.email = email;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	public String getUsermode() {
		return usermode;
	}

	public void setUsermode(String usermode) {
		this.usermode = usermode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", imageurl=" + imageurl
				+ ", usermode=" + usermode + ", email=" + email + "]";
	}


}
