package com.cp.service.impl;


import com.cp.domain.Announcement;
import com.cp.mapper.AnnouncementMapper;
import com.cp.service.AnnouncementService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class AnnouncementServiceImpl implements AnnouncementService {

    @Override
    public Announcement getAnnouncementById(String announcementId) {
        return MybatisUtils.execute(session -> {
            AnnouncementMapper announcementMapper = session.getMapper(AnnouncementMapper.class);
            return announcementMapper.selectById(announcementId);
        });
    }

    @Override
    public List<Announcement> getAllAnnouncements() {
        return MybatisUtils.execute(session -> {
            AnnouncementMapper announcementMapper = session.getMapper(AnnouncementMapper.class);
            return announcementMapper.selectList();
        });
    }

    @Override
    public boolean addAnnouncement(Announcement announcement) {
        return MybatisUtils.execute(session -> {
            AnnouncementMapper announcementMapper = session.getMapper(AnnouncementMapper.class);
            return announcementMapper.addAnnouncement(announcement);
        });
    }

    @Override
    public boolean updateAnnouncement(Announcement announcement) {
        return MybatisUtils.execute(session -> {
            AnnouncementMapper announcementMapper = session.getMapper(AnnouncementMapper.class);
            return announcementMapper.updateAnnouncement(announcement);
        });
    }

    @Override
    public boolean deleteAnnouncement(String announcementId) {
        return MybatisUtils.execute(session -> {
            AnnouncementMapper announcementMapper = session.getMapper(AnnouncementMapper.class);
            return announcementMapper.deleteAnnouncement(announcementId);
        });
    }
}
