package com.cp.servlet;

import com.cp.domain.CommunityMessage;
import com.cp.service.CommunityMessageService;
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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        CommunityMessageService communityMessageService = new CommunityMessageServiceImpl();
        CommunityMessage communityMessage=communityMessageService.getCommunityMessageById(id);
        List<CommunityMessage> replyList = communityMessageService.getListByReplyId(id);
        for (CommunityMessage c: replyList) {
            c.setReplyList(communityMessageService.getListByParentId(c.getId()));
            for (CommunityMessage cm:c.getReplyList()) {
                if(cm.getReplyMessageId().equals(cm.getParentId())){
                    cm.setReplyName("");
                }else {
                    cm.setReplyName(communityMessageService.getCommunityMessageById(cm.getReplyMessageId()).getName());
                }
            }
        }
        request.setAttribute("parentMessage",communityMessage);
        request.setAttribute("replyList", replyList);
        request.getRequestDispatcher("community.jsp").forward(request, response);
    }
}