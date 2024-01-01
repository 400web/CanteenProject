package com.cp.servlet;

import com.cp.domain.Canteen;
import com.cp.domain.CanteenAdmin;
import com.cp.domain.OrdinaryUser;
import com.cp.domain.User;
import com.cp.service.CanteenAdminService;
import com.cp.service.CanteenService;
import com.cp.service.OrdinaryUserService;
import com.cp.service.UserService;
import com.cp.service.impl.CanteenAdminServiceImpl;
import com.cp.service.impl.CanteenServiceImpl;
import com.cp.service.impl.OrdinaryUserServiceImpl;
import com.cp.service.impl.UserServiceImpl;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLDecoder;

@WebServlet(name = "AddAccountServlet", value = "/AddAccountServlet")
public class AddAccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String jsonString = sb.toString();
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(jsonString, JsonObject.class);
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
        System.out.println("username:"+username);
        System.out.println("password:"+password);
        System.out.println("phoneNumber:"+phoneNumber);
        System.out.println("role:"+user.getRole());
        if(userService.addUser(user)){
            if(user.getRole().equals("食堂管理员")){
                String canteenId = jsonObject.get("canteenId").getAsString();
                CanteenAdmin canteenAdmin = new CanteenAdmin(user.getId(), canteenId, null);
                CanteenAdminService canteenAdminService = new CanteenAdminServiceImpl();
                if(canteenAdminService.addCanteenAdminRelation(canteenAdmin.getId(),canteenAdmin.getCanteenId())){
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("{\"redirect\": \"AccountManagementServlet\"}");
                    response.getWriter().flush();
                }
            }
            if(user.getRole().equals("普通用户")){
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"redirect\": \"AccountManagementServlet\"}");
                response.getWriter().flush();
                /*System.out.println("user:"+ user.getId());
                OrdinaryUser ordinaryUser = new OrdinaryUser(user.getId(), 0, 0, 0, 1);
                OrdinaryUserService ordinaryUserService = new OrdinaryUserServiceImpl();
                if(ordinaryUserService.addOrdinaryUser(ordinaryUser)){
                }*/
            }
        }
        response.setStatus(HttpServletResponse.SC_OK);
    }
}