package com.cp.service.impl;

import com.cp.domain.Complaint;
import com.cp.mapper.ComplaintMapper;
import com.cp.service.ComplaintService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class ComplaintServiceImpl implements ComplaintService {

    @Override
    public Complaint getComplaintById(String complaintId) {
        return MybatisUtils.execute(session -> {
            ComplaintMapper complaintMapper = session.getMapper(ComplaintMapper.class);
            return complaintMapper.selectById(complaintId);
        });
    }

    @Override
    public List<Complaint> getComplaintsByCanteenName(String canteenName) {
        return MybatisUtils.execute(session -> {
            ComplaintMapper complaintMapper = session.getMapper(ComplaintMapper.class);
            return complaintMapper.selectByCanteenName(canteenName);
        });
    }

    @Override
    public List<Complaint> getListByUserId(String userId) {
        return MybatisUtils.execute(session -> {
            ComplaintMapper complaintMapper = session.getMapper(ComplaintMapper.class);
            return complaintMapper.selectByComplainantId(userId);
        });
    }

    @Override
    public boolean addComplaint(Complaint complaint) {
        return MybatisUtils.execute(session -> {
            ComplaintMapper complaintMapper = session.getMapper(ComplaintMapper.class);
            return complaintMapper.addComplaint(complaint);
        });
    }

    @Override
    public boolean updateComplaint(Complaint complaint) {
        return MybatisUtils.execute(session -> {
            ComplaintMapper complaintMapper = session.getMapper(ComplaintMapper.class);
            return complaintMapper.updateComplaint(complaint);
        });
    }

    @Override
    public boolean deleteComplaint(String complaintId) {
        return MybatisUtils.execute(session -> {
            ComplaintMapper complaintMapper = session.getMapper(ComplaintMapper.class);
            return complaintMapper.deleteComplaint(complaintId);
        });
    }
}
