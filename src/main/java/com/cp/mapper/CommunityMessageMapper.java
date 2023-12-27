package com.cp.mapper;

import com.cp.domain.CommunityMessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CommunityMessageMapper {
    CommunityMessage selectById(@Param("id") String id);

    List<CommunityMessage> selectPublisherId(@Param("publisherId") String publisherId);

    List<CommunityMessage> selectByContent(@Param("Content") String Content);

    List<CommunityMessage> selectListByName(@Param("name") String name);

    List<CommunityMessage> selectByReplyId(@Param("replyMessageId") String replyMessageId);

    List<CommunityMessage> selectCommunityMessagesDynamic(Map<String, Object> data);

    List<CommunityMessage> selectList();

    List<CommunityMessage> selectByParentId(@Param("parentId") String parentId);

    boolean addCommunityMessage(CommunityMessage communityMessage);
    boolean updateHotValues(@Param("list") List<CommunityMessage> communityMessages);

    boolean updateCommunityMessage(CommunityMessage communityMessage);

    boolean deleteCommunityMessage(@Param("id") String id);
}
