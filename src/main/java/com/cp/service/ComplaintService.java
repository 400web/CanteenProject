package com.cp.service;

import com.cp.domain.Complaint;

import java.util.List;

public interface ComplaintService{
    /**
     * 通过投诉ID获取投诉信息
     *
     * @param complaintId 投诉ID
     * @return 投诉信息，若不存在返回null
     */
    Complaint getComplaintById(String complaintId);

    /**
     * 获取某个食堂的所有投诉列表
     *
     * @param canteenName 食堂name
     * @return 投诉列表，若不存在返回空列表
     */
    List<Complaint> getComplaintsByCanteenName(String canteenName);
    List<Complaint> getListByUserId(String userId);

    /**
     * 向数据库中添加投诉信息
     *
     * @param complaint 投诉信息对象
     * @return 添加成功返回true，失败返回false
     */
    boolean addComplaint(Complaint complaint);

    /**
     * 更新投诉信息
     *
     * @param complaint 投诉信息对象
     * @return 更新成功返回true，失败返回false
     */
    boolean updateComplaint(Complaint complaint);

    /**
     * 删除投诉信息
     *
     * @param complaintId 投诉ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteComplaint(String complaintId);
}
