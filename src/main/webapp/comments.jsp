<%--
  Created by IntelliJ IDEA.
  User: 11930
  Date: 2023/12/13
  Time: 1:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/comments.css">
    <title>评论页面</title>
</head>
<script>
    const socket = new WebSocket('ws://' + window.location.host + '/canteenproject_war_exploded' + '/updatesCanteenReview');
    socket.onopen = function () {
        console.log("socket连接成功");
    }
    socket.onerror = () => {
        console.log("socket连接错误");
    }
    socket.onmessage = function (ev) {
        console.log(ev.data);
        const message = JSON.parse(ev.data);
        console.log(message);
        addReviewToComment(message);
    }
    socket.onclose = function () {
        console.log("socket已关闭");
    }

    function addReviewToComment(message) {
        const comment = document.getElementById('comment');
        comment.classList.add("comment");
        const commentHeader = document.createElement('div');
        commentHeader.classList.add("comment-header");
        commentHeader.innerHTML = '<span className="user-name">' + message.name + '</span>' +
            '<span className="comment-time">' + message.comment + '</span>';
        comment.appendChild(commentHeader);
    }

    function submit(dishId) {
        const username = document.getElementById('username');
        const commentContent = document.getElementById('comment-content');

        const data = {
            username: username.value,
            'comment-content': commentContent.value,
            dishId: dishId
        };
        console.log(data);

        fetch('SubmitCanteenReviewServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('网络错误');
                }
                console.log('评论已提交');
                username.innerHTML = "";
                commentContent.innerHTML = "";
                commentContent.placeholder = "请输入";
                return response.json();
            })
            .then(data => {
                // 在这里处理从服务器返回的数据
                console.log('从服务器返回的数据:', data);
                socket.send(JSON.stringify(data));
            })
            .catch(error => {
                console.error('发生错误:', error);
            });
    }
</script>
<body>
<div>
    <h1>
        食堂评论区
    </h1>
</div>
<div class="container">
    <div class="comment-section">
        <c:forEach var="canteenReveiw" items="${canteenReviewList}">
            <div class="user-comment">
                <h3>${canteenReveiw.name}</h3>
                <p>${canteenReveiw.comment}</p>
            </div>
        </c:forEach>
        <!-- 可以继续添加更多评论 -->
    </div>
    <%--    <label for="username" class="form-label">用户名：</label>--%>
    <%--    <input type="text" id="username" name="username" class="form-control" required>--%>
    <div class="add-comment">
        <%--    <label for="comment-content" class="form-label">评论内容：</label>--%>
        <textarea class="comment-textarea" placeholder="输入你的评论"></textarea>
        <button class="comment-button" onclick="submit(${canteenid})">发表评论</button>
        <!-- 添加更多评论 -->
    </div>
</div>
</body>
</html>

