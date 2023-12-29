package com.cp.servlet;

import com.cp.domain.Canteen;
import com.cp.domain.CanteenReview;
import com.cp.domain.User;
import com.cp.service.CanteenReviewService;
import com.cp.service.CanteenService;
import com.cp.service.impl.CanteenReviewServiceImpl;
import com.cp.service.impl.CanteenServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "canteenReviewServlet", value = "/canteenReviewServlet")
public class canteenReviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String canteenId = request.getParameter("canteenId");
        CanteenReviewService canteenReviewService = new CanteenReviewServiceImpl();
        CanteenService canteenService = new CanteenServiceImpl();
        List<CanteenReview> canteenReviewList = canteenReviewService.getReviewsByCanteenId(canteenId);
        double allScore = 0;
        int count = 0;
        for (CanteenReview canteenReview : canteenReviewList) {
            if (canteenReview.getWeight() != 0) {
                allScore += canteenReview.getEvaluationScore();
                count++;
            }
        }
        if (count != 0) {
            double score = allScore / count;
            Canteen canteen = new Canteen();
            canteen.setId(canteenId);
            canteen.setRating(Math.floor(score * 10) / 10.0);
            canteenService.updateCanteen(canteen);
        }

        if(user.getRole().equals("系统管理员")){
            canteenReviewList = canteenReviewService.getList();
            request.setAttribute("canteenReviewList", canteenReviewList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("comments-sd.jsp");
            dispatcher.forward(request, response);
        }else {
            request.setAttribute("canteenReviewList", canteenReviewList);
            request.setAttribute("canteenId", canteenId);
            RequestDispatcher dispatcher = request.getRequestDispatcher("comments.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}