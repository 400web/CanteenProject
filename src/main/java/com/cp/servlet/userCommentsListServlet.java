package com.cp.servlet;

import com.cp.domain.CanteenReview;
import com.cp.domain.CommunityMessage;
import com.cp.domain.DishReview;
import com.cp.service.CanteenReviewService;
import com.cp.service.CommunityMessageService;
import com.cp.service.DishReviewService;
import com.cp.service.impl.CanteenReviewServiceImpl;
import com.cp.service.impl.CommunityMessageServiceImpl;
import com.cp.service.impl.DishReviewServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "userCommentsListServlet", value = "/userCommentsListServlet")
public class userCommentsListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("username");
        DishReviewService dishReviewService=new DishReviewServiceImpl();
        List<DishReview> dishReviewList=dishReviewService.getReviewListByName(username);
        CanteenReviewService canteenReviewService=new CanteenReviewServiceImpl();
        List<CanteenReview> canteenReviewList=canteenReviewService.getReviewByName(username);
        CommunityMessageService communityMessageService=new CommunityMessageServiceImpl();
        List<CommunityMessage> communityMessageList=communityMessageService.getListByName(username);
        request.setAttribute("username",username);
        request.setAttribute("dishReviewList",dishReviewList);
        request.setAttribute("canteenReviewList",canteenReviewList);
        System.out.println(canteenReviewList);
        request.setAttribute("communityMessageList",communityMessageList);
        request.getRequestDispatcher("userCommentsList.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}