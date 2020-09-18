package com.project.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.UserDao;
import com.project.domain.User;
import com.project.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Override
	public void register(User user) {
		userDao.register(user);
	}

	@Override
	public User selectUserByEmail(String email) {
		return userDao.selectUserByEmail(email);
	}

	@Override
	public String login(String email, String password, HttpServletRequest request) {
		User user = selectUserByEmail(email);
		if(user==null){
			return "用户不存在";
		}else{
			if(password.equals(user.getPassword())){
				request.getSession().setAttribute("loginUser", user);
				return "success";
			}else{
				return "密码错误";
			}
		}
	}

	@Override
	public String checkUserModeByEmail(String email) {
		return userDao.checkUserModeByEmail(email);
	}

	@Override
	public List<User> showUser() {
		return userDao.showUser();
	}

	@Override
	public void deleteUser(Integer id) {
		userDao.deleteUser(id);
	}

	@Override
	public void modify(User user) {
		userDao.modify(user);
	}

	@Override
	public User selectUserById(Integer id) {
		return userDao.selectUserById(id);
	}

}
