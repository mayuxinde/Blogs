package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.domain.User;
import com.project.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/add")
	public String add(User user, MultipartFile img, HttpServletRequest request) {

		InputStream io = null;
		try {
			String timestamp = String.valueOf(System.currentTimeMillis());
			String fileName = img.getOriginalFilename();
			io = img.getInputStream();
			String path = request.getRealPath("/upload");
			String file = path + "//" + timestamp + "-" + fileName;
			String showName = timestamp + "-" + fileName;
			user.setImageurl(file);
			request.getSession().setAttribute("imageName", showName);
			img.transferTo(new File(file));
			io.close();
			userService.register(user);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/login.jsp";
	}

	@ResponseBody
	@RequestMapping("/checkEmail")
	public Map<String, Object> checkEmail(@RequestBody(required = false) User user) {
		if (user == null) {
			user = new User();
		}
		User u = userService.selectUserByEmail(user.getEmail());
		Map<String, Object> map = new HashMap<String, Object>();
		String str = null;
		if (u == null) {
			str = "success";
		} else {
			str = "failed";
		}
		map.put("checkEmail", str);
		return map;
	}

	@RequestMapping("/login")
	public String login(User user, HttpServletRequest request) {
		String flag = userService.login(user.getEmail(), user.getPassword(), request);
		if ("用户不存在".equals(flag)) {
			request.setAttribute("loginError", flag);
			return "forward:/login.jsp";
		} else {
			if ("success".equals(flag)) {
				User u = (User) request.getSession().getAttribute("loginUser");
				String loginUserName = u.getUsername();
				String loginUserMode = u.getUsermode();
				String str = loginUserMode + loginUserName;
				String imageUrl = u.getImageurl().substring(48, u.getImageurl().length());
				request.getSession().setAttribute("loginUserName", str);
				request.getSession().setAttribute("imageUrl", imageUrl);
				return "show";
			} else {
				request.setAttribute("loginError", flag);
				return "forward:/login.jsp";
			}
		}
	}

	@RequestMapping("/checkUserMode")
	@ResponseBody
	public Map<String, Object> checkUserMode(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("loginUser");
		String userMode = user.getUsermode();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userMode", userMode);
		return map;
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/login.jsp";
	}

	@RequestMapping("/userManageLogin")
	public String userManageLogin(User user, HttpServletRequest request) {
		String flag = userService.login(user.getEmail(), user.getPassword(), request);
		if ("用户不存在".equals(flag)) {
			request.setAttribute("userManageLoginError", flag);
			return "forward:/userManageLogin.jsp";
		} else {
			if ("success".equals(flag)) {
				User u = (User) request.getSession().getAttribute("loginUser");
				String loginUserName = u.getUsername();
				String loginUserMode = u.getUsermode();
				String str = loginUserMode + loginUserName;
				String imageUrl = u.getImageurl().substring(48, u.getImageurl().length());
				request.getSession().setAttribute("loginUserName", str);
				request.getSession().setAttribute("imageUrl", imageUrl);
				return "userManage";
			} else {
				request.setAttribute("userManageLoginError", flag);
				return "forward:/userManageLogin.jsp";
			}
		}
	}

	@ResponseBody
	@RequestMapping("/showUser")
	public Map<String, Object> showUser() {
		List<User> list = userService.showUser();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userList", list);
		return map;
	}

	@ResponseBody
	@RequestMapping("/checkUserModeByEmail")
	public Map<String, Object> checkUserModeByEmail(@RequestBody(required = false) User user) {
		String userMode = userService.checkUserModeByEmail(user.getEmail());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userMode", userMode);
		return map;
	}

	@RequestMapping("/deleteUser")
	public String deleteUser(Integer id) {
		userService.deleteUser(id);
		return "userManage";
	}

}
