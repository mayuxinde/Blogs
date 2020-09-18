package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.domain.Message;
import com.project.domain.ReplyMessage;

public interface MessageDao {
	
	void add(Message message);
	List<Message> selectMessage();
	List<Message> selectMessageByUserId(Integer userId);
	String selectUserNameByUserId(Integer userId);
	Message selectMessageById(Integer id);
	void deleteMessage(Integer id);
	Integer selectMessageCounts();
	List<Message> messageList(Map map);
	
}
//–¥µΩªÿ∏¥¡Ù—‘