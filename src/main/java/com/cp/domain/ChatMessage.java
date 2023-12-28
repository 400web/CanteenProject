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
public class ChatMessage implements Comparable<ChatMessage> {
    private String id;//信息id
    private String name;//发送人名字
    private String senderId; // 发送人id
    private String receiverId; // 接收人id
    private String sendTime; // 发送时间
    private long timestamp;//发送时间戳
    private String messageContent; // 发送内容

    @Override
    public int compareTo(ChatMessage o) {
        return Long.compare(this.timestamp, o.getTimestamp());
    }
}
