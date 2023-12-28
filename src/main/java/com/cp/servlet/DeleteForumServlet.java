package com.cp.servlet;

import com.cp.service.CommunityMessageService;
import com.cp.service.UserService;
import com.cp.service.impl.CommunityMessageServiceImpl;
import com.cp.service.impl.UserServiceImpl;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "DeleteForumServlet", value = "/DeleteForumServlet")
public class DeleteForumServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String jsonString = sb.toString();
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(jsonString, JsonObject.class);
        String messageId = jsonObject.get("messageId").getAsString();
        CommunityMessageService communityMessageService = new CommunityMessageServiceImpl();
        communityMessageService.deleteCommunityMessage(messageId);
    }
}