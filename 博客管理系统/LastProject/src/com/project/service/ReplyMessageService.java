package com.project.service;

import java.util.List;

import com.project.domain.Message;
import com.project.domain.ReplyMessage;

public interface ReplyMessageService {

	void reply(ReplyMessage replyMessage);

	List<ReplyMessage> showReplyMessageByReplyMessageId(Integer id);
	void deleteReplyMessage(Integer id);

}
