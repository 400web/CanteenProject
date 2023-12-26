package com.cp.servlet;

import com.cp.domain.Complaint;
import com.cp.service.ComplaintService;
import com.cp.service.impl.ComplaintServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "replyComplaintServlet", value = "/replyComplaintServlet")
public class replyComplaintServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String complaintId = request.getParameter("id");
        String responseText = request.getParameter("response");
        Complaint complaint = new Complaint();
        complaint.setId(complaintId);
        complaint.setResponseInfo(responseText);
        if(responseText!=null&&!responseText.isEmpty()){
            complaint.setFeedback("已处理");
            System.out.println(complaintId);
        ComplaintService complaintService = new ComplaintServiceImpl();
        complaintService.updateComplaint(complaint);
        }


    }
}