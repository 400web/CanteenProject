<%--
  Created by IntelliJ IDEA.
  User: 11930
  Date: 2023/12/18
  Time: 0:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="css/dishReview.css">
    <title>菜品评价界面</title>
</head>
<script>
    const socket = new WebSocket('ws://' + window.location.host + '/canteenproject_war_exploded' + '/updatesDishReview');
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

        fetch('SubmitDishReviewServlet', {
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
<%--<div class="menu-item">--%>
<%--    <img src="${dish.image}" alt="">--%>
<%--    <div class="menu-item-details">--%>
<%--        <h3>菜名：${dish.name}</h3>--%>
<%--        <p>菜系: ${dish.cuisine}</p>--%>
<%--        <p>价格: ${dish.price}</p>--%>
<%--        <p>评分: ${dish.score}</p>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="container">

    <div class="dish-card">
        <img class="dish-image" src="${dish.image}" alt="菜品图片">
        <div class="dish-details">
            <p class="dish-name">菜名：${dish.name}</p>
            <p class="dish-info">菜系: ${dish.cuisine}</p>
            <p class="dish-info">价格: ${dish.price}</p>
            <p class="dish-info">评分: ${dish.score}</p>
        </div>
    </div>
<%--<div id="comments-section">--%>
<%--    <div class="comment" id="comment">--%>
<%--        <div class="comment-header">--%>
<%--            <span class="user-name">${dishReview.userName}</span>--%>
<%--            <span class="comment-time">${dishReview.comment}</span>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="comment-section">
        <h3>用户评论</h3>
        <c:forEach var="dishReview" items="${dishReviewList}">
        <div class="user-comment">
            <h3>${dishReview.name}</h3>
            <p>${dishReview.comment}</p>
        </div>
        </c:forEach>
        <!-- 可以继续添加更多评论 -->
    </div>
<%--    <label for="username" class="form-label">用户名：</label>--%>
<%--    <input type="text" id="username" name="username" class="form-control" required>--%>
    <div class="add-comment">
<%--    <label for="comment-content" class="form-label">评论内容：</label>--%>
    <textarea class="comment-textarea" placeholder="输入你的评论"></textarea>
    <button class="comment-button" onclick="submit(${dish.id})">发表评论</button>
    <!-- 添加更多评论 -->
    </div>
</div>
</body>
</html>
