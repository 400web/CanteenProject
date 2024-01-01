package com.cp.service.impl;

import com.cp.domain.CommunityMessage;
import com.cp.mapper.CommunityMessageMapper;
import com.cp.service.CommunityMessageService;
import com.cp.utils.MybatisUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CommunityMessageServiceImpl implements CommunityMessageService {

    @Override
    public List<CommunityMessage> getCommunityMessages() {
        return MybatisUtils.execute(session -> {
            CommunityMessageMapper communityMessageMapper = session.getMapper(CommunityMessageMapper.class);
            return communityMessageMapper.selectList();
        });
    }

    @Override
    public List<CommunityMessage> getListByReplyId(String replyId) {
        return MybatisUtils.execute(session -> {
            CommunityMessageMapper communityMessageMapper = session.getMapper(CommunityMessageMapper.class);
            return communityMessageMapper.selectByReplyId(replyId);
        });
    }

    @Override
    public List<CommunityMessage> getListByParentId(String parentId) {
        return MybatisUtils.execute(session -> {
            CommunityMessageMapper communityMessageMapper = session.getMapper(CommunityMessageMapper.class);
            return communityMessageMapper.selectByParentId(parentId);
        });
    }

    @Override
    public List<CommunityMessage> getListByName(String name) {
        return MybatisUtils.execute(session -> {
            CommunityMessageMapper communityMessageMapper = session.getMapper(CommunityMessageMapper.class);
            return communityMessageMapper.selectListByName(name);
        });
    }

    @Override
    public List<CommunityMessage> getCommunityMessagesDynamic(String name, String title, String content) {
        return MybatisUtils.execute(session -> {
            CommunityMessageMapper communityMessageMapper = session.getMapper(CommunityMessageMapper.class);
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
        });
    }

    @Override
    public CommunityMessage getCommunityMessageById(String messageId) {
        return MybatisUtils.execute(session -> {
            CommunityMessageMapper communityMessageMapper = session.getMapper(CommunityMessageMapper.class);
            return communityMessageMapper.selectById(messageId);
        });
    }

    @Override
    public boolean addCommunityMessage(CommunityMessage message) {
        return MybatisUtils.execute(session -> {
            CommunityMessageMapper communityMessageMapper = session.getMapper(CommunityMessageMapper.class);
            return communityMessageMapper.addCommunityMessage(message);
        });
    }

    @Override
    public boolean deleteCommunityMessage(String messageId) {
        return MybatisUtils.execute(session -> {
            CommunityMessageMapper communityMessageMapper = session.getMapper(CommunityMessageMapper.class);
            return communityMessageMapper.deleteCommunityMessage(messageId);
        });
    }

    @Override
    public boolean updateCommunityMessage(CommunityMessage communityMessage) {
        return MybatisUtils.execute(session -> {
            CommunityMessageMapper communityMessageMapper = session.getMapper(CommunityMessageMapper.class);
            return communityMessageMapper.updateCommunityMessage(communityMessage);
        });
    }
}