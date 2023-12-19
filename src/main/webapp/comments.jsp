<%--
  Created by IntelliJ IDEA.
  User: 11930
  Date: 2023/12/13
  Time: 1:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/comments-styles.css">
    <title>评论页面</title>
</head>
<body>
<div id="comments-section">
    <div class="comment">
        <div class="comment-header">
            <span class="user-name">用户1</span>
            <span class="comment-time">发表于：2023-01-01 12:00</span>
        </div>
<%--        <div class="comment-content">--%>
<%--            这是第一条评论的内容。别人给这条评论的回复将会在点击"显示回复"时展示。--%>
<%--            <button class="reply-button" onclick="toggleReplies(this)">显示回复</button>--%>
<%--            <div class="replies hidden">--%>
<%--                <div class="reply">--%>
<%--                    <span class="user-name">用户2</span>--%>
<%--                    <span class="comment-time">回复于：2023-01-01 12:05</span>--%>
<%--                    <div class="reply-content">这是对第一条评论的回复。</div>--%>
<%--                </div>--%>
<%--                <!-- 可添加更多回复 -->--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>

    <!-- 添加更多评论 -->

</div>

<div id="comment-form">
    <h3>发表评论</h3>
    <form action="#" method="post">
        <label for="user-name">用户名：</label>
        <input type="text" id="user-name" name="user-name" required>
        <label for="comment-content">评论内容：</label>
        <textarea id="comment-content" name="comment-content" required></textarea>
        <button type="submit">发表评论</button>
    </form>
</div>

<script src="javascript/comment-script.js"></script>
</body>
</html>

