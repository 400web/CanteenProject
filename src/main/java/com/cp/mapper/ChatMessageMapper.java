package com.cp.mapper;

import com.cp.domain.ChatMessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChatMessageMapper{
    ChatMessage selectById(String id);
    ChatMessage selectList();
    List<ChatMessage> selectListById(@Param("senderId") String senderId, @Param("receiverId") String receiverId);
    List<String> selectUserIdBySenderId(@Param("senderId") String senderId);
    boolean addChatMessage(ChatMessage chatMessage);
    boolean updateChatMessage(ChatMessage ChatMessage);
    boolean deleteChatMessage(@Param("id") String id);
}
