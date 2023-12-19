package com.cp.servlet;

import com.cp.domain.Dish;
import com.cp.domain.DishReview;
import com.cp.service.DishReviewService;
import com.cp.service.DishService;
import com.cp.service.impl.DishReviewServiceImpl;
import com.cp.service.impl.DishServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "dishReviewServlet", value = "/dishReviewServlet")
public class dishReviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dishId=request.getParameter("id");
        DishService dishService=new DishServiceImpl();
        Dish dish=dishService.getDishById(dishId);
        DishReviewService dishReviewService=new DishReviewServiceImpl();
        List<DishReview> dishReviewList=dishReviewService.getReviewsByDishId(dishId);
        request.setAttribute("dish",dish);
        request.setAttribute("dishReviewList",dishReviewList);
        request.getRequestDispatcher("dishReview.jsp").forward(request,response);
    }
}