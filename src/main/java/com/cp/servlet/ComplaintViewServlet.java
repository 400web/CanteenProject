package com.cp.servlet;

import com.cp.domain.Complaint;
import com.cp.domain.User;
import com.cp.service.ComplaintService;
import com.cp.service.impl.ComplaintServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ComplaintViewServlet", value = "/ComplaintViewServlet")
public class ComplaintViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ComplaintService complaintService = new ComplaintServiceImpl();
        User user = (User) request.getSession().getAttribute("user");
        List<Complaint> complaints=complaintService.getListByUserId(user.getId());
        for (Complaint complaint:complaints) {
            complaint.setName(user.getUsername());
        }
        request.setAttribute("complaints",complaints);
        request.getRequestDispatcher("complaintView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}