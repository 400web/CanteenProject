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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <title>评论页面</title>
</head>
<script>
    var score=null;
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

    function submit(canteenId) {
        const username = document.getElementById('username');
        const commentContent = document.getElementById('comment-content');

        const data = {
            name: username.value,
            comment: commentContent.value,
            canteenId: canteenId,
            evaluationScore:score
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
                <p class="comment-text" style="display: none">这是一条评论，得分：${canteenReveiw.score}</p>
                <p class="comment-stars"></p>
            </div>
        </c:forEach>
        <!-- 可以继续添加更多评论 -->
    </div>
    <script>
        // 获取所有评论元素
        const comments = document.querySelectorAll('.comment-section');

        // 映射分数到星值的函数
        function mapScoreToStars(score) {
            const starCount = Math.round(score); // 假设每颗星1分
            return '★'.repeat(starCount) + '☆'.repeat(5 - starCount);
        }

        // 遍历每个评论元素
        comments.forEach(comment => {
            // 获取评论元素中的得分值
            const score = parseInt(comment.querySelector('.comment-text').textContent.match(/\d+/)[0]);

            // 创建星值的 HTML 并插入评论元素中
            const starsHTML = mapScoreToStars(score);
            comment.querySelector('.comment-stars').innerHTML = starsHTML;
        });
    </script>
    <%--    <label for="username" class="form-label">用户名：</label>--%>
    <%--    <input type="text" id="username" name="username" class="form-control" required>--%>
    <div class="add-comment">
        <%--    <label for="comment-content" class="form-label">评论内容：</label>--%>
        <textarea class="comment-textarea" placeholder="输入你的评论"></textarea>
            <div id="star-rating" class="rating">
                <i class="fas fa-star" data-rating="1"></i>
                <i class="fas fa-star" data-rating="2"></i>
                <i class="fas fa-star" data-rating="3"></i>
                <i class="fas fa-star" data-rating="4"></i>
                <i class="fas fa-star" data-rating="5"></i>
            </div>
            <%--<p id="selected-rating">选择的分数: </p>--%>
        <button class="comment-button" onclick="submit(${canteen.id})">发表评论</button>
            <script>
                const stars = document.querySelectorAll('.fa-star');
                /*const ratingOutput = document.getElementById('selected-rating');*/

                stars.forEach((star, index) => {
                    star.addEventListener('click', () => {
                        score = index + 1;
                        /*ratingOutput.textContent = '选择的分数: ' + score;*/

                        // 将点击的星星及之前的星星添加 'selected' 类，通过 CSS 控制样式
                        stars.forEach((s, i) => {
                            if (i <= index) {
                                s.classList.add('selected');
                            } else {
                                s.classList.remove('selected');
                            }
                        });
                    });
                });
            </script>
            <style>
                .fa-star.selected {
                    color: gold;  /* 点亮星星的颜色 */
                }
            </style>
    </div>
</div>
</body>
</html>

