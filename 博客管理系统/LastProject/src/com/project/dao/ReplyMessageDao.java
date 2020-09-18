package com.project.dao;

import java.util.List;

import com.project.domain.ReplyMessage;

public interface ReplyMessageDao {
	
	void reply(ReplyMessage replyMessage);
	List<ReplyMessage> showReplyMessageByReplyMessageId(Integer id); 
	void deleteReplyMessage(Integer id);

}
