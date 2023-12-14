package com.cp.domain;

import lombok.*;

/**
 * 公告类，存储公告信息。
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class Announcement {
    private String id;//公告ID
    private String publisherId; // 发布人ID
    private String title; // 标题
    private String publishTime; // 发布时间
    private String content; // 内容
}
