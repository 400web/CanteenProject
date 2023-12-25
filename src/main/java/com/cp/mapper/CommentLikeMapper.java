package com.cp.mapper;

import org.apache.ibatis.annotations.Param;

public interface CommentLikeMapper {
    Long selectLike(@Param("userId") String userId, @Param("commentId") String commentId);

    boolean addLike(@Param("userId") String userId, @Param("commentId") String commentId, @Param("timestamp") long timestamp);

    boolean deleteLike(@Param("userId") String userId, @Param("commentId") String commentId);
}
