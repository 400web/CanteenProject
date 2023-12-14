package com.cp.mapper;

import com.cp.domain.Announcement;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnnouncementMapper {
    Announcement selectById(@Param("id") String id);
    List<Announcement> selectByPublisherId(@Param("publisherId") String publisherId);
    boolean addAnnouncement(Announcement announcement);
    boolean updateAnnouncement(Announcement announcement);
    boolean deleteAnnouncement(@Param("id") String id);
}
