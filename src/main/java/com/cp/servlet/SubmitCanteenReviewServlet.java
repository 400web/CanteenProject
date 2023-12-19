package com.cp.servlet;

import com.cp.domain.CanteenReview;
import com.cp.service.CanteenReviewService;
import com.cp.service.impl.CanteenReviewServiceImpl;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

@WebServlet(name = "SubmitCanteenReviewServlet", value = "/SubmitCanteenReviewServlet")
public class SubmitCanteenReviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CanteenReviewService canteenReviewService=new CanteenReviewServiceImpl();
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
        CanteenReview canteenReview = gson.fromJson(requestBody, CanteenReview.class);
        long time=System.currentTimeMillis();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = sdf.format(time);
        canteenReview.setTime(formattedDate);
        canteenReviewService.addCanteenReview(canteenReview);
        String jsonResponse = gson.toJson(canteenReview);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        // 将JSON格式的消息发送回客户端
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}