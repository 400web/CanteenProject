package com.cp.servlet;

import com.cp.domain.Canteen;
import com.cp.domain.CanteenReview;
import com.cp.domain.Dish;
import com.cp.service.CanteenReviewService;
import com.cp.service.CanteenService;
import com.cp.service.DishService;
import com.cp.service.impl.CanteenReviewServiceImpl;
import com.cp.service.impl.CanteenServiceImpl;
import com.cp.service.impl.DishServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "canteenServlet", value = "/canteenServlet")
public class canteenServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        CanteenService canteenService=new CanteenServiceImpl();
        DishService dishService=new DishServiceImpl();
        List<Dish> dishList= dishService.getDishesByCanteenId(id);
        CanteenReviewService canteenReviewService=new CanteenReviewServiceImpl();
        List<CanteenReview> canteenReviewList=canteenReviewService.getReviewsByCanteenId(id);
        Canteen canteen=canteenService.getCanteenById(id);
        request.setAttribute("canteen",canteen);
        request.setAttribute("dishList",dishList);
        request.setAttribute("canteenReviewList",canteenReviewList);
        request.getRequestDispatcher("interface.jsp").forward(request,response);

    }
}