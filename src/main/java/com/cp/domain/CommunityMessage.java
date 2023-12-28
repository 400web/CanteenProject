package com.cp.domain;

import lombok.*;

import java.util.List;

import static java.lang.Math.exp;

/**
 * 社区信息类，存储社区发布的信息。
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class CommunityMessage {
    private String id;// 社区信息ID
    private String publisherId; // 发布人ID
    private String name;//发布人名字
    private String publishTime; // 发布时间
    private long publishTimestamp;//发布时间戳
    private String title;//标题
    private String content; // 内容
    private int likes; // 点赞数
    private int comments; // 评论数
    private double hot;//热度
    private String replyMessageId; // 回复信息ID
    private String parentId;// 顶级评论ID
    private String replyName;
    private List<CommunityMessage> replyList;
    private boolean isLike;
    private int level;//发表人等级

    public void hotCompute() {
        long time = System.currentTimeMillis() - publishTimestamp;
        double timeScore = exp((double) time / 86400000);
        double likesScore = 2 * likes + 1;
        double commentsScore = 6 * comments + 1;
        this.hot = (likesScore + commentsScore) / timeScore;
    }

}
