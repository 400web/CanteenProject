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
        DishReview dishReview=dishReviewService.getDishReviewById(dishId);

        String dishName=dish.getName();
        String dishImag=dish.getImage();
        String dishIntroduction=dish.getIntroduction();
        Double dishScore=dish.getScore();

    }
}