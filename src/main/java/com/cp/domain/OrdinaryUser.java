package com.cp.domain;

import lombok.*;

/**
 * 普通用户类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class OrdinaryUser {
    private String id;// 用户ID
    private int loginTimes;// 登录次数
    private int evaluationTimes;// 评价次数
    private int communityInteractionTimes;// 社区交流次数
    private int level;// 用户等级
}
