
<%--
  Created by IntelliJ IDEA.
  User: 11930
  Date: 2023/12/22
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/comments.css">
    <title>用户评论列表</title>
</head>
<body>
<%--<div>--%>
<%--    <c:forEach var="dishReview" items="${dishReviewList}">--%>
<%--        <div>--%>

<%--        </div>--%>
<%--    </c:forEach>--%>
<%--</div>--%>
<%--<div>--%>
<%--    <c:forEach var="canteenReview" items="${canteenReviewList}">--%>
<%--        <div>--%>

<%--        </div>--%>
<%--    </c:forEach>--%>
<%--</div>--%>
<%--<div>--%>
<%--    <c:forEach var="communityMessageList" items="${communityMessageList}">--%>
<%--        <div>--%>

<%--        </div>--%>
<%--    </c:forEach>--%>
<%--</div>--%>
<h1>
    用户评论详细界面
</h1>
<div class="container">
    <div class="comment-section">
        <h2>用户${username}的所有食堂评论</h2>
        <c:forEach var="canteenReveiw" items="${canteenReviewList}">
            <div class="user-comment">
                <p>${canteenReveiw.name}:${canteenReveiw.comment}</p>
                <p>发表于${canteenReveiw.time}</p>
            </div>
        </c:forEach>
    </div>
    <div class="comment-section">
        <h2>用户${username}的所有菜品评论</h2>
        <c:forEach var="dishReveiw" items="${dishReviewList}">
            <div class="user-comment">
                <p>${dishReveiw.name}:${dishReveiw.comment}</p>
                <p>发表于${dishReveiw.time}</p>
            </div>
        </c:forEach>
    </div>
    <div class="comment-section">
        <h2>用户${username}的所有社区评论</h2>
        <c:forEach var="communityReveiw" items="${communityMessageList}">
            <div class="user-comment">
                <p>${communityReveiw.name}:${communityReveiw.content}</p>
                <p>发表于${communityReveiw.publishTime}</p>
            </div>
        </c:forEach>
    </div>
</div>
<style>
    h1 {
        color: #333;
        text-align: center;
        font-size: 3em;
        margin-bottom: 0.5em;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
    }
    h2 {
        color: #333;
        text-align: left;
        font-size: 1.5em;
        margin-bottom: 0.5em;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
    }
</style>
</body>
</html>
