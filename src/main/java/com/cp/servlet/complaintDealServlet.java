package com.cp.servlet;

import com.cp.domain.Complaint;
import com.cp.domain.User;
import com.cp.service.ComplaintService;
import com.cp.service.impl.ComplaintServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
        String canteenName=request.getParameter("object");
        String feedback="未处理";
        long time = System.currentTimeMillis();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = sdf.format(time);
        User user = (User) request.getSession().getAttribute("user");
        Complaint userComplaint=new Complaint();
        userComplaint.setComplainantId(user.getId());
        userComplaint.setComplaintInfo(complaint);
        userComplaint.setName(user.getUsername());
        userComplaint.setFeedback(feedback);
        userComplaint.setCanteenName(canteenName);
        userComplaint.setComplainTime(formattedDate);
        System.out.println("提交的投诉"+userComplaint);
        ComplaintService complaintService=new ComplaintServiceImpl();
        complaintService.addComplaint(userComplaint);
        String rebackMessage = "投诉成功";
        request.setAttribute("rebackMessage",rebackMessage);
        request.getRequestDispatcher("jumpPage.jsp").forward(request,response);
    }
}