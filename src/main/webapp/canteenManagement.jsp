<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dfydn92
  Date: 2023/12/24
  Time: 0:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>账号管理</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f0f0;
        }
        .navbar {
            background: linear-gradient(to bottom, #fce4e4, #651616);
            border-bottom: 1px solid #dee2e6;
        }
        .navbar-brand {
            font-weight: bold;
            color: #ffffff;
        }
        .nav-link {
            color: #ffffff;
        }
        /* 添加自定义的样式 */
        .account-wrapper {
            display: flex;
            height: 100vh; /* 100%视窗高度 */
            padding: 20px 0; /* 上下留白为 20px，左右留白为 0 */
        }

        .nav-column {
            flex: 0 0 auto;
            width: max-content;
            background-color: #f0f0f0;
            padding: 20px;
            border-radius: 8px;
            margin-right: 20px; /* 右边留白 */
        }

        .content-column {
            flex: 1;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9; /* 背景色 */
        }

        .account-nav {
            list-style-type: none;
            padding-left: 0;
        }

        .account-nav li {
            margin-bottom: 10px;
        }

        .account-nav li a {
            text-decoration: none;
            color: black;
            display: block;
            padding: 10px 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .account-nav li a:hover {
            color: blue;
            background-color: #e0e0e0;
        }

        .account-section {
            display: none;
            padding: 20px;
        }

        .account-section.active {
            display: block;
        }

        .account-list h2 {
            margin-bottom: 20px;
        }

        .account-list ul {
            list-style: none;
            padding-left: 0;
        }

        .account-list ul li {
            margin-bottom: 10px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .btn {
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .btn-margin {
            margin-right: 5px;
        }

        .dish-image {
            width: 100px;  /* 定义固定宽度 */
            height: 100px; /* 定义固定高度 */
            object-fit: cover; /* 确保图片保持其宽高比 */
        }
        .status-processed {
            color: green;
        }
        .status-unprocessed {
            color: red;
        }
    </style>
</head>

<body>
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">系统管理员</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="SdFirstPageServlet">首页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#complaints">投诉信息</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#community">社区</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="account-management.jsp">账号管理</a>
            </li>
        </ul>
    </div>
</nav>


<!-- 我的账号和用户管理部分 -->
<div class="container-fluid mt-4">
    <div class="row account-wrapper">
        <!-- 左侧导航栏 -->
        <div class="col-md-1 nav-column">
            <ul class="account-nav">
                <li><a href="#canteenMessage" class="account-link">食堂信息维护</a></li>
                <li><a href="#foods" class="account-link">菜品管理</a></li>
                <li><a href="#complaints" class="account-link">投诉处理</a></li>
            </ul>
        </div>


        <!-- 右侧内容 -->
        <div class="col-md-11 content-column">
            <!-- 食堂部分 -->
            <section id="canteenMessage" class="account-section active">
                <!-- 表格 -->
                <div class="container mt-4">
                    <h2>食堂信息维护</h2>
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <th scope="row">食堂名称</th>
                            <td><span id="canteenName">${canteen.name}</span></td>
                        </tr>
                        <tr>
                            <th scope="row">活动</th>
                            <td><span id="canteenActivity">${canteen.activity}</span></td>
                        </tr>
                        <tr>
                            <th scope="row">简介</th>
                            <td><span id="canteenDescription">${canteen.introduction}</span></td>
                        </tr>
                        <tr>
                            <th scope="row">营业时间</th>
                            <td><span id="canteenHours">${canteen.openingTime}-${canteen.closingTime} </span></td>
                        </tr>
                        </tbody>
                    </table>
                    <!-- 修改按钮，触发模态框 -->
                    <button id="modifyCanteenBtn" class="btn btn-primary" data-toggle="modal" data-target="#modifyCanteenModal">修改</button>
                </div>
            </section>

            <div class="modal fade" id="modifyCanteenModal" tabindex="-1" role="dialog" aria-labelledby="modifyCanteenModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modifyCanteenModalLabel">修改食堂信息</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- 修改食堂信息的表单 -->
                            <form id="modifyCanteenForm">
                                <div class="form-group">
                                    <label for="newCanteenName">新食堂名称</label>
                                    <input type="text" class="form-control" id="newCanteenName">
                                </div>
                                <div class="form-group">
                                    <label for="newCanteenActivity">活动</label>
                                    <input type="text" class="form-control" id="newCanteenActivity">
                                </div>
                                <div class="form-group">
                                    <label for="newCanteenDescription">新简介</label>
                                    <input type="text" class="form-control" id="newCanteenDescription">
                                </div>
                                <div class="form-group">
                                    <label for="newOpeningTime">新开门时间</label>
                                    <input type="text" class="form-control" id="newOpeningTime">
                                </div>
                                <div class="form-group">
                                    <label for="newClosingTime">新关门时间</label>
                                    <input type="text" class="form-control" id="newClosingTime">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="saveCanteenChanges">保存更改</button>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    // 监听保存更改按钮点击事件
                    document.getElementById('saveCanteenChanges').addEventListener('click', function() {
                        // 获取修改后的食堂信息
                        var newCanteenId = `${canteen.id}`;
                        var newCanteenName = document.getElementById('newCanteenName').value;
                        var newCanteenActivity = document.getElementById('newCanteenActivity').value;
                        var newCanteenDescription = document.getElementById('newCanteenDescription').value;
                        var newOpeningTime = document.getElementById('newOpeningTime').value;
                        var newClosingTime = document.getElementById('newClosingTime').value;

                        console.log(newCanteenId);
                        // document.getElementById('newCanteenName').value = dishId;
                        // 创建AJAX请求发送数据到服务器
                        var xhr = new XMLHttpRequest();
                        xhr.open("POST", "changeCanteenServlet", true); // 修改为您的服务器端接口
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                        xhr.onreadystatechange = function() {
                            if (xhr.readyState == 4 && xhr.status == 200) {
                                // 请求成功后的处理
                                // 此处应根据您的需求进行调整，例如更新页面上的食堂信息
                                document.getElementById('canteenName').textContent = newCanteenName;
                                document.getElementById('canteenDescription').textContent = newCanteenDescription;
                                document.getElementById('canteenActivity').textContent = newCanteenActivity;
                                document.getElementById('canteenHours').textContent = newOpeningTime + ' - ' + newClosingTime;

                                // 关闭模态框
                                $('#modifyCanteenModal').modal('hide');
                            }
                        };

                        var data =
                            "id="+encodeURIComponent(newCanteenId)+
                            "&name=" + encodeURIComponent(newCanteenName) +
                            "&activity=" + encodeURIComponent(newCanteenActivity) +
                            "&description=" + encodeURIComponent(newCanteenDescription) +
                            "&openingTime=" + encodeURIComponent(newOpeningTime) +
                            "&closingTime=" + encodeURIComponent(newClosingTime);

                        xhr.send(data);
                    });
                });

            </script>



            <!-- 菜品管理部分 -->
            <section id="foods" class="account-section">
                <h2 class="mb-4">菜品管理</h2>

                <!-- 搜索框 -->
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="输入菜品名称进行搜索" id="searchInput">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="searchButton">搜索</button>
                    </div>
                </div>

                <!-- 菜品列表表格 -->
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <th>菜品名称</th>
                        <th>图片</th>
                        <th>简介</th>
                        <th>价格</th>
                        <th>菜系</th>
                        <th>是否推荐</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="dishes">
                    <!-- 动态添加的菜品列表 -->
                    <jsp:useBean id="dishes" scope="request" type="java.util.List"/>

                    <c:forEach var="dish" items="${dishes}">
                        <script>console.log('菜品ID:', ${dish.id});</script>--%>
                        <tr id="dishRow_${dish.id}">
                            <td id="dishName_${dish.id}">${dish.name}</td>
                            <td id="dishImageCell_${dish.id}"><img src="${dish.image}" alt="菜品图片" class="dish-image" id="dishImage_${dish.id}"/></td>
                            <td id="dishIntroduction_${dish.id}">${dish.introduction}</td>
                            <td id="dishPrice_${dish.id}">${dish.price}</td>
                            <td id="dishCuisine_${dish.id}">${dish.cuisine}</td>
                            <td id="dishRecommended_${dish.id}">${dish.recommend ? '推荐' : '不推荐'}</td>
                            <td id="dishActions_${dish.id}">
                                <div class="btn-group">
                                    <button class="btn btn-info btn-sm btn-margin editDishButton" data-id="${dish.id}" data-toggle="modal" data-target="#editDishModal_${dish.id}" onclick="editDish(this)" id="editButton_${dish.id}">编辑</button>
                                    <button class="btn btn-danger btn-sm deleteDishButton" data-id="${dish.id}"  id="deleteButton_${dish.id}">删除</button>
                                </div>
                            </td>
                        </tr>


                        <!-- 编辑菜品的模态框 -->
                        <div class="modal fade" id="editDishModal_${dish.id}" tabindex="-1" role="dialog" aria-labelledby="editDishModalLabel_${dish.id}" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editDishModalTitle_${dish.id}">编辑菜品信息</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="editDishCloseButton_${dish.id}">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="editDishForm_${dish.id}">
                                            <input type="hidden" id="editDishId_${dish.id}">
                                            <div class="form-group">
                                                <label for="editDishName_${dish.id}">菜品名称</label>
                                                <input type="text" class="form-control" id="editDishName_${dish.id}">
                                            </div>
                                            <div class="form-group">
                                                <label for="editDishDescription_${dish.id}">简介</label>
                                                <input type="text" class="form-control" id="editDishDescription_${dish.id}">
                                            </div>
                                            <div class="form-group">
                                                <label for="editDishPrice_${dish.id}">价格</label>
                                                <input type="number" class="form-control" id="editDishPrice_${dish.id}">
                                            </div>
                                            <div class="form-group">
                                                <label for="editDishCuisine_${dish.id}">菜系</label>
                                                <input type="text" class="form-control" id="editDishCuisine_${dish.id}">
                                            </div>
                                            <div class="form-group">
                                                <label for="editDishRecommended_${dish.id}">是否推荐</label>
                                                <select class="form-control" id="editDishRecommended_${dish.id}">
                                                    <option value="推荐">推荐</option>
                                                    <option value="不推荐">不推荐</option>
                                                </select>
                                            </div>

                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="editDishCancelButton_${dish.id}">关闭</button>
                                        <button type="button" class="btn btn-primary saveDishChangesButton" data-id="${dish.id}" id="editDishSaveButton_${dish.id}">保存更改</button>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </tbody>
                </table>


                <!-- 触发添加菜品模态框的按钮 -->
                <button class="btn btn-success" data-toggle="modal" data-target="#addDishModal">添加菜品</button>
                <!-- 添加菜品的模态框 -->

            </section>

            <!-- 添加菜品的模态框 -->
            <div class="modal fade" id="addDishModal" tabindex="-1" role="dialog" aria-labelledby="addDishModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addDishModalLabel">添加菜品</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form id="addDishForm" action="addDishServlet" method="post" enctype="multipart/form-data">

                        <div class="modal-body">

                                 <div class="form-group">
                                    <label for="addDishName">菜品名称</label>
                                    <input type="text" class="form-control" id="addDishName" name="name">
                                </div>
                                <div class="form-group">
                                    <label for="dishImageInput">菜品图片</label>
                                    <input type="file" class="form-control-file" id="dishImageInput" name="image">
                                </div>
                                <div class="form-group">
                                    <label for="addDishDescription">简介</label>
                                    <input type="text" class="form-control" id="addDishDescription" name="description">
                                </div>
                                <div class="form-group">
                                    <label for="addDishPrice">价格</label>
                                    <input type="number" class="form-control" id="addDishPrice" name="price">
                                </div>
                                <div class="form-group">
                                    <label for="addDishCuisine">菜系</label>
                                    <input type="text" class="form-control" id="addDishCuisine" name="cuisine">
                                </div>
                                <div class="form-group">
                                <label for="addDishRecommended">是否推荐</label>
                                <select class="form-control" id="addDishRecommended" name="recommend">
                                    <option value="推荐">推荐</option>
                                    <option value="不推荐">不推荐</option>
                                </select>
                               </div>
                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-success" id="addDishSaveButton">保存添加</button>
                        </div>

                        </form>

                    </div>
                </div>
            </div>

            <!-- 投诉处理部分 -->
            <section id="complaints" class="account-section">
                <h2 class="mb-4">投诉处理</h2>

                <!-- 投诉列表表格 -->
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <th>投诉人姓名</th>
                        <th>投诉时间</th>
                        <th>投诉内容</th>
                        <th>投诉反馈</th>
<%--                        <th>回复信息</th>--%>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="complaintList">
                    <!-- 动态添加的投诉列表 -->
                    <jsp:useBean id="complaints" scope="request" type="java.util.List"/>

                    <c:forEach var="complaint" items="${complaints}">
                        <script>
                            console.log(${complaints})
                        </script>
                        <tr id="complaintRow_${complaint.id}">
                            <td id="complainantName_${complaint.id}">${complaint.name}</td>
                            <td id="complaintTime_${complaint.id}">${complaint.complainTime}</td>
                            <td id="complaintContent_${complaint.id}">${complaint.complaintInfo}</td>
<%--                            <td id="complaintFeedback_${complaint.id}">${complaint.feedback ? '已处理' : '未处理'}</td>--%>
                            <td id="complaintFeedback_${complaint.id}" class="${complaint.feedback == '已处理' ? 'status-processed' : 'status-unprocessed'}">
                                    ${complaint.feedback ? '已处理' : '未处理'}
                            </td>

                            <td>
                                <button class="btn btn-primary btn-sm respondToComplaintButton" data-id="${complaint.id}" data-toggle="modal" data-target="#respondToComplaintModal_${complaint.id}">回复</button>
                            </td>
                        </tr>
                        <tr id="responseRow_${complaint.id}" style="display: none;">
                            <td colspan="5">
                                <strong>回复内容:</strong>
                                <span id="responseInfo_${complaint.id}">${complaint.responseInfo}</span>
                            </td>
                         </tr>

                        <!-- 回复投诉的模态框 -->
                        <div class="modal fade" id="respondToComplaintModal_${complaint.id}" tabindex="-1" role="dialog" aria-labelledby="respondToComplaintModalLabel_${complaint.id}" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">回复投诉</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- 显示投诉内容 -->
                                        <div class="form-group">
                                            <label>投诉内容</label>
                                            <textarea class="form-control" readonly>${complaint.complaintInfo}</textarea>
                                        </div>
                                        <form id="respondToComplaintForm_${complaint.id}">
                                            <div class="form-group">
                                                <label for="responseText_${complaint.id}">回复内容</label>
                                                <textarea class="form-control" id="responseText_${complaint.id}" rows="3"></textarea>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                        <button type="button" class="btn btn-primary" onclick="submitComplaintResponse(${complaint.id})">提交回复</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </tbody>
                </table>
            </section>

            <script>
                // 提交投诉回复
                function submitComplaintResponse(complaintId) {
                    var responseText = document.getElementById('responseText_' + complaintId).value;

                    // 创建AJAX请求发送数据到服务器
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "replyComplaintServlet", true); // 修改为您的服务器端接口
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                    xhr.onreadystatechange = function() {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            // 请求成功后的处理
                            // 确保回复行可见
                            var responseRow = document.getElementById('responseRow_' + complaintId);
                            responseRow.style.display = 'table-row';
                            // 更新页面上的投诉信息
                            document.getElementById('complaintFeedback_' + complaintId).textContent = '已处理';
                            document.getElementById('responseInfo_' + complaintId).textContent = responseText;



                            // 清空回复文本框并关闭模态框
                            document.getElementById('responseText_' + complaintId).value = '';
                            $('#respondToComplaintModal_' + complaintId).modal('hide');
                        }
                    };

                    var data = "id=" + encodeURIComponent(complaintId) +
                        "&response=" + encodeURIComponent(responseText);
                    xhr.send(data);
                }


            </script>





        </div>
    </div>
</div>

<!-- 引入Bootstrap的JavaScript库和jQuery -->
<script src="bootstrap/js/jquery-3.5.1.slim.min.js"></script>
<script src="bootstrap/js/bootstrap-4.5.2.min.js"></script>
<script>
    // JavaScript 代码来处理点击切换
    $(document).ready(function() {
        $('.account-link').click(function() {
            var target = $(this).attr('href');
            $('.account-section').removeClass('active');
            $(target).addClass('active');
        });
    });
</script>

<script>
    function editDish(button) {
        var dishId = button.getAttribute('data-id'); // 获取菜品ID
        console.log(dishId);

        // 获取行中的数据
        var row = document.getElementById('dishRow_' + dishId);
        var dishName = document.getElementById('dishName_' + dishId).textContent;
        var dishImage = document.getElementById('dishImageCell_' + dishId).src;
        var dishIntroduction = document.getElementById('dishIntroduction_' + dishId).textContent;
        var dishPrice = document.getElementById('dishPrice_' + dishId).textContent;
        var dishCuisine = document.getElementById('dishCuisine_' + dishId).textContent;
        var dishRecommended = document.getElementById('dishRecommended_' + dishId).textContent;


// 填充编辑模态框的表单字段
        document.getElementById('editDishId_' + dishId).value = dishId;
        document.getElementById('editDishName_' + dishId).value = dishName;
        // document.getElementById('editDishImage').value = dishImage; // 如果需要编辑图片URL
        document.getElementById('editDishDescription_' + dishId).value = dishIntroduction;
        document.getElementById('editDishPrice_' + dishId).value = dishPrice;
        document.getElementById('editDishCuisine_' + dishId).value = dishCuisine;
        document.getElementById('editDishRecommended_' + dishId).value = dishRecommended ;
        // 显示模态框

        $('#editDishModal_' + dishId).modal('show');
    }

    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.saveDishChangesButton').forEach(function(saveButton) {
            saveButton.addEventListener('click', function() {
                var dishId = this.getAttribute('data-id');
                var dishName = document.getElementById('editDishName_' + dishId).value;
                var dishDescription = document.getElementById('editDishDescription_' + dishId).value;
                var dishPrice = document.getElementById('editDishPrice_' + dishId).value;
                var dishCuisine = document.getElementById('editDishCuisine_' + dishId).value;
                var dishRecommended = document.getElementById('editDishRecommended_' + dishId).value;
                // 输出菜品信息到控制台
                console.log('菜品ID:', dishId);
                console.log('菜品名称:', dishName);
                console.log('菜品简介:', dishDescription);
                console.log('菜品价格:', dishPrice);
                console.log('菜品菜系:', dishCuisine);
                // 创建AJAX请求发送数据到服务器
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "changeDishServlet", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                xhr.onreadystatechange = function() {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        // 请求成功后的处理
                        // 更新页面上的菜品信息
                        var rows = document.querySelectorAll('#dishes tr');
                        rows.forEach(function(row) {
                            if (row.querySelector('.editDishButton').getAttribute('data-id') === dishId) {
                                console.log('菜品ID1111:', dishId);
                                row.cells[0].textContent = dishName;
                                row.cells[2].textContent = dishDescription;
                                row.cells[3].textContent = dishPrice;
                                row.cells[4].textContent = dishCuisine;
                                row.cells[5].textContent = dishRecommended ? '推荐' : '不推荐';
                            }
                        });

                        // 关闭模态框
                        $('#editDishModal').modal('hide');
                    }
                };

                var data = "id=" + encodeURIComponent(dishId) +
                    "&name=" + encodeURIComponent(dishName) +
                    "&description=" + encodeURIComponent(dishDescription) +
                    "&price=" + encodeURIComponent(dishPrice) +
                    "&cuisine=" + encodeURIComponent(dishCuisine)+
                "&recommend=" + encodeURIComponent(dishRecommended);
                xhr.send(data);

            });
        });



            document.getElementById('dishes').addEventListener('click', function(event) {
                // 检查被点击的元素是否为删除按钮
                if (event.target.classList.contains('deleteDishButton')) {
                    var dishId = event.target.getAttribute('data-id');
                    console.log("saxasxas"+dishId);
                    // 弹出确认框，确认是否要删除
                    if (confirm('确定要删除这个菜品吗？')) {
                        // 创建AJAX请求发送删除操作到服务器
                        var xhr = new XMLHttpRequest();
                        xhr.open("POST", "deleteDishServlet", true); // 修改为您的服务器端接口
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                        xhr.onreadystatechange = function() {
                            if (xhr.readyState == 4 && xhr.status == 200) {
                                // 请求成功后的处理
                                // 例如：从表格中移除删除的菜品行
                                document.getElementById('dishRow_' + dishId).remove();
                            }
                        };

                        var data = "id=" + encodeURIComponent(dishId);
                        xhr.send(data);
                    }
                }
            });



    });

</script>
</body>
</html>
