package com.cp.servlet;

import com.cp.domain.CommunityMessage;
import com.cp.service.CommunityMessageService;
import com.cp.service.impl.CommunityMessageServiceImpl;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "PostSearchServlet", value = "/PostSearchServlet")
public class PostSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        CommunityMessageService cms = new CommunityMessageServiceImpl();
        String name = request.getParameter("username");
        String postContent = request.getParameter("postContent");
        System.out.println(postContent);
        List<CommunityMessage> list = cms.getCommunityMessagesDynamic(name, postContent, postContent);
        String jsonResponse = gson.toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        // 将JSON格式的消息发送回客户端
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}