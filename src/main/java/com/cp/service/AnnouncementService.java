package com.cp.service;

import com.cp.domain.Announcement;

import java.util.List;

public interface AnnouncementService{
    /**
     * 通过公告ID获取公告信息
     *
     * @param announcementId 公告ID
     * @return 公告信息，若不存在返回null
     */
    Announcement getAnnouncementById(String announcementId);

    /**
     * 获取所有公告列表
     *
     * @return 公告列表，若不存在返回空列表
     */
    List<Announcement> getAllAnnouncements();

    /**
     * 向数据库中添加公告信息
     *
     * @param announcement 公告信息对象
     * @return 添加成功返回true，失败返回false
     */
    boolean addAnnouncement(Announcement announcement);

    /**
     * 更新公告信息
     *
     * @param announcement 公告信息对象
     * @return 更新成功返回true，失败返回false
     */
    boolean updateAnnouncement(Announcement announcement);

    /**
     * 删除公告信息
     *
     * @param announcementId 公告ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteAnnouncement(String announcementId);
}
