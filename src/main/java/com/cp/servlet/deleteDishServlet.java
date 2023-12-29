package com.cp.servlet;

import com.cp.service.DishService;
import com.cp.service.impl.DishServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "deleteDishServlet", value = "/deleteDishServlet")
public class deleteDishServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dishId = request.getParameter("id");
        System.out.println("删除"+dishId);
        DishService dishService = new DishServiceImpl();
        dishService.deleteDish(dishId);
    }
}