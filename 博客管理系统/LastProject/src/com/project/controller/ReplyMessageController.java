package com.project.controller;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.ReplyMessage;
import com.project.domain.User;
import com.project.service.ReplyMessageService;

@Controller
@RequestMapping("/replyMessage")
public class ReplyMessageController {

	@Autowired
	private ReplyMessageService replyMessageService;

	@RequestMapping("/reply")
	public String replyMessage(ReplyMessage replyMessage, HttpServletRequest request) {
		if (replyMessage == null) {
			replyMessage = new ReplyMessage();
		}
		User user = (User) request.getSession().getAttribute("loginUser");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
		String time = sdf.format(new Date());
		replyMessage.setTime(time);
		replyMessage.setUserId(user.getId());
		replyMessage.setUserName(user.getUsername());
		String url = user.getImageurl();
		String newUrl = url.substring(48, url.length());
		replyMessage.setUserImageUrl(newUrl);
		replyMessageService.reply(replyMessage);
		return "redirect:/message/getSingleMessage1.do";
	}

	@ResponseBody
	@RequestMapping("/showReplyMessage")
	public Map<String, Object> showReplyMessage(@RequestBody(required = false) ReplyMessage replyMessage) {
		if (replyMessage == null) {
			replyMessage = new ReplyMessage();
		}
		List<ReplyMessage> list = replyMessageService
				.showReplyMessageByReplyMessageId(replyMessage.getReplyMessageId());
		Collections.reverse(list);
		Map<String, Object> replyMessageMap = new HashMap<String, Object>();
		replyMessageMap.put("replyMessageList", list);
		return replyMessageMap;
	}

	@RequestMapping("/deleteReplyMessage")
	public String deleteReplyMessage(Integer id) {
		replyMessageService.deleteReplyMessage(id);
		return "redirect:/message/getSingleMessage1.do";
	}

}
