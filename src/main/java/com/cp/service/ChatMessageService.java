package com.cp.service;

import com.cp.domain.ChatMessage;

import java.util.List;

public interface ChatMessageService {
    /**
     * 获取两个用户之间的聊天记录
     *
     * @param senderId   发送者ID
     * @param receiverId 接收者ID
     * @return 两个用户之间的聊天记录列表，若不存在返回空列表
     */
    List<ChatMessage> getChatHistory(String senderId, String receiverId);

    /**
     * 添加聊天信息到数据库
     *
     * @param message 聊天信息对象
     * @return 添加成功返回true，失败返回false
     */
    boolean addChatMessage(ChatMessage message);

    /**
     * 删除指定聊天信息
     *
     * @param messageId 聊天信息ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteChatMessage(String messageId);
    boolean updateChatMessage(ChatMessage ChatMessage);
}
