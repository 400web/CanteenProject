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
</head>
<body>
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to bottom, #fce4e4, #651616)"  >
    <a class="navbar-brand" href="#">USST食堂系统首页</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="switchContent('content1');">首页</a>
            </li>
            <li class="nav-item dropdown"> <!-- 添加 dropdown 类 -->
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    食堂
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#canteen1" data-canteen="1">食堂1</a>
                    <a class="dropdown-item" href="#canteen2" data-canteen="2">食堂2</a>
                    <a class="dropdown-item" href="#canteen3" data-canteen="3">食堂3</a>
                    <!-- 添加更多食堂选项 -->
                </div>

            </li>
            <li class="nav-item">
                <a class="nav-link" href="#community">社区</a>
            </li>
            <%--            <li class="nav-item">--%>
            <%--                <a class="nav-link" href="#" onclick="switchContent('content2');">问卷</a>--%>
            <%--            </li>--%>
            <li class="nav-item">
                <a class="nav-link" href="questionnaireServlet">问卷</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#account-management">账号管理</a>
            </li>
        </ul>
    </div>
</nav>


<!-- 分隔线与标题 -->
<div class="container" >
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
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
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



<script>
    const topics = [
        '话题 A',
        '话题 B',
        '话题 C'
        // 更多话题
    ];

    const topicList = document.querySelector('.community-hot-topics ul');
    let topicHeat = 90; // 起始热度值
    const topicDecrement = 15; // 每个话题之间的热度递减量

    topics.slice(0, 5).forEach(topicName => {
        const listItem = document.createElement('li');
        listItem.innerHTML = `
        <span class="topic">${topicName}</span>
        <span class="heat-bar" style="width: ${topicHeat}%;"></span>
        `;
        topicList.appendChild(listItem);

        topicHeat -= topicDecrement; // 更新热度值
    });
</script>



<script>
    const canteens = [
        '食堂 A',
        '食堂 B',
        '食堂 C'
        // 更多食堂
    ];

    const canteenList = document.querySelector('.canteen-rankings ul');
    let canteenRank = 90; // 起始排名值
    const canteenDecrement = 15; // 每个食堂之间的排名递减量

    canteens.slice(0, 5).forEach(canteenName => {
        const listItem = document.createElement('li');
        listItem.innerHTML = `
        <span class="topic">${canteenName}</span>
        <span class="heat-bar" style="width: ${canteenRank}%;"></span>
        `;
        canteenList.appendChild(listItem);

        canteenRank -= canteenDecrement; // 更新排名值
    });
</script>


<script>
    const dishes = [
        { name: '菜品 A', popularity: 95 },
        { name: '菜品 B', popularity: 90 },
        { name: '菜品 C', popularity: 85 }
        // 更多菜品
    ];

    const dishList = document.querySelector('.dish-rankings ul');

    let startingPopularity = 90; // 起始热度值
    const decrement = 15; // 每个菜品之间的热度递减量

    dishesFromBackend.slice(0, 5).forEach(dishName => {
        const listItem = document.createElement('li');
        listItem.innerHTML = `
        <span class="topic">${dishName}</span>
        <span class="heat-bar" style="width: ${startingPopularity}%;"></span>
        `;
        dishList.appendChild(listItem);

        startingPopularity -= decrement; // 更新热度值
    });
</script>


<div class="container1">
    <div class="container" >
        <div class="section-divider" style="color: red">
            <div class="section-title" style="color: #960404; font-size: 24px;">USST热搜榜</div>
        </div>
    </div>
        <!-- 社区热门话题的内容 -->
        <div class="community-hot-topics">
            <h2 style="color: #8f2525">社区热门话题</h2>
            <div class="section-divider" style="color: #e57419"></div>
            <ul>
<%--ABC是示例效果，真实数据从script里面找传来--%>
                <li>
                    <span class="topic">话题 A</span>
                    <span class="heat-bar" style="width: 80%;"></span>
                </li>
                <li>
                    <span class="topic">话题 B</span>
                    <span class="heat-bar" style="width: 70%;"></span>
                </li>
                <li>
                    <span class="topic">话题 C</span>
                    <span class="heat-bar" style="width: 60%;"></span>
                </li>
                <!-- 更多话题 -->
            </ul>
        </div>

    <div class="canteen-rankings">
        <h2 style="color: #8f2525">食堂排名</h2>
        <div class="section-divider" style="color: #e57419"></div>
        <ul>
            <li>
                <span class="topic">食堂A</span>
                <span class="heat-bar" style="width: 80%;"></span>
            </li>
            <li>
                <span class="topic">食堂B</span>
                <span class="heat-bar" style="width: 70%;"></span>
            </li>
            <li>
                <span class="topic">食堂C</span>
                <span class="heat-bar" style="width: 60%;"></span>
            </li>
            <!-- 更多话题 -->
        </ul>
    </div>

    <div class="dish-rankings">
        <!-- 菜品排名的内容 -->
        <h2 style="color: #8f2525">菜品排名</h2>
        <div class="section-divider" style="color: #e57419"></div>
        <ul>
            <li>
                <span class="topic">菜品A</span>
                <span class="heat-bar" style="width: 80%;"></span>
            </li>
            <li>
                <span class="topic">菜品B</span>
                <span class="heat-bar" style="width: 70%;"></span>
            </li>
            <li>
                <span class="topic">菜品C</span>
                <span class="heat-bar" style="width: 60%;"></span>
            </li>
            <!-- 更多话题 -->
        </ul>
    </div>
</div>

<div class="container2">
    <div class="container" >
        <div class="section-divider" style="color: red">
            <div class="section-title" style="color: #960404; font-size: 24px;">菜品推荐榜</div>
        </div>
    </div>

<section id="menu">
    <div id="scrollable-menu" class="menu-container">
        <div class="menu-item" >
            <c:forEach var="dish" items="${dishList}">
                <a href="dishReviewServlet?id=${dish.id}"> <img src="${dish.image}" alt=""></a>
                <div class="menu-item-details">
                    <h3>菜名：${dish.name}</h3>
                    <p>菜系: ${dish.cuisine}</p>
                    <p>价格: ${dish.price}</p>
                </div>
            </c:forEach>>
        </div>

        <div class="menu-item">
            <img src="css/food1.jpeg" alt="菜品图片">
            <div class="menu-item-details">
                <h3>菜名：红烧肉</h3>
                <p>菜系: 川菜</p>
                <p>价格: 30元</p>
            </div>
        </div>
        <div class="menu-item">
            <img src="css/food1.jpeg" alt="菜品图片">
            <div class="menu-item-details">
                <h3>菜名：宫保鸡丁</h3>
                <p>菜系: 川菜</p>
                <p>价格: 35元</p>
            </div>
        </div>
        <div class="menu-item">
            <img src="css/food1.jpeg" alt="菜品图片">
            <div class="menu-item-details">
                <h3>菜名：宫保鸡丁</h3>
                <p>菜系: 川菜</p>
                <p>价格: 35元</p>
            </div>
        </div>
    </div>
</section>
</div>

<!-- 分页栏 -->
<nav aria-label="Page navigation example" class="col-md-12">
    <ul class="pagination justify-content-center">
        <li class="page-item disabled">
            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
            <a class="page-link" href="#">Next</a>
        </li>
    </ul>
</nav>


<!-- 引入Bootstrap的JavaScript库 -->
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>



