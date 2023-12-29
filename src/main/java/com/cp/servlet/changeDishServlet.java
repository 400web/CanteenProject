package com.cp.servlet;

import com.cp.domain.Dish;
import com.cp.service.DishService;
import com.cp.service.impl.DishServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "changeDishServlet", value = "/changeDishServlet")
public class changeDishServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dishId = request.getParameter("id");
        String dishName = request.getParameter("name");
        String dishDescription = request.getParameter("description");
        String dishPrice = request.getParameter("price");
        String dishCuisine = request.getParameter("cuisine");
        String dishRecommed = request.getParameter("recommend");

        Dish dish = new Dish();
        dish.setId(dishId);
        dish.setName(dishName);
        dish.setIntroduction(dishDescription);
        dish.setPrice(Double.parseDouble(dishPrice));
        dish.setCuisine(dishCuisine);
        dish.setRecommend(dishRecommed);

        DishService dishService = new DishServiceImpl();
        dishService.updateDish(dish);
        System.out.println(dishName);

    }
}