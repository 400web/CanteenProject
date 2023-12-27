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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .flex-container {
            display: flex;
        }

         .flex-container h3 {
            margin-right: 20px; /* 可以根据需要设置间距 */
        }
    </style>
    <title>菜品评价界面</title>
</head>
<script>
    function submit(dishId) {
        const username = document.getElementById('username');
        const commentContent = document.getElementById('comment-content');

        const data = {
            name: username.value,
            comment: commentContent.value,
            dishId: dishId
        };

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
                return response.json();
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
            <%--            <p class="dish-info">评分: ${dish.score}</p>--%>
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
                <a href="userCommentsListServlet"><h3 class="flex-container">${dishReview.name}</h3></a>
                <p>发表于：${dishReview.time} </p>
                <p>内容： ${dishReview.comment}</p>
                <p class="comment-text" style="display: none">这是一条评论，得分：${dishReview.evaluationScore}</p>
                <p class="comment-stars"></p>
<%--                <p>${dishReview.score}</p>--%>
            </div>
        </c:forEach>
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

        <!-- 可以继续添加更多评论 -->
    </div>
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
<%--        <p id="selected-rating">选择的分数: </p>--%>
        <button class="comment-button" onclick="submit(${dish.id})">发表评论</button>
        <script>
            const stars = document.querySelectorAll('.fa-star');
            // const ratingOutput = document.getElementById('selected-rating');

            stars.forEach((star, index) => {
                star.addEventListener('click', () => {
                     score = index + 1;
                    // ratingOutput.textContent = '选择的分数: ' + score;

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
                color: gold; /* 点亮星星的颜色 */
            }
        </style>
        <!-- 添加更多评论 -->
    </div>
</div>
</body>
</html>
