package com.cp.servlet;

import com.cp.domain.CommunityMessage;
import com.cp.domain.User;
import com.cp.service.CommunityMessageService;
import com.cp.service.impl.CommunityMessageServiceImpl;
import com.cp.utils.CommunityMessageComparators;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "PostServlet", value = "/PostServlet")
public class PostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        CommunityMessageService cms = new CommunityMessageServiceImpl();
        List<CommunityMessage> list = cms.getListByReplyId("1");
        for (CommunityMessage cm:list) {
            cm.hotCompute();
            cms.updateCommunityMessage(cm);
        }
        list.sort(CommunityMessageComparators.getHotComparator());
        request.setAttribute("communityMessages", list);
        request.setAttribute("jsonList",new Gson().toJson(list));
        if (user.getRole().equals("系统管理员")){
            request.getRequestDispatcher("forum-sd.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("forum.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}