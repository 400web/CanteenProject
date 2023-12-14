package com.cp.mapper;

import com.cp.domain.CommunityMessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityMessageMapper{
    CommunityMessage selectById(@Param("id") String id);
    List<CommunityMessage> selectPublisherId(@Param("publisherId") String publisherId);
    List<CommunityMessage> selectByContent(@Param("Content") String Content);
    List<CommunityMessage> selectBy(@Param("replyMessageId") String replyMessageId);
    List<CommunityMessage> selectList();
    boolean addCommunityMessage(CommunityMessage communityMessage);
    boolean upadteCommunityMessage(CommunityMessage communityMessage);
    boolean deleteCommunityMessage(@Param("id") String id);
}
