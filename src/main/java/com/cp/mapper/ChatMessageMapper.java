package com.cp.mapper;

import com.cp.domain.ChatMessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChatMessageMapper{
    ChatMessage selectById(String id);
    ChatMessage selectList();
    List<ChatMessage> selectListById(@Param("senderId") String senderId, @Param("receiverId") String receiverId);
    ChatMessage addChatMessage(ChatMessage chatMessage);
    ChatMessage updateChatMessage(ChatMessage ChatMessage);
    ChatMessage deleteChatMessage(@Param("id") String id);
}
