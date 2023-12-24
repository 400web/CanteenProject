package com.cp.servlet;

import com.cp.domain.CanteenAdmin;
import com.cp.domain.User;
import com.cp.service.CanteenAdminService;
import com.cp.service.UserService;
import com.cp.service.impl.CanteenAdminServiceImpl;
import com.cp.service.impl.UserServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AccountManagementServlet", value = "/AccountManagementServlet")
public class AccountManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.setAttribute("user" ,user);
        UserService userService = new UserServiceImpl();
        CanteenAdminService canteenAdminService=new CanteenAdminServiceImpl();
        List<User> userList = userService.getList();
        Map<String, User> userMap = new HashMap<>();
        for (User user1:userList) {
            userMap.put(user1.getId(),user1);
        }
        List<CanteenAdmin> canteenAdmins = canteenAdminService.getList();
        Map<String, CanteenAdmin> canteenAdminMap = new HashMap<>();
        for (CanteenAdmin canteenAdmin : canteenAdmins) {
            canteenAdminMap.put(canteenAdmin.getId(), canteenAdmin);
        }
        request.getRequestDispatcher("account-management.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("newUsername");
        String password = request.getParameter("newPassword");
        String phoneNumber = request.getParameter("newPhone");
        User user = (User) session.getAttribute("user");
        user.setUsername(username);
        user.setPassword(password);
        user.setPhoneNumber(phoneNumber);
        session.setAttribute("user", user);
        UserService userService = new UserServiceImpl();
        if(userService.updateUser(user)){
            doGet(request, response);
        }
    }
}