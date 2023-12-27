package com.cp.servlet;

import com.cp.domain.User;
import com.cp.service.ComplaintService;
import com.cp.service.impl.ComplaintServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ComplaintViewServlet", value = "/ComplaintViewServlet")
public class ComplaintViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ComplaintService complaintService = new ComplaintServiceImpl();
        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("complaints", complaintService.getComplaintById(user.getId()));
        request.getRequestDispatcher("complaintView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}