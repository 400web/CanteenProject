package com.cp.servlet;

import com.cp.domain.Complaint;
import com.cp.service.ComplaintService;
import com.cp.service.impl.ComplaintServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "complaintDealServlet", value = "/complaintDealServlet")
public class complaintDealServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("username");
        String complaint=request.getParameter("complaint");
        String canteenName=request.getParameter("canteenName");
        String feedback="未处理";
        LocalDateTime currentTime = LocalDateTime.now();
        // 定义日期时间格式
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        // 格式化输出当前时间
        String time = currentTime.format(formatter);
        Complaint userComplaint=new Complaint();
        userComplaint.setComplaintInfo(complaint);
        userComplaint.setName(username);
        userComplaint.setFeedback(feedback);
        userComplaint.setCanteenName(canteenName);
        userComplaint.setComplainTime(time);
        ComplaintService complaintService=new ComplaintServiceImpl();
        complaintService.addComplaint(userComplaint);
    }
}