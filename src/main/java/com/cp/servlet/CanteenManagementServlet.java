package com.cp.servlet;

import com.cp.domain.Canteen;
import com.cp.domain.Complaint;
import com.cp.domain.Dish;
import com.cp.domain.User;
import com.cp.service.CanteenAdminService;
import com.cp.service.CanteenService;
import com.cp.service.ComplaintService;
import com.cp.service.DishService;
import com.cp.service.impl.CanteenAdminServiceImpl;
import com.cp.service.impl.CanteenServiceImpl;
import com.cp.service.impl.ComplaintServiceImpl;
import com.cp.service.impl.DishServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CanteenManagementServlet", value = "/CanteenManagementServlet")
public class CanteenManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CanteenService canteenService = new CanteenServiceImpl();
        DishService dishService = new DishServiceImpl();
        ComplaintService complaintService = new ComplaintServiceImpl();
        CanteenAdminService canteenAdminService = new CanteenAdminServiceImpl();
        User user = (User) request.getSession().getAttribute("user");
        Canteen canteen=canteenAdminService.getCanteenByAdminId(user.getId());
        List<Dish> dishes=dishService.getDishesByCanteenId(canteen.getId());
        List<Complaint> complaints=complaintService.getComplaintsByCanteenName(canteen.getName());
        System.out.println("tousu"+complaints);
        request.setAttribute("canteen",canteen);
        request.setAttribute("dishes",dishes);
        request.setAttribute("complaints",complaints);
        request.getRequestDispatcher("canteenManagement.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}