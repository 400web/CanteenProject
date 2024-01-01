package com.cp.service.impl;

import com.cp.domain.ChatMessage;
import com.cp.mapper.ChatMessageMapper;
import com.cp.service.ChatMessageService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class ChatMessageServiceImpl implements ChatMessageService {

    @Override
    public List<ChatMessage> getChatHistory(String senderId, String receiverId) {
        return MybatisUtils.execute(session -> {
            ChatMessageMapper chatMessageMapper = session.getMapper(ChatMessageMapper.class);
            return chatMessageMapper.selectListById(senderId, receiverId);
        });
    }

    @Override
    public List<String> getUserIdBySenderId(String senderId) {
        return MybatisUtils.execute(session -> {
            ChatMessageMapper chatMessageMapper = session.getMapper(ChatMessageMapper.class);
            return chatMessageMapper.selectUserIdBySenderId(senderId);
        });
    }

    @Override
    public boolean addChatMessage(ChatMessage message) {
        return MybatisUtils.execute(session -> {
            ChatMessageMapper chatMessageMapper = session.getMapper(ChatMessageMapper.class);
            return chatMessageMapper.addChatMessage(message);
        });
    }

    @Override
    public boolean deleteChatMessage(String messageId) {
        return MybatisUtils.execute(session -> {
            ChatMessageMapper chatMessageMapper = session.getMapper(ChatMessageMapper.class);
            return chatMessageMapper.deleteChatMessage(messageId);
        });
    }

    @Override
    public boolean updateChatMessage(ChatMessage chatMessage) {
        return MybatisUtils.execute(session -> {
            ChatMessageMapper chatMessageMapper = session.getMapper(ChatMessageMapper.class);
            return chatMessageMapper.updateChatMessage(chatMessage);
        });
    }
}
