package com.cp.servlet;

import com.cp.service.CanteenService;
import com.cp.service.impl.CanteenServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteCanteenServlet", value = "/DeleteCanteenServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,    // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class DeleteCanteenServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        CanteenService canteenService = new CanteenServiceImpl();
        if(canteenService.deleteCanteen(id)){
            response.sendRedirect("SdFirstPageServlet");
        }
    }
}