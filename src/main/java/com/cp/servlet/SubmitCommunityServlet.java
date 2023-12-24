package com.cp.servlet;

import com.cp.domain.CommunityMessage;
import com.cp.service.CommunityMessageService;
import com.cp.service.impl.CommunityMessageServiceImpl;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

@WebServlet(name = "SubmitCommunityServlet", value = "/SubmitCommunityServlet")
public class SubmitCommunityServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommunityMessageService cms = new CommunityMessageServiceImpl();
        // 从请求中获取JSON格式的数据
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
        // 解析 JSON 数据
        JsonObject jsonObject = gson.fromJson(requestBody, JsonObject.class);

        // 从 JSON 对象中获取相应的值
        String username = jsonObject.get("username").getAsString();
        String commentContent = jsonObject.get("comment-content").getAsString();
        String replyId = jsonObject.get("replyId").getAsString();
        String replyName = jsonObject.get("replyName").getAsString();
        String parentId = jsonObject.get("parentId").getAsString();
        long time = System.currentTimeMillis();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = sdf.format(time);
        CommunityMessage message = new CommunityMessage(null, "12", username, formattedDate, time, null, commentContent, 0, 0, 100, replyId, parentId, null, null);
        cms.addCommunityMessage(message);
        if (!replyId.equals(parentId)) {
            CommunityMessage parentMessage = cms.getCommunityMessageById(parentId);
            parentMessage.setComments(parentMessage.getComments() + 1);
            cms.updateCommunityMessage(parentMessage);
        }
        CommunityMessage replyMessage = cms.getCommunityMessageById(replyId);
        replyMessage.setComments(replyMessage.getComments() + 1);
        cms.updateCommunityMessage(replyMessage);
        message.setReplyName(replyName);
        String jsonResponse = gson.toJson(message);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        // 将JSON格式的消息发送回客户端
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}