package com.cp.servlet;


import com.cp.domain.Canteen;
import com.cp.domain.CommunityMessage;
import com.cp.domain.Dish;
import com.cp.domain.Survey;
import com.cp.service.CanteenService;
import com.cp.service.CommunityMessageService;
import com.cp.service.DishService;
import com.cp.service.SurveyService;
import com.cp.service.impl.CanteenServiceImpl;
import com.cp.service.impl.CommunityMessageServiceImpl;
import com.cp.service.impl.DishServiceImpl;
import com.cp.service.impl.SurveyServiceImpl;
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
        SurveyService surveyService = new SurveyServiceImpl();
        List<CommunityMessage> communityMessages = communityMessageService.getListByParentId("1");
        List<Canteen> canteens = canteenService.getList();
        List<Dish> dishes = dishService.getList();
        communityMessages.sort(CommunityMessageComparators.getHotComparator());
        Collections.sort(canteens);
        Collections.sort(dishes);
        List<Survey> surveyList=surveyService.getAllSurveys();
        List<Dish> recommendDishList = dishService.getDishesByRecommend();
        List<CommunityMessage> firstFiveMessages;
        List<Canteen> firstFiveCanteens;
        List<Dish> firstFiveDishes;
        List<Dish> lastFiveDishes;
        List<Survey> firstFiveSurveys;
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
            lastFiveDishes = dishes.subList(dishes.size()-5,dishes.size());
        } else {
            firstFiveDishes = dishes;
            lastFiveDishes = dishes;
        }
        if(surveyList.size()>=5){
            firstFiveSurveys=surveyList.subList(0,5);
        }else {
            firstFiveSurveys=surveyList;
        }
        request.setAttribute("topics", firstFiveMessages);
        request.setAttribute("canteens", firstFiveCanteens);
        request.setAttribute("allCanteen",canteens);
        request.setAttribute("dishes", firstFiveDishes);
        request.setAttribute("lowDishes",lastFiveDishes);
        request.setAttribute("dishList",recommendDishList);
        request.setAttribute("surveys",firstFiveSurveys);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}