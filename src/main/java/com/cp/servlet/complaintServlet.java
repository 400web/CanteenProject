package com.cp.servlet;

import com.cp.domain.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "complaintServlet", value = "/complaintServlet")
public class complaintServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        String username=user.getUsername();
        String canteenName=request.getParameter("canteenName");
        request.setAttribute("canteenName",canteenName);
        request.setAttribute("username",username);
        request.getRequestDispatcher("complaint.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}