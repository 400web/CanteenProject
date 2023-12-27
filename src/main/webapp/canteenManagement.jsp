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
                <li><a href="#comments" class="account-link">评价处理</a></li>
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
                        var newCanteenName = document.getElementById('newCanteenName').value;
                        var newCanteenDescription = document.getElementById('newCanteenDescription').value;
                        var newOpeningTime = document.getElementById('newOpeningTime').value;
                        var newClosingTime = document.getElementById('newClosingTime').value;

                        // 创建AJAX请求发送数据到服务器
                        var xhr = new XMLHttpRequest();
                        xhr.open("POST", "/updateCanteen", true); // 修改为您的服务器端接口
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                        xhr.onreadystatechange = function() {
                            if (xhr.readyState == 4 && xhr.status == 200) {
                                // 请求成功后的处理
                                // 此处应根据您的需求进行调整，例如更新页面上的食堂信息
                                document.getElementById('canteenName').textContent = newCanteenName;
                                document.getElementById('canteenDescription').textContent = newCanteenDescription;
                                document.getElementById('canteenHours').textContent = newOpeningTime + ' - ' + newClosingTime;

                                // 关闭模态框
                                $('#modifyCanteenModal').modal('hide');
                            }
                        };

                        var data = "name=" + encodeURIComponent(newCanteenName) +
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
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="dishList">
                    <!-- 动态添加的菜品列表 -->
                    <jsp:useBean id="dishes" scope="request" type="java.util.List"/>
<%--                    <c:forEach var="dish" items="${dishes}">--%>
<%--                        <script>console.log('菜品ID:', dish.id);</script>--%>
<%--                        <tr>--%>
<%--                            <td>${dish.name}</td>--%>
<%--                            <td><img src="${dish.image}" alt="菜品图片" class="dish-image"/></td>--%>
<%--                            <td>${dish.introduction}</td>--%>
<%--                            <td>${dish.price}</td>--%>
<%--                            <td>${dish.cuisine}</td>--%>
<%--                            <td>--%>
<%--                                <div class="btn-group">--%>
<%--                                    <button class="btn btn-info btn-sm btn-margin" data-id="${dish.id}" data-toggle="modal" data-target="#editDishModal" onclick="editDish(this)">编辑</button>--%>

<%--&lt;%&ndash;                                    <button id="editDishModal"  class="btn btn-info btn-sm btn-margin" data-id="${dish.id}" onclick="editDish(this)">编辑</button>&ndash;%&gt;--%>
<%--                                    <button class="btn btn-danger btn-sm" data-id="${dish.id}" onclick="deleteDish(this)">删除</button>--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
                    <c:forEach var="dish" items="${dishes}">
                        <tr id="dishRow_${dish.id}">
                            <td id="dishName_${dish.id}">${dish.name}</td>
                            <td id="dishImageCell_${dish.id}"><img src="${dish.image}" alt="菜品图片" class="dish-image" id="dishImage_${dish.id}"/></td>
                            <td id="dishIntroduction_${dish.id}">${dish.introduction}</td>
                            <td id="dishPrice_${dish.id}">${dish.price}</td>
                            <td id="dishCuisine_${dish.id}">${dish.cuisine}</td>
                            <td id="dishActions_${dish.id}">
                                <div class="btn-group">
                                    <button class="btn btn-info btn-sm btn-margin editDishButton" data-id="${dish.id}" data-toggle="modal" data-target="#editDishModal" onclick="editDish(this)" id="editButton_${dish.id}">编辑</button>
                                    <button class="btn btn-danger btn-sm deleteDishButton" data-id="${dish.id}" onclick="deleteDish(this)" id="deleteButton_${dish.id}">删除</button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <!-- 添加菜品按钮 -->
                <button class="btn btn-success" id="addDishButton">添加菜品</button>
            </section>
            <!-- 编辑菜品的模态框 -->
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
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="editDishCancelButton_${dish.id}">关闭</button>
                            <button type="button" class="btn btn-primary" id="editDishSaveButton_${dish.id}">保存更改</button>
                        </div>
                    </div>
                </div>
            </div>


<script>
    function editDish(button) {
        var dishId = button.getAttribute('data-id'); // 获取菜品ID


        // 获取行中的数据
        var row = document.getElementById('dishRow_' + dishId);
        var dishName = document.getElementById('dishName_' + dishId).textContent;
        var dishImage = document.getElementById('dishImage_' + dishId).src;
        var dishIntroduction = document.getElementById('dishIntroduction_' + dishId).textContent;
        var dishPrice = document.getElementById('dishPrice_' + dishId).textContent;
        var dishCuisine = document.getElementById('dishCuisine_' + dishId).textContent;

        // 输出菜品信息到控制台
        console.log('菜品ID:', dishId);
        console.log('菜品名称:', dishName);
        console.log('菜品图片URL:', dishImage);
        console.log('菜品简介:', dishIntroduction);
        console.log('菜品价格:', dishPrice);
        console.log('菜品菜系:', dishCuisine);

// 填充编辑模态框的表单字段
        document.getElementById('editDishId').value = dishId;
        document.getElementById('editDishName').value = dishName;
        // document.getElementById('editDishImage').value = dishImage; // 如果需要编辑图片URL
        document.getElementById('editDishDescription').value = dishIntroduction;
        document.getElementById('editDishPrice').value = dishPrice;
        document.getElementById('editDishCuisine').value = dishCuisine;
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

                // 创建AJAX请求发送数据到服务器
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "/updateDish", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                xhr.onreadystatechange = function() {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        // 请求成功后的处理
                        // 更新页面上的菜品信息
                        var rows = document.querySelectorAll('#dishList tr');
                        rows.forEach(function(row) {
                            if (row.querySelector('.editDishButton').getAttribute('data-id') === dishId) {
                                row.cells[0].textContent = dishName;
                                row.cells[2].textContent = dishDescription;
                                row.cells[3].textContent = dishPrice;
                                row.cells[4].textContent = dishCuisine;
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
                    "&cuisine=" + encodeURIComponent(dishCuisine);

                xhr.send(data);

            });
        });

        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.deleteDishButton').forEach(function(deleteButton) {
                deleteButton.addEventListener('click', function() {
                    var dishId = this.getAttribute('data-id');

                    // 弹出确认框，确认是否要删除
                    if (confirm('确定要删除这个菜品吗？')) {
                        // 创建AJAX请求发送删除操作到服务器
                        var xhr = new XMLHttpRequest();
                        xhr.open("POST", "/deleteDish", true); // 修改为您的服务器端接口
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
                });
            });
        });

    });
    // document.addEventListener('DOMContentLoaded', function() {
    //     document.getElementById('saveDishChanges').addEventListener('click', function() {
    //         // 获取编辑表单中的菜品信息
    //         var dishId = document.getElementById('editDishId').value;
    //         var dishName = document.getElementById('editDishName').value;
    //         var dishDescription = document.getElementById('editDishDescription').value;
    //         var dishPrice = document.getElementById('editDishPrice').value;
    //         var dishCuisine = document.getElementById('editDishCuisine').value;
    //
    //         // 创建AJAX请求发送数据到服务器
    //         var xhr = new XMLHttpRequest();
    //         xhr.open("POST", "/updateDish", true);
    //         xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    //
    //         xhr.onreadystatechange = function() {
    //             if (xhr.readyState == 4 && xhr.status == 200) {
    //                 // 请求成功后的处理
    //                 // 更新页面上的菜品信息
    //                 var rows = document.querySelectorAll('#dishList tr');
    //                 rows.forEach(function(row) {
    //                     if (row.querySelector('.editDishButton').getAttribute('data-id') === dishId) {
    //                         row.cells[0].textContent = dishName;
    //                         row.cells[2].textContent = dishDescription;
    //                         row.cells[3].textContent = dishPrice;
    //                         row.cells[4].textContent = dishCuisine;
    //                     }
    //                 });
    //
    //                 // 关闭模态框
    //                 $('#editDishModal').modal('hide');
    //             }
    //         };

    //         var data = "id=" + encodeURIComponent(dishId) +
    //             "&name=" + encodeURIComponent(dishName) +
    //             "&description=" + encodeURIComponent(dishDescription) +
    //             "&price=" + encodeURIComponent(dishPrice) +
    //             "&cuisine=" + encodeURIComponent(dishCuisine);
    //
    //         xhr.send(data);
    //     });
    // });

    // document.addEventListener('DOMContentLoaded', function() {
    //     var deleteButtons = document.querySelectorAll('.deleteDishButton');
    //     deleteButtons.forEach(function(button) {
    //         button.addEventListener('click', function() {
    //             var dishId = this.getAttribute('data-id');
    //
    //             if (confirm('确定要删除这个菜品吗？')) {
    //                 // 创建AJAX请求发送删除操作到服务器
    //                 var xhr = new XMLHttpRequest();
    //                 xhr.open("POST", "/deleteDish", true); // 修改为您的服务器端接口
    //                 xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    //
    //                 xhr.onreadystatechange = function() {
    //                     if (xhr.readyState == 4 && xhr.status == 200) {
    //                         // 请求成功后的处理
    //                         // 例如：从表格中移除删除的菜品行
    //                         button.closest('tr').remove();
    //                     }
    //                 };
    //
    //                 var data = "id=" + encodeURIComponent(dishId);
    //                 xhr.send(data);
    //             }
    //         });
    //     });
    // });

</script>



        </div>
    </div>
</div>





<!-- 引入Bootstrap的JavaScript库和jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
    document.addEventListener('DOMContentLoaded', function() {
        // 监听修改按钮点击事件
        document.getElementById('modifyBtn').addEventListener('click', function() {
            // 获取当前账号信息并填充到模态框中
            let username = document.getElementById('username').textContent;
            let phone = document.getElementById('phone').textContent;

            document.getElementById('newUsername').value = username;
            document.getElementById('newPhone').value = phone;
        });

        // 监听保存更改按钮点击事件
        document.getElementById('saveChanges').addEventListener('click', function() {
            // 获取修改后的信息并更新到页面中
            let newUsername = document.getElementById('newUsername').value;
            let newPassword = document.getElementById('newPassword').value;
            let newPhone = document.getElementById('newPhone').value;

            document.getElementById('username').textContent = newUsername;
            document.getElementById('password').textContent = newPassword ? '********' : '';
            document.getElementById('phone').textContent = newPhone;

            // 关闭模态框
            $('#modifyModal').modal('hide');
        });
    });
</script>
</body>
</html>
