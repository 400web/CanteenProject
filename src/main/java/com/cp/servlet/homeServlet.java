package com.cp.servlet;


import com.cp.domain.Canteen;
import com.cp.domain.CommunityMessage;
import com.cp.domain.Dish;
import com.cp.service.CanteenService;
import com.cp.service.CommunityMessageService;
import com.cp.service.DishService;
import com.cp.service.impl.CanteenServiceImpl;
import com.cp.service.impl.CommunityMessageServiceImpl;
import com.cp.service.impl.DishServiceImpl;
import com.cp.utils.CommunityMessageComparators;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "homeServlet", value = "/homeServlet")
public class homeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommunityMessageService communityMessageService = new CommunityMessageServiceImpl();
        CanteenService canteenService = new CanteenServiceImpl();
        DishService dishService = new DishServiceImpl();
        List<CommunityMessage> communityMessages = communityMessageService.getListByParentId("1");
        List<Canteen> canteens = canteenService.getList();
        List<Dish> dishes = dishService.getList();
        communityMessages.sort(CommunityMessageComparators.getHotComparator());
        Collections.sort(canteens);
        Collections.sort(dishes);
        List<CommunityMessage> firstFiveMessages;
        List<Canteen> firstFiveCanteens;
        List<Dish> firstFiveDishes;
        if (communityMessages.size() >= 5) {
            firstFiveMessages = communityMessages.subList(0, 5);
        } else {
            firstFiveMessages = communityMessages;
        }
        if (canteens.size() >= 5) {
            firstFiveCanteens = canteens.subList(0, 5);
        } else {
            firstFiveCanteens = canteens;
        }
        if (dishes.size() >= 5) {
            firstFiveDishes = dishes.subList(0, 5);
        } else {
            firstFiveDishes = dishes;
        }
        System.out.println(firstFiveDishes);
        request.setAttribute("topics", firstFiveMessages);
        request.setAttribute("canteens", firstFiveCanteens);
        request.setAttribute("dishes", firstFiveDishes);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}