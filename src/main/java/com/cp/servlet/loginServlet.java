package com.cp.servlet;

import com.cp.domain.User;
import com.cp.service.UserService;
import com.cp.service.impl.UserServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {
    UserService userService=new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");

        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        User user =userService.login(phoneNumber,password);
        if(user==null){
            String msg = "电话或密码错误";
            request.setAttribute("msg",msg);
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
        HttpSession session = request.getSession();
        session.setAttribute("User",user);
        //注册成功跳转食堂界面
        //request.getRequestDispatcher("success.jsp").forward(request,response);
    }
}