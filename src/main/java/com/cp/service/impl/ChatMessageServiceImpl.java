package com.cp.service.impl;

import com.cp.domain.ChatMessage;
import com.cp.mapper.ChatMessageMapper;
import com.cp.service.ChatMessageService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class ChatMessageServiceImpl implements ChatMessageService {
    ChatMessageMapper chatMessageMapper= MybatisUtils.getMapper(ChatMessageMapper.class);
    @Override
    public List<ChatMessage> getChatHistory(String senderId, String receiverId) {
        return chatMessageMapper.selectListById(senderId,receiverId);
    }

    @Override
    public List<String> getUserIdBySenderId(String senderId) {
        return chatMessageMapper.selectUserIdBySenderId(senderId);
    }

    @Override
    public boolean addChatMessage(ChatMessage message) {
        return chatMessageMapper.addChatMessage(message);
    }

    @Override
    public boolean deleteChatMessage(String messageId) {
        return chatMessageMapper.deleteChatMessage(messageId);
    }

    @Override
    public boolean updateChatMessage(ChatMessage chatMessage) {
        return chatMessageMapper.updateChatMessage(chatMessage);
    }
}
