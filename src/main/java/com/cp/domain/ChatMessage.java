package com.cp.domain;

import lombok.*;

/**
 * 聊天信息表类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class ChatMessage {
    private String id;//信息id
    private String senderId; // 发送人id
    private String receiverId; // 接收人id
    private String sendTime; // 发送时间
    private String messageContent; // 发送内容

}
