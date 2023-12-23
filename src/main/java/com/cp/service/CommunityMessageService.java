package com.cp.service;

import com.cp.domain.CommunityMessage;

import java.util.List;

public interface CommunityMessageService{
    /**
     * 获取社区消息列表
     *
     * @return 社区消息列表
     */
    List<CommunityMessage> getCommunityMessages();
    List<CommunityMessage> getListByReplyId(String replyId);
    List<CommunityMessage> getListByParentId(String parentId);
    List<CommunityMessage> getListByName(String name);
    List<CommunityMessage> getCommunityMessagesDynamic(String name,String content);

    /**
     * 根据消息ID获取社区消息
     *
     * @param messageId 消息ID
     * @return 指定消息ID的社区消息对象，若不存在返回null
     */
    CommunityMessage getCommunityMessageById(String messageId);

    /**
     * 添加社区消息到数据库
     *
     * @param message 社区消息对象
     * @return 添加成功返回true，失败返回false
     */
    boolean addCommunityMessage(CommunityMessage message);

    /**
     * 删除指定社区消息
     *
     * @param messageId 社区消息ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteCommunityMessage(String messageId);
    boolean updateCommunityMessage(CommunityMessage communityMessage);
}
