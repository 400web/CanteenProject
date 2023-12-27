package com.cp.servlet;

import com.cp.domain.DishReview;
import com.cp.service.DishReviewService;
import com.cp.service.impl.DishReviewServiceImpl;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

@WebServlet(name = "SubmitDishReviewServlet", value = "/SubmitDishReviewServlet")
public class SubmitDishReviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DishReviewService dishReviewService=new DishReviewServiceImpl();
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String requestBody = sb.toString();

        // 输出请求体内容（用于检查）
        System.out.println("收到的请求数据：" + requestBody);
        Gson gson=new Gson();
        // 解析 JSON 数据
        DishReview dishReview = gson.fromJson(requestBody, DishReview.class);
        long time=System.currentTimeMillis();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = sdf.format(time);
        dishReview.setTime(formattedDate);
        dishReviewService.addDishReview(dishReview);
        response.sendRedirect("dishReviewServlet");
    }
}