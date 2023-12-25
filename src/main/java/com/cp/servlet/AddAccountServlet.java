package com.cp.servlet;

import com.cp.domain.Canteen;
import com.cp.domain.CanteenAdmin;
import com.cp.domain.User;
import com.cp.service.CanteenAdminService;
import com.cp.service.CanteenService;
import com.cp.service.UserService;
import com.cp.service.impl.CanteenAdminServiceImpl;
import com.cp.service.impl.CanteenServiceImpl;
import com.cp.service.impl.UserServiceImpl;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@WebServlet(name = "AddAccountServlet", value = "/AddAccountServlet")
public class AddAccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 从请求中获取发送的 JSON 数据
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        // 解析收到的 JSON 数据
        String jsonString = sb.toString();
        JsonObject jsonObject = new Gson().fromJson(jsonString, JsonObject.class);

        // 获取单个字段（例如 "username"）
        String username = jsonObject.get("username").getAsString();
        String password = jsonObject.get("password").getAsString();
        String phoneNumber = jsonObject.get("phone").getAsString();
        String role = jsonObject.get("identity").getAsString();
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setPhoneNumber(phoneNumber);
        user.setRole(role);
        UserService userService = new UserServiceImpl();
        if(userService.addUser(user)){
            if(user.getRole().equals("食堂管理员")){
                String canteenId = jsonObject.get("canteenId").getAsString();
                CanteenAdmin canteenAdmin = new CanteenAdmin(user.getId(), canteenId, null);
                CanteenAdminService canteenAdminService = new CanteenAdminServiceImpl();
            }
            if(user.getRole().equals("普通用户")){

            }
        }
        // 在控制台打印获取到的用户名（仅作为示例）
        System.out.println("Received Username: " + username);

        // 可以在此处编写其他逻辑，根据需要获取其他字段
        // ...

        // 可以向前端发送响应（如果需要）
        response.setStatus(HttpServletResponse.SC_OK);

    }
}