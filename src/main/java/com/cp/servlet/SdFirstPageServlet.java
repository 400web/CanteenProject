package com.cp.servlet;

import com.cp.domain.Canteen;
import com.cp.service.CanteenService;
import com.cp.service.impl.CanteenServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SdFirstPageServlet", value = "/SdFirstPageServlet")
public class SdFirstPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CanteenService canteenService = new CanteenServiceImpl();
        List<Canteen> canteens = canteenService.getList();
        request.setAttribute("canteens", canteens);
        request.getRequestDispatcher("sdFirstPage.jsp").forward(request, response);
    }
}