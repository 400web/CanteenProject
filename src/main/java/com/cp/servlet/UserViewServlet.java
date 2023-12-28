package com.cp.servlet;

import com.cp.domain.ChatMessage;
import com.cp.domain.User;
import com.cp.service.ChatMessageService;
import com.cp.service.UserService;
import com.cp.service.impl.ChatMessageServiceImpl;
import com.cp.service.impl.UserServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserViewServlet", value = "/UserViewServlet")
public class UserViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserServiceImpl();
        User user = (User) request.getSession().getAttribute("user");
        ChatMessageService chatMessageService = new ChatMessageServiceImpl();
        List<String> ids = chatMessageService.getUserIdBySenderId(user.getId());
        List<User> chatHistoryUsers = userService.getListByIds(ids);
        List<User> allUsers = userService.getList();
        request.setAttribute("chatHistoryUsers", chatHistoryUsers);
        request.setAttribute("allUsers", allUsers);
        request.getRequestDispatcher("userSearch.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}