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
    <style>
        .flex-container {
            display: flex;
        }

        .flex-container h3 {
            margin-right: 20px; /* 可以根据需要设置间距 */
        }
    </style>
    <title>评论页面</title>
</head>
<script>
    var score = 0;
    function submit(canteenId) {
        const commentContent = document.getElementById('comment-content');
        const data = {
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
                window.location.reload();
            })
            .catch(error => {
                console.error('发生错误:', error);
                window.location.reload();
            });
    }
</script>
<style>
    h1 {
        margin: 0;
        text-align: center;
        font-size: 3em;
        font-family: 'Georgia', serif; /* Example of a specific font */
        /*color: #ff0000; !* Orange color *!*/
    }
</style>
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
                <a href="userCommentsListServlet?username=${canteenReveiw.name}"><h3 class="flex-container">${canteenReveiw.name}</h3></a>
                <p>发表于：${canteenReveiw.time}</p>
                <p>内容：${canteenReveiw.comment}</p>
                <p class="comment-text" style="display: none">这是一条评论，得分：${canteenReveiw.evaluationScore}</p>
                <p class="comment-stars"></p>
            </div>
        </c:forEach>
        <!-- 可以继续添加更多评论 -->
    </div>
    <script>
        // 获取所有评论元素
        const comments = document.querySelectorAll('.user-comment');

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
        <textarea class="comment-textarea" id="comment-content" placeholder="输入你的评论"></textarea>
            <div id="star-rating" class="rating">
                <i class="fas fa-star" data-rating="1"></i>
                <i class="fas fa-star" data-rating="2"></i>
                <i class="fas fa-star" data-rating="3"></i>
                <i class="fas fa-star" data-rating="4"></i>
                <i class="fas fa-star" data-rating="5"></i>
            </div>
            <%--<p id="selected-rating">选择的分数: </p>--%>
        <button class="comment-button" onclick="submit(${canteenId})">发表评论</button>
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

