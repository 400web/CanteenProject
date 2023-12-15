package com.cp.service.impl;


import com.cp.domain.Announcement;
import com.cp.mapper.AnnouncementMapper;
import com.cp.service.AnnouncementService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class AnnouncementServiceImpl implements AnnouncementService {
    AnnouncementMapper announcementMapper= MybatisUtils.getMapper(AnnouncementMapper.class);
    @Override
    public Announcement getAnnouncementById(String announcementId) {
        return announcementMapper.selectById(announcementId);
    }

    @Override
    public List<Announcement> getAllAnnouncements() {
        return announcementMapper.selectList();
    }

    @Override
    public boolean addAnnouncement(Announcement announcement) {
        return announcementMapper.addAnnouncement(announcement);
    }

    @Override
    public boolean updateAnnouncement(Announcement announcement) {
        return announcementMapper.updateAnnouncement(announcement);
    }

    @Override
    public boolean deleteAnnouncement(String announcementId) {
        return announcementMapper.deleteAnnouncement(announcementId);
    }
}
