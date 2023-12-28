package com.cp.servlet;

import com.cp.domain.Canteen;
import com.cp.service.CanteenService;
import com.cp.service.impl.CanteenServiceImpl;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "CanteenSearchServlet", value = "/CanteenSearchServlet")
public class CanteenSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CanteenService cs=new CanteenServiceImpl();
        request.setAttribute("canteenList",cs.getList());
        request.getRequestDispatcher("canteenSearch.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CanteenService cs=new CanteenServiceImpl();
        String name=request.getParameter("canteenName");
        List<Canteen> list=null;
        if(name==null||name.isEmpty()){
            list=cs.getList();
        }else {
            list=cs.getListLikeName(name);
        }
        Gson gson=new Gson();
        String jsonResponse = gson.toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        // 将JSON格式的消息发送回客户端
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}