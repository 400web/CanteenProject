<%--
  Created by IntelliJ IDEA.
  User: 11930
  Date: 2023/12/13
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <title>食堂界面</title>
</head>
<body>
<header>
    <div class="canteen-info">
        <h1>${canteenname}</h1>
        <p>运营时间: ${operatingHours}</p>
    </div>
    <p>${canteenDescription}</p>
</header>

<section id="announcements">
    <h2>活动公告</h2>
    <p>${activityAnnouncement}</p>
</section>

<!-- 在菜品栏中添加图片、菜名、菜系和价格 -->
<section id="menu">
    <h2>菜品栏</h2>
    <div id="scrollable-menu" class="menu-container">
        <div class="menu-column">
            <div class="menu-item">
                <img src="css/usst.jpg" alt="菜品1">
                <div class="menu-item-details">
                    <h3></h3>
                    <p>菜系: 川菜</p>
                    <p>价格: ¥20.00</p>
                </div>
            </div>

            <div class="menu-item">
                <img src="css/usst1.jpg" alt="菜品2">
                <div class="menu-item-details">
                    <h3>菜品2</h3>
                    <p>菜系: 粤菜</p>
                    <p>价格: ¥25.00</p>
                </div>
            </div>
            <div class="menu-item">
                <img src="css/usst1.jpg" alt="菜品2">
                <div class="menu-item-details">
                    <h3>菜品2</h3>
                    <p>菜系: 粤菜</p>
                    <p>价格: ¥25.00</p>
                </div>
            </div>
            <!-- 添加更多菜品 -->
        </div>

        <div class="menu-column">
            <div class="menu-item">
                <img src="css/usst.jpg" alt="菜品1">
                <div class="menu-item-details">
                    <h3>菜品1</h3>
                    <p>菜系: 川菜</p>
                    <p>价格: ¥20.00</p>
                </div>
            </div>

            <div class="menu-item">
                <img src="css/usst1.jpg" alt="菜品2">
                <div class="menu-item-details">
                    <h3>菜品2</h3>
                    <p>菜系: 粤菜</p>
                    <p>价格: ¥25.00</p>
                </div>
            </div>
            <div class="menu-item">
                <img src="css/usst1.jpg" alt="菜品2">
                <div class="menu-item-details">
                    <h3>菜品2</h3>
                    <p>菜系: 粤菜</p>
                    <p>价格: ¥25.00</p>
                </div>
            </div>
            <!-- 添加更多菜品 -->
        </div>
        <div class="menu-column">
            <!-- 第二列菜品 -->
            <div class="menu-item">
                <img src="css/usst.jpg" alt="菜品1">
                <div class="menu-item-details">
                    <h3>菜品1</h3>
                    <p>菜系: 川菜</p>
                    <p>价格: ¥20.00</p>
                </div>
            </div>

            <div class="menu-item">
                <img src="css/usst1.jpg" alt="菜品2">
                <div class="menu-item-details">
                    <h3>菜品2</h3>
                    <p>菜系: 粤菜</p>
                    <p>价格: ¥25.00</p>
                </div>
            </div>
            <div class="menu-item">
                <img src="css/usst1.jpg" alt="菜品2">
                <div class="menu-item-details">
                    <h3>菜品2</h3>
                    <p>菜系: 粤菜</p>
                    <p>价格: ¥25.00</p>
                </div>
            </div>
            <!-- 添加更多菜品 -->
        </div>
    </div>
</section>
<section id="comments">
    <h2>评论区</h2>
    <div id="comment-section">
        <div class="comment">评论1</div>
        <div class="comment">评论2</div>
        <a href="comments.jsp">查看更多评论</a>
    </div>
</section>
<%--<script src="script.js"></script>--%>
</body>
</html>


