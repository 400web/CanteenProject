package com.cp.service.impl;

import com.cp.domain.Complaint;
import com.cp.mapper.ComplaintMapper;
import com.cp.service.ComplaintService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class ComplaintServiceImpl implements ComplaintService {
    ComplaintMapper complaintMapper= MybatisUtils.getMapper(ComplaintMapper.class);
    @Override
    public Complaint getComplaintById(String complaintId) {
        return complaintMapper.selectById(complaintId);
    }

    @Override
    public List<Complaint> getComplaintsByCanteenId(String canteenId) {
        return complaintMapper.selectByCanteenId(canteenId);
    }

    @Override
    public List<Complaint> getListByUserId(String userId) {
        return null;
    }

    @Override
    public boolean addComplaint(Complaint complaint) {
        return complaintMapper.addComplaint(complaint);
    }

    @Override
    public boolean updateComplaint(Complaint complaint) {
        return complaintMapper.updateComplaint(complaint);
    }

    @Override
    public boolean deleteComplaint(String complaintId) {return complaintMapper.deleteComplaint(complaintId);}
}
