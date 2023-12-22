package com.cp.servlet;

import com.cp.domain.Canteen;
import com.cp.domain.Dish;
import com.cp.service.CanteenService;
import com.cp.service.DishService;
import com.cp.service.impl.CanteenServiceImpl;
import com.cp.service.impl.DishServiceImpl;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "DishSearchServlet", value = "/DishSearchServlet")
public class DishSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CanteenService cs = new CanteenServiceImpl();
        DishService ds = new DishServiceImpl();
        List<Dish> dishList = ds.getList();
        System.out.println(dishList);
        for (Dish dish : dishList) {
            System.out.println(dish.getCanteenId());
            Canteen canteen = cs.getCanteenById(dish.getCanteenId());
            System.out.println(canteen);
            System.out.println(canteen.getName());
            String canteenName = canteen.getName();
            dish.setCanteenName(canteenName);
        }
        request.setAttribute("canteenList", cs.getList());
        request.setAttribute("dishList", dishList);
        request.getRequestDispatcher("dishSearch.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DishService ds = new DishServiceImpl();
        CanteenService cs = new CanteenServiceImpl();
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String requestBody = sb.toString();
        // 输出请求体内容（用于检查）
        System.out.println("收到的请求数据：" + requestBody);
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(requestBody, JsonObject.class);
        String canteenId = jsonObject.get("canteenId").getAsString();
        String cuisine = jsonObject.get("cuisine").getAsString();
        String minPrice = jsonObject.get("minPrice").getAsString();
        String maxPrice = jsonObject.get("maxPrice").getAsString();
        String dishName = jsonObject.get("dishName").getAsString();
        System.out.println(minPrice);
        System.out.println(maxPrice);
        List<Dish> list = ds.getDishesDynamic(dishName, canteenId, cuisine, minPrice, maxPrice);
        for (Dish dish : list) {
            String cName = cs.getCanteenById(dish.getCanteenId()).getName();
            dish.setCanteenName(cName);
        }
        System.out.println(list);
        String jsonResponse = gson.toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        // 将JSON格式的消息发送回客户端
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}