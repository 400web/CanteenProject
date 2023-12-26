package com.cp.servlet;

import com.cp.domain.CommunityMessage;
import com.cp.service.BehaviorAnalysisService;
import com.cp.service.CommunityMessageService;
import com.cp.service.impl.BehaviorAnalysisServiceImpl;
import com.cp.service.impl.CommunityMessageServiceImpl;
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
        CommunityMessageService communityMessageService = new CommunityMessageServiceImpl();
        BehaviorAnalysisService behaviorAnalysisService = new BehaviorAnalysisServiceImpl();
        CommunityMessage communityMessage = communityMessageService.getCommunityMessageById(id);
        List<CommunityMessage> replyList = communityMessageService.getListByReplyId(id);
        for (CommunityMessage c : replyList) {
            c.setReplyList(communityMessageService.getListByParentId(c.getId()));
            for (CommunityMessage cm : c.getReplyList()) {
                if (cm.getReplyMessageId().equals(cm.getParentId())) {
                    cm.setReplyName("");
                } else {
                    cm.setReplyName(communityMessageService.getCommunityMessageById(cm.getReplyMessageId()).getName());
                }
                cm.setLike(behaviorAnalysisService.detectLikeStatus("4", cm.getId()) != null);
            }
            c.setLike(behaviorAnalysisService.detectLikeStatus("4", c.getId()) != null);
        }
        System.out.println(communityMessage);
        request.setAttribute("parentMessage", communityMessage);
        request.setAttribute("replyList", replyList);
        request.getRequestDispatcher("community.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}