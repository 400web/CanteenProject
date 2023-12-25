package com.cp.servlet;

import com.cp.domain.User;
import com.cp.service.UserService;
import com.cp.service.impl.UserServiceImpl;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "UpdateAccountServlet", value = "/UpdateAccountServlet")
public class UpdateAccountServlet extends HttpServlet {
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

        String userId = jsonObject.get("userId").getAsString();
        String username = jsonObject.get("editedUsername").getAsString();
        String password = jsonObject.get("editedPassword").getAsString();
        String phoneNumber = jsonObject.get("editedPhone").getAsString();
        String role = jsonObject.get("editedRole").getAsString();
        User user = new User(userId, username, password, phoneNumber,role);
        System.out.println("userId"+userId);
        System.out.println("username:"+username);
        System.out.println("password:"+password);
        System.out.println("phoneNumber:"+phoneNumber);
        System.out.println("role:"+user.getRole());
        UserService userService = new UserServiceImpl();
        if(role.equals("普通用户")){
            userService.updateUserRole(user, null);
        }
        if(role.equals("食堂管理员")){
            String canteenId = jsonObject.get("canteenId").getAsString();
            userService.updateUserRole(user, canteenId);
        }
    }
}