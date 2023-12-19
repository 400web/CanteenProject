<%--
  Created by IntelliJ IDEA.
  User: 11930
  Date: 2023/12/18
  Time: 0:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
<div class="menu-item">
    <img src="${dish.image}" alt="">
    <div class="menu-item-details">
        <h3>菜名：${dish.name}</h3>
        <p>菜系: ${dish.cuisine}</p>
        <p>价格: ${dish.price}</p>
        <p>评分: ${dish.score}</p>
    </div>
</div>
<div id="comments-section">
    <div class="comment" id="comment">
        <div class="comment-header">
            <span class="user-name">${dishReview.userName}</span>
            <span class="comment-time">${dishReview.comment}</span>
        </div>
    </div>
<%--    <label for="username" class="form-label">用户名：</label>--%>
<%--    <input type="text" id="username" name="username" class="form-control" required>--%>
    <label for="comment-content" class="form-label">评论内容：</label>
    <textarea id="comment-content" name="comment-content" class="form-control" required></textarea>
    <button id="submit-comment" class="btn btn-success" onclick="submit(${dish.id})">发表评论</button>
    <!-- 添加更多评论 -->
</div>
</body>
</html>
