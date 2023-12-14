package com.cp.mapper;

import com.cp.domain.Complaint;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ComplaintMapper{
    Complaint selectById(@Param("id") String id);
    List<Complaint> selectList();
    List<Complaint> selectByComplainantId(@Param("complainantId") String complainantId);
    List<Complaint> selectByCanteenId(String canteenId);
    boolean addComplaint(Complaint complaint);
    boolean updateComplaint(Complaint complaint);
    boolean deleteComplaint(@Param("id") String id);
}
