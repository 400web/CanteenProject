package com.cp.servlet;

import com.cp.service.CommunityMessageService;
import com.cp.service.impl.CommunityMessageServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "PostServlet", value = "/PostServlet")
public class PostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommunityMessageService cms = new CommunityMessageServiceImpl();
        request.setAttribute("communityMessages",cms.getListByReplyId("1"));
        request.getRequestDispatcher("forum.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}