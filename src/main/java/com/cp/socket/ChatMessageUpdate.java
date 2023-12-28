package com.cp.socket;


import com.cp.domain.ChatMessage;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint(value = "/ChatMessageUpdate") // 指定 WebSocket 的端点路径
public class ChatMessageUpdate {
    static Gson gson=new Gson();
    private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());
    @OnOpen
    public void onOpen(Session session) {
        sessions.add(session);
        System.out.println("WebSocket connection opened: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message,Session session) {
        JsonObject jsonObject = gson.fromJson(message, JsonObject.class);
        if(jsonObject.has("userId")){
            String userId=jsonObject.get("userId").getAsString();
            session.getUserProperties().put("userId", userId);
        }
        if(!jsonObject.has("userId")){
            notifyClientsAboutUpdate(message);
            System.out.println(URLEncoder.encode("收到新评论"));
        }
    }

    @OnClose
    public void onClose(Session session) {
        sessions.remove(session);
        System.out.println("WebSocket connection closed: " + session.getId());
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // 处理 WebSocket 错误事件
        System.err.println("WebSocket error occurred: " + throwable.getMessage());
    }
    public static void notifyClientsAboutUpdate(String message) {
        // 获取所有当前连接的会话（客户端）
        ChatMessage chatMessage = gson.fromJson(message, ChatMessage.class);
        for (Session session : sessions) {
            try {
                String sessionReceiverId = (String) session.getUserProperties().get("userId");
                if(chatMessage.getReceiverId().equals(sessionReceiverId)){
                    session.getBasicRemote().sendText(message);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

