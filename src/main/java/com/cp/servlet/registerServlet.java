package com.cp.servlet;


import com.cp.domain.User;
import com.cp.service.UserService;
import com.cp.service.impl.UserServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "registerServlet", value = "/registerServlet")
public class registerServlet extends HttpServlet {

    public UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        User user = new User(null, username, password, phoneNumber, null);
        int verify = userService.register(user);

        if (verify == 0) {
            String msg = "注册成功";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        if (verify == 1) {
            String msg = "用户名已被使用";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if (verify == 2) {
            String msg = "手机号已被使用";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

    }
}