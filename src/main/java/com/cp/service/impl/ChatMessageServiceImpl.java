package com.cp.service.impl;

import com.cp.domain.ChatMessage;
import com.cp.service.ChatMessageService;

import java.util.List;

public class ChatMessageServiceImpl implements ChatMessageService {
    @Override
    public List<ChatMessage> getChatHistory(String senderId, String receiverId) {
        return null;
    }

    @Override
    public boolean addChatMessage(ChatMessage message) {
        return false;
    }

    @Override
    public boolean deleteChatMessage(String messageId) {
        return false;
    }
}
