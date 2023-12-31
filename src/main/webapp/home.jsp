<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dfydn92
  Date: 2023/12/23
  Time: 0:05
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生页面</title>
    <link rel="stylesheet" href=css/homePage.css>
    <link rel="stylesheet" href=css/home.css>
    <!-- 引入 Bootstrap 样式表 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <%--<script src="bootstrap/js/bootstrap.bundle.min.js"></script>--%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap-4.3.1.min.css">
    <script src="bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap-4.3.1.min.js"></script>
</head>
<body>
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to bottom, #fce4e4, #651616)">
    <a class="navbar-brand" href="#">USST食堂系统首页</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <span class="badge bg-primary">Lv.${oUser.level} ${user.username}</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="homeServlet">首页</a>
            </li>
            <li class="nav-item dropdown"> <!-- 添加 dropdown 类 -->
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    食堂
                </a>

                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <c:forEach var="oneCanteen" items="${navbarAllCanteen}">
                        <a class="dropdown-item" href="canteenServlet?id=${oneCanteen.id}">${oneCanteen.name}</a>
                    </c:forEach>
                </div>

            </li>
            <li class="nav-item dropdown"> <!-- 添加 dropdown 类 -->
                <a class="nav-link dropdown-toggle" href="#" id="naDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    社区
                </a>
                <div class="dropdown-menu" aria-labelledby="naDropdown">
                    <a class="dropdown-item" href="PostServlet">论坛</a>
                    <a class="dropdown-item" href="UserViewServlet">聊天室</a>
                </div>
            </li>
            <li class="nav-item dropdown"> <!-- 添加 dropdown 类 -->
                <a class="nav-link dropdown-toggle" href="#" id="nDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    检索
                </a>
                <div class="dropdown-menu" aria-labelledby="nDropdown">
                    <a class="dropdown-item" href="CanteenSearchServlet">食堂检索</a>
                     <a class="dropdown-item" href="DishSearchServlet">菜品检索</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="questionnaireServlet">问卷</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ComplaintViewServlet">投诉查看</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ViewUserDetailServlet">账号详情</a>
            </li>
        </ul>
    </div>
</nav>


<!-- 分隔线与标题 -->
<div class="container">
    <div class="section-divider" style="color: red">
        <div class="section-title" style="color: #960404; font-size: 24px;">活动公告！</div>
    </div>
</div>
<script>
    // 获取所有具有data-canteen属性的链接元素
    const canteenLinks = document.querySelectorAll('[data-canteen]');

    // 获取用于显示食堂的元素
    const canteenTitle = document.querySelector('.section-title');

    // 添加点击事件处理程序以更新食堂菜品位置的文本
    canteenLinks.forEach(link => {
        link.addEventListener('click', function (event) {
            event.preventDefault(); // 防止链接跳转

            // 获取所选食堂的值
            const selectedCanteen = this.getAttribute('data-canteen');

            // 更新食堂菜品位置的文本
            canteenTitle.textContent = "第" + selectedCanteen + "食堂";
        });
    });
</script>


<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="10000">
            <img src="css/food1.jpeg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>First slide label</h5>
                <p>Some representative placeholder content for the first slide.</p>
            </div>
        </div>
        <div class="carousel-item" data-bs-interval="2000">
            <img src="css/food3.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>Second slide label</h5>
                <p>Some </p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="css/food4.jpeg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>Third slide label</h5>
                <p>Some representative placeholder content for the third slide.</p>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>


<script>
    function switchContent(contentId) {
        document.getElementById("content1").style.display = (contentId === "content1") ? "block" : "none";
        document.getElementById("content2").style.display = (contentId === "content2") ? "block" : "none";
    }</script>


<div class="container1">
    <div class="container">
        <div class="section-divider" style="color: red">
            <div class="section-title" style="color: #960404; font-size: 24px;">USST热搜榜</div>
        </div>
    </div>
    <!-- 社区热门话题的内容 -->
    <div class="community-hot-topics">
        <h2 style="color: #8f2525">社区热门话题</h2>
        <div class="section-divider" style="color: #e57419"></div>
        <ul id="topicList">

        </ul>
    </div>

    <div class="canteen-rankings">
        <h2 style="color: #8f2525">食堂排名</h2>
        <div class="section-divider" style="color: #e57419"></div>
        <ul>

        </ul>
    </div>

    <div class="dish-rankings">
        <!-- 菜品排名的内容 -->
        <h2 style="color: #8f2525">菜品排名</h2>
        <div class="section-divider" style="color: #e57419"></div>
        <ul>

            <!-- 更多话题 -->
        </ul>
    </div>
</div>

<div class="outer-container">
    <div class="container3">
        <div class="container">
            <div class="section-divider" style="color: red">
                <div class="section-title1" style="color: #960404; font-size: 24px;">特价促销榜</div>
                <!-- 动态生成的菜品列表将放在这里 -->
                <ul class="dish-list"></ul>
            </div>
        </div>

    </div>
    <div class="container3">
        <div class="container">
            <div class="section-divider" style="color: red">
                <div class="section-title1" style="color: #960404; font-size: 24px;">最新投票调查</div>
                <!-- 动态生成的问卷列表将放在这里 -->
                <ul class="survey-list">
                    <li><a href="viewSurveyServlet?id=1">发广告广告</a></li>
                </ul>
            </div>
        </div>

    </div>
</div>

<div class="container2">
    <div class="container">
        <div class="section-divider1" style="color: red">
            <div class="section-title1" style="color: #960404; font-size: 24px;">菜品推荐榜</div>
        </div>
    </div>

    <section id="menu">
        <div id="scrollable-menu" class="menu-container">
            <c:forEach var="dish" items="${dishList}">
            <div class="menu-item">
                    <a href="dishReviewServlet?id=${dish.id}"> <img src="${dish.image}" alt=""></a>
                    <div class="menu-item-details">
                        <h3>菜名：${dish.name}</h3>
                        <p>菜系: ${dish.cuisine}</p>
                        <p>价格: ${dish.price}</p>
                    </div>
            </div>
            </c:forEach>>
        </div>
    </section>
</div>

<script>
    const lowPriceDishes = [
        <c:forEach var="dish" items="${lowDishes}" varStatus="status">
        {
            id: '<c:out value="${dish.id}"/>',
            name: '<c:out value="${dish.name}"/>',
            promotionPrice: '<c:out value="${dish.price}"/>'
        }<c:if test="${!status.last}">, </c:if>
        </c:forEach>
    ];

    const lowPriceDishList = document.querySelector('.container3 .dish-list');

    lowPriceDishes.forEach(dish => {
        const listItem = document.createElement('li');
        listItem.style.display = 'flex';
        listItem.style.justifyContent = 'space-between';
        listItem.innerHTML = `
            <span>` + dish.name + `</span>
            <span>` + dish.promotionPrice + `</span>
        `;
        lowPriceDishList.appendChild(listItem);
    });
</script>
<script>
    const surveys = [
        <c:forEach var="survey" items="${surveys}" varStatus="status">
        {
            name: '<c:out value="${survey.name}"/>',
            id: '<c:out value="${survey.id}"/>'
        }<c:if test="${!status.last}">, </c:if>
        </c:forEach>
    ];

    const surveyList = document.querySelector('.container3 .survey-list');

    surveys.forEach(survey => {
        const listItem = document.createElement('li');
        listItem.innerHTML = `<a href="viewSurveyServlet?id=` + survey.id + `">` + survey.name + `</a>`;
        surveyList.appendChild(listItem);
    });
</script>
<script>
    const dishes = [
        <c:forEach var="dish" items="${dishes}" varStatus="status">
        {
            name: '<c:out value="${dish.name}"/>',
            id: '<c:out value="${dish.id}"/>'
        }<c:if test="${!status.last}">, </c:if>
        </c:forEach>
    ];
    const dishList = document.querySelector('.dish-rankings ul');
    console.log(dishList);
    dishList.innerHTML = "";
    let startingPopularity = 90; // 起始热度值
    const decrement = 15; // 每个菜品之间的热度递减量
    dishes.slice(0, 5).forEach(dishName => {
        const listItem = document.createElement('li');
        listItem.innerHTML = `
        <a href="dishReviewServlet?id=` + dishName.id + `" class="topic">` + dishName.name + `</a>
        <span class="heat-bar" style="width: ` + startingPopularity + `;"></span>
        `;
        dishList.appendChild(listItem);

        startingPopularity -= decrement; // 更新热度值
    });
</script>
<script>
    const topics = [
        <c:forEach var="topic" items="${topics}" varStatus="status">
        {
            name: '<c:out value="${topic.title}"/>',
            id: '<c:out value="${topic.id}"/>'
        }<c:if test="${!status.last}">, </c:if>
        </c:forEach>
    ];
    let topicList = document.getElementById("topicList");
    // 接下来的操作
    console.log(topicList);
    topicList.innerHTML = "";
    let topicHeat = 90; // 起始热度值
    const topicDecrement = 15; // 每个话题之间的热度递减量

    topics.slice(0, 5).forEach(topic => {
        const listItem = document.createElement('li');
        listItem.innerHTML = `
            <a href="replyCommentServlet?id=` + topic.id + `" class="topic">` + topic.name + `</a>
            <span class="heat-bar" style="width: ` + topicHeat + `;"></span>
        `;
        topicList.appendChild(listItem);

        topicHeat -= topicDecrement; // 更新热度值
    });
</script>
<script>
    const canteens = [
        <c:forEach var="canteen" items="${canteens}" varStatus="status">
        {
            name: '<c:out value="${canteen.name}"/>',
            id: '<c:out value="${canteen.id}"/>'
        }<c:if test="${!status.last}">, </c:if>
        </c:forEach>
    ];
    const canteenList = document.querySelector('.canteen-rankings ul');
    canteenList.innerHTML = "";
    let canteenRank = 90; // 起始排名值
    const canteenDecrement = 15; // 每个食堂之间的排名递减量

    canteens.slice(0, 5).forEach(canteen => {
        const listItem = document.createElement('li');
        listItem.innerHTML = `
            <a href="canteenServlet?id=` + canteen.id + `" class="topic">` + canteen.name + `</a>
            <span class="heat-bar" style="width: ` + canteenRank + `;"></span>
        `;
        canteenList.appendChild(listItem);

        canteenRank -= canteenDecrement; // 更新排名值
    });
</script>
</body>
</html>



