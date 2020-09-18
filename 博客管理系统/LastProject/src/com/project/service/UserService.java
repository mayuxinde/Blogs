package com.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.domain.User;

public interface UserService {

	void register(User user);

	User selectUserByEmail(String email);

	String login(String email, String password, HttpServletRequest request);

	String checkUserModeByEmail(String email);

	List<User> showUser();

	void deleteUser(Integer id);

	void modify(User user);

	User selectUserById(Integer id);
}
