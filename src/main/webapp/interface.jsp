<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cp.service.impl.CanteenServiceImpl" %>
<%@ page import="com.cp.domain.Canteen" %>
<%@ page import="com.cp.service.impl.DishServiceImpl" %>
<%@ page import="com.cp.domain.Dish" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cp.service.DishService" %>
<%@ page import="com.cp.service.impl.CanteenReviewServiceImpl" %>
<%@ page import="com.cp.domain.CanteenReview" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <title>食堂界面</title>
</head>
<body>
<% String id=(String) session.getAttribute("canteenId");
    CanteenServiceImpl canteenService=new CanteenServiceImpl();
    Canteen canteen=canteenService.getCanteenById(id);
    String name=canteen.getName();
    String openTime=canteen.getOpenTime();
    String closeTime=canteen.getCloseTime();
    String introduction=canteen.getIntroduction();
    String activity=canteen.getActivity();
    session.setAttribute("canteen",canteen);
    session.setAttribute("name",name);
    session.setAttribute("openTime",openTime);
    session.setAttribute("closeTime",closeTime);
    session.setAttribute("introduction",introduction);
    session.setAttribute("activity",activity);
%>
<header>
    <div class="canteen-info">
        <h1>${name}</h1>
        <p>: 开始营业时间：${openTime} 结束营业时间:${closeTime}</p>
    </div>
    <p>${introduction}}</p>
</header>
<section id="announcements">
    <h2>活动公告</h2>
    <p>${activity}</p>
</section>

<!-- 在菜品栏中添加图片、菜名、菜系和价格 -->
<%
    DishServiceImpl dishService=new DishServiceImpl();
    List<Dish> dishList=dishService.getDishesByCanteenId(id);
    session.setAttribute("dishList",dishList);
%>

<section id="menu">
    <h2>菜品栏</h2>
    <div id="scrollable-menu" class="menu-container">
            <div class="menu-item" >
                <c:forEach var="dish" items="${dishList}">
                    <img src="${dish.image}" alt="${dish.name}">
                <div class="menu-item-details">
                    <h3></h3>
                    <p>菜系: ${dish.cuisine}</p>
                    <p>价格: ${dish.price}</p>
                </div>
                </c:forEach>>
            </div>

<%--            <div class="menu-item">--%>
<%--                <img src="css/usst1.jpg" class="menu-item img" alt="菜品2">--%>
<%--                <div class="menu-item-details">--%>
<%--                    <h3>菜品2</h3>--%>
<%--                    <p>菜系: 粤菜</p>--%>
<%--                    <p>价格: ¥25.00</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="menu-item">--%>
<%--                <img src="css/usst1.jpg" class="menu-item img" alt="菜品2">--%>
<%--                <div class="menu-item-details">--%>
<%--                    <h3>菜品2</h3>--%>
<%--                    <p>菜系: 粤菜</p>--%>
<%--                    <p>价格: ¥25.00</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--    <div class="menu-item">--%>
<%--        <img src="css/usst1.jpg" alt="菜品2">--%>
<%--        <div class="menu-item-details">--%>
<%--            <h3>菜品2</h3>--%>
<%--            <p>菜系: 粤菜</p>--%>
<%--            <p>价格: ¥25.00</p>--%>
<%--        </div>--%>
<%--    </div>--%>
    </div>
</section>
<%CanteenReviewServiceImpl canteenReviewService=new CanteenReviewServiceImpl();
List<CanteenReview> camteenReviewList= canteenReviewService.getReviewsByCanteenId(id);
session.setAttribute("canteenReviewList",camteenReviewList);
%>
<section id="comments">
    <h2>评论区</h2>
<%--    <c:forEach var="review" items="${canteenReviewList}">--%>
    <div id="comment-section">
        <div class="comment">${canteenReviewList[0].evaluatorId}+${canteenReviewList[0].id}</div>
        <div class="comment">${canteenReviewList[1].evaluatorId}+${canteenReviewList[1].id}</div>
        <a href="comments.jsp">查看更多评论</a>
    </div>
<%--    </c:forEach>--%>
</section>
<%--<script src="script.js"></script>--%>
</body>
</html>