package com.cp.service.impl;

import com.cp.domain.CommunityMessage;
import com.cp.mapper.CommunityMessageMapper;
import com.cp.service.CommunityMessageService;
import com.cp.utils.MybatisUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CommunityMessageServiceImpl implements CommunityMessageService {
    CommunityMessageMapper communityMessageMapper = MybatisUtils.getMapper(CommunityMessageMapper.class);

    @Override
    public List<CommunityMessage> getCommunityMessages() {
        return communityMessageMapper.selectList();
    }

    @Override
    public List<CommunityMessage> getListByReplyId(String replyId) {
        return communityMessageMapper.selectByReplyId(replyId);
    }

    @Override
    public List<CommunityMessage> getListByParentId(String parentId) {
        return communityMessageMapper.selectByParentId(parentId);
    }

    @Override
    public List<CommunityMessage> getListByName(String name) {
        return communityMessageMapper.selectListByName(name);
    }

    @Override
    public List<CommunityMessage> getCommunityMessagesDynamic(String name, String title, String content) {
        Map<String, Object> paramMap = new HashMap<>();
        if (name != null && !name.isEmpty()) {
            paramMap.put("name", name);
        }
        if (title != null && !title.isEmpty()) {
            paramMap.put("title", title);
        }
        if (content != null && !content.isEmpty()) {
            paramMap.put("content", content);
        }
        return communityMessageMapper.selectCommunityMessagesDynamic(paramMap);
    }

    @Override
    public CommunityMessage getCommunityMessageById(String messageId) {
        return communityMessageMapper.selectById(messageId);
    }

    @Override
    public boolean addCommunityMessage(CommunityMessage message) {
        return communityMessageMapper.addCommunityMessage(message);
    }

    @Override
    public boolean deleteCommunityMessage(String messageId) {
        return communityMessageMapper.deleteCommunityMessage(messageId);
    }

    @Override
    public boolean updateCommunityMessage(CommunityMessage communityMessage) {
        return communityMessageMapper.updateCommunityMessage(communityMessage);
    }
}
