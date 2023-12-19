package com.cp.servlet;

import com.cp.domain.CommunityMessage;
import com.cp.service.CommunityMessageService;
import com.cp.service.impl.CommunityMessageServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CommunityServlet", value = "/CommunityServlet")
public class CommunityServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        CommunityMessageService communityMessageService = new CommunityMessageServiceImpl();
        List<CommunityMessage> messageList = communityMessageService.getListByParentId(id);
        request.setAttribute("messageList", messageList);
        request.getRequestDispatcher("comments.jsp").forward(request, response);
    }
}