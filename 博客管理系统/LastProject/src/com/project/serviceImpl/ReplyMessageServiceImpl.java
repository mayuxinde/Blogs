package com.project.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.ReplyMessageDao;
import com.project.domain.Message;
import com.project.domain.ReplyMessage;
import com.project.service.ReplyMessageService;

@Service
public class ReplyMessageServiceImpl implements ReplyMessageService {

	@Autowired
	private ReplyMessageDao replyMessageDao;

	@Override
	public void reply(ReplyMessage replyMessage) {
		replyMessageDao.reply(replyMessage);
	}

	@Override
	public List<ReplyMessage> showReplyMessageByReplyMessageId(Integer id) {
		return replyMessageDao.showReplyMessageByReplyMessageId(id);
	}

	@Override
	public void deleteReplyMessage(Integer id) {
		replyMessageDao.deleteReplyMessage(id);
	}

}
