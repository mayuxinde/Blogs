package com.project.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.MessageDao;
import com.project.domain.Message;
import com.project.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao messageDao;

	@Override
	public void add(Message message) {
		messageDao.add(message);
	}

	@Override
	public List<Message> selectMessage() {
		return messageDao.selectMessage();
	}

	@Override
	public List<Message> selectMessageByUserId(Integer userId) {
		return messageDao.selectMessageByUserId(userId);
	}

	@Override
	public String selectUserNameByUserId(Integer userId) {
		return messageDao.selectUserNameByUserId(userId);
	}

	@Override
	public Message selectMessageById(Integer id) {
		return messageDao.selectMessageById(id);
	}

	@Override
	public void deleteMessage(Integer id) {
		messageDao.deleteMessage(id);
	}

	@Override
	public Integer selectMessageCounts() {
		return messageDao.selectMessageCounts();
	}

	@Override
	public List<Message> messageList(Map map) {
		return messageDao.messageList(map);
	}

}
