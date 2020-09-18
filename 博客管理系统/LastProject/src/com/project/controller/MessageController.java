package com.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.project.domain.Message;
import com.project.domain.Page;
import com.project.domain.User;
import com.project.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	private MessageService messageService;

	@RequestMapping("/add")
	public String addMessage(Message message, HttpServletRequest request) {
		if (message == null) {
			message = new Message();
		}
		User user = (User) request.getSession().getAttribute("loginUser");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
		String time = sdf.format(new Date());
		message.setTime(time);
		message.setUserId(user.getId());
		message.setUserName(user.getUsername());
		String url = user.getImageurl();
		String newUrl = url.substring(48, url.length());
		message.setUserImageUrl(newUrl);
		messageService.add(message);
		return "show";
	}

	@ResponseBody
	@RequestMapping("/show")
	public Map<String, Object> addAndShowMessage() {
		List<Message> messageList = messageService.selectMessage();
		Collections.reverse(messageList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("messageList", messageList);
		return map;
	}

	@RequestMapping("/singleUser")
	public String singleUser(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		request.getSession().setAttribute("messageUserId", userId);
		return "singleUserMessage";
	}

	@ResponseBody
	@RequestMapping("/singleUserMessage")
	public Map<String, Object> singleUserMessage(HttpServletRequest request) {
		String userId = (String) request.getSession().getAttribute("messageUserId");
		Integer userId1 = Integer.parseInt(userId);
		List<Message> singleUserMessageList = messageService.selectMessageByUserId(userId1);
		Collections.reverse(singleUserMessageList);
		Map<String, Object> singleUserMessageListMap = new HashMap<String, Object>();
		singleUserMessageListMap.put("singleUserMessageList", singleUserMessageList);
		return singleUserMessageListMap;
	}

	@RequestMapping("/getSingleMessage")
	public ModelAndView getSingleMessage(HttpServletRequest request) {
		String id = request.getParameter("id");
		request.getSession().setAttribute("id1", id);
		Integer id1 = Integer.parseInt(id);
		Message message = messageService.selectMessageById(id1);
		List<Message> singleMessageList = new ArrayList<Message>();
		singleMessageList.add(message);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("singleUserSingleMessage");
		mav.addObject("singleMessageList", singleMessageList);
		return mav;
	}

	@RequestMapping("/getSingleMessage1")
	public ModelAndView getSingleMessage1(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("id1");
		Integer id1 = Integer.parseInt(id);
		Message message = messageService.selectMessageById(id1);
		List<Message> singleMessageList = new ArrayList<Message>();
		singleMessageList.add(message);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("singleUserSingleMessage");
		mav.addObject("singleMessageList", singleMessageList);
		return mav;
	}

	// @ResponseBody
	// @RequestMapping("/singleUserSingleMessage")
	// public Map<String, Object> SingleMessage(HttpServletRequest request) {
	// String id = (String)
	// request.getSession().getAttribute("singleMessageId");
	// Integer id1 = Integer.parseInt(id);
	// Message message = messageService.selectMessageById(id1);
	// List<Message> singleMessageList = new ArrayList<Message>();
	// singleMessageList.add(message);
	// Map<String, Object> singleMessageListMap = new HashMap<String, Object>();
	// singleMessageListMap.put("singleMessageList", singleMessageList);
	// return singleMessageListMap;
	// }

	@RequestMapping("deleteMessage")
	public String deleteMessage(Integer id) {
		System.out.println(id);
		messageService.deleteMessage(id);
		return "show";
	}

	@ResponseBody
	@RequestMapping("messageList")
	public Map<String, Object> messageList(@RequestBody(required = false) Page page) {
		if (page == null) {
			page = new Page();
		}
		Integer messageCounts = messageService.selectMessageCounts();
		page.setMessageCounts(messageCounts);
		Integer begin = (page.getCurrentPage() - 1) * page.getPageSize();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("size", page.getPageSize());
		List<Message> list = messageService.messageList(map);
		// Collections.reverse(list);
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("page", page);
		responseMap.put("messageList", list);
		return responseMap;
	}

}
