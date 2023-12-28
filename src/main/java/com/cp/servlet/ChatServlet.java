package com.cp.servlet;

import com.cp.domain.ChatMessage;
import com.cp.domain.User;
import com.cp.service.ChatMessageService;
import com.cp.service.UserService;
import com.cp.service.impl.ChatMessageServiceImpl;
import com.cp.service.impl.UserServiceImpl;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "ChatServlet", value = "/ChatServlet")
public class ChatServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        User sender = (User) request.getSession().getAttribute("user");
        UserService userService = new UserServiceImpl();
        User replyUser = userService.getUserById(id);
        ChatMessageService chatMessageService = new ChatMessageServiceImpl();
        List<ChatMessage> sendMessages = chatMessageService.getChatHistory(sender.getId(), id);
        sendMessages.forEach(chatMessage -> chatMessage.setName(sender.getUsername()));
        List<ChatMessage> replyMessages = chatMessageService.getChatHistory(id, sender.getId());
        replyMessages.forEach(chatMessage -> chatMessage.setName(replyUser.getUsername()));
        sendMessages.addAll(replyMessages);
        Collections.sort(sendMessages);
        System.out.println(replyUser);
        request.setAttribute("replyUser", replyUser);
        request.setAttribute("history", sendMessages);
        request.getRequestDispatcher("chat.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ChatMessageService chatMessageService=new ChatMessageServiceImpl();
        User user = (User) request.getSession().getAttribute("user");
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String requestBody = sb.toString();
        // 输出请求体内容（用于检查）
        System.out.println("收到的请求数据：" + requestBody);
        long time = System.currentTimeMillis();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = sdf.format(time);
        Gson gson=new Gson();
        ChatMessage chatMessage = gson.fromJson(requestBody, ChatMessage.class);
        chatMessage.setName(user.getUsername());
        chatMessage.setSenderId(user.getId());
        chatMessage.setSendTime(formattedDate);
        chatMessage.setTimestamp(time);
        chatMessageService.addChatMessage(chatMessage);
        String jsonResponse = gson.toJson(chatMessage);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        // 将JSON格式的消息发送回客户端
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}