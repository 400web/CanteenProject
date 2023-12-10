package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

/**
 * 普通用户类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class OrdinaryUser {
    private String userId;// 用户ID
    private int loginTimes;// 登录次数
    private int evaluationTimes;// 评价次数
    private int communityInteractionTimes;// 社区交流次数
    private int userLevel;// 用户等级
}
