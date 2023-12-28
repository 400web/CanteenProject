package com.cp.servlet;

import com.cp.domain.CommunityMessage;
import com.cp.domain.User;
import com.cp.service.BehaviorAnalysisService;
import com.cp.service.CommunityMessageService;
import com.cp.service.OrdinaryUserService;
import com.cp.service.impl.BehaviorAnalysisServiceImpl;
import com.cp.service.impl.CommunityMessageServiceImpl;
import com.cp.service.impl.OrdinaryUserServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "replyCommentServlet", value = "/replyCommentServlet")
public class replyCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        User user=(User) request.getSession().getAttribute("user");
        OrdinaryUserService oUService =new OrdinaryUserServiceImpl();
        CommunityMessageService communityMessageService = new CommunityMessageServiceImpl();
        BehaviorAnalysisService behaviorAnalysisService = new BehaviorAnalysisServiceImpl();
        CommunityMessage communityMessage = communityMessageService.getCommunityMessageById(id);
        communityMessage.setLike(behaviorAnalysisService.detectLikeStatus(user.getId(), communityMessage.getId()) != null);
        List<CommunityMessage> replyList = communityMessageService.getListByReplyId(id);
        for (CommunityMessage c : replyList) {
            c.setReplyList(communityMessageService.getListByParentId(c.getId()));
            for (CommunityMessage cm : c.getReplyList()) {
                if (cm.getReplyMessageId().equals(cm.getParentId())) {
                    cm.setReplyName("");
                } else {
                    cm.setReplyName(communityMessageService.getCommunityMessageById(cm.getReplyMessageId()).getName());
                }
                cm.setLike(behaviorAnalysisService.detectLikeStatus(user.getId(), cm.getId()) != null);
                cm.setLevel(oUService.getOrdinaryUserById(cm.getPublisherId()).getLevel());
            }
            c.setLike(behaviorAnalysisService.detectLikeStatus(user.getId(), c.getId()) != null);
            c.setLevel(oUService.getOrdinaryUserById(c.getPublisherId()).getLevel());
        }
        request.setAttribute("parentMessage", communityMessage);
        request.setAttribute("replyList", replyList);
        request.getRequestDispatcher("community.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}