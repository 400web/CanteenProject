package com.cp.service.impl;

import com.cp.domain.Complaint;
import com.cp.service.ComplaintService;

import java.util.List;

public class ComplaintServiceImpl implements ComplaintService {
    @Override
    public Complaint getComplaintById(String complaintId) {
        return null;
    }

    @Override
    public List<Complaint> getComplaintsByCanteenId(String canteenId) {
        return null;
    }

    @Override
    public boolean addComplaint(Complaint complaint) {
        return false;
    }

    @Override
    public boolean updateComplaint(Complaint complaint) {
        return false;
    }

    @Override
    public boolean deleteComplaint(String complaintId) {
        return false;
    }
}
