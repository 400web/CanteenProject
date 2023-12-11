package com.cp.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cp.domain.CommunityMessage;
import com.cp.mapper.CommunityMessageMapper;
import com.cp.service.CommunityMessageService;

import java.util.List;

public class CommunityMessageServiceImpl  extends ServiceImpl<CommunityMessageMapper, CommunityMessage> implements CommunityMessageService {
    @Override
    public List<CommunityMessage> getCommunityMessages() {
        return null;
    }

    @Override
    public CommunityMessage getCommunityMessageById(String messageId) {
        return null;
    }

    @Override
    public boolean addCommunityMessage(CommunityMessage message) {
        return false;
    }

    @Override
    public boolean deleteCommunityMessage(String messageId) {
        return false;
    }
}
