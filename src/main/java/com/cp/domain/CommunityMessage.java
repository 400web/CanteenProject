package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

/**
 * 社区信息类，存储社区发布的信息。
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class CommunityMessage {
    private String communityMessageId;// 社区信息ID
    private String publisherId; // 发布人ID
    private String publishTime; // 发布时间
    private String content; // 内容
    private int likes; // 点赞数
    private int comments; // 评论数
    private String replyMessageId; // 回复信息ID
}
