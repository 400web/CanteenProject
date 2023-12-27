package com.cp.servlet;

import com.cp.domain.Canteen;
import com.cp.service.CanteenService;
import com.cp.service.impl.CanteenServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "changeCanteenServlet", value = "/changeCanteenServlet")
public class changeCanteenServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 从请求中获取食堂信息1
        String canteenId = request.getParameter("id");
        String canteenName = request.getParameter("name");
        String canteenActivity = request.getParameter("activity");
        String canteenDescription = request.getParameter("description");
        String openingTime = request.getParameter("openingTime");
        String closingTime = request.getParameter("closingTime");

        // 创建食堂对象并设置属性
        Canteen canteen = new Canteen();
        canteen.setId(canteenId);
        canteen.setName(canteenName);
        canteen.setActivity(canteenActivity);
        canteen.setIntroduction(canteenDescription);
        canteen.setOpeningTime(openingTime);
        canteen.setClosingTime(closingTime);

        // 使用服务层更新食堂信息1
        CanteenService canteenService = new CanteenServiceImpl();
        canteenService.updateCanteen(canteen);
    }
}