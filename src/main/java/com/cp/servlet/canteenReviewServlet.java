package com.cp.servlet;

import com.cp.domain.CanteenReview;
import com.cp.service.CanteenReviewService;
import com.cp.service.impl.CanteenReviewServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "canteenReviewServlet", value = "/canteenReviewServlet")
public class canteenReviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String canteenId=request.getParameter("canteenId");
        CanteenReviewService canteenReviewService=new CanteenReviewServiceImpl();
        List<CanteenReview> canteenReviewList=canteenReviewService.getReviewsByCanteenId(canteenId);
        request.setAttribute("canteenReviewList",canteenReviewList);
        request.setAttribute("canteenId",canteenId);
        RequestDispatcher dispatcher= request.getRequestDispatcher("comments.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}