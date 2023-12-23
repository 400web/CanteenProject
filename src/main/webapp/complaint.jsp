<%--
  Created by IntelliJ IDEA.
  User: 11930
  Date: 2023/12/23
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>食堂投诉</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .complaint-form {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            resize: vertical;
        }
        input[readonly] {
            background-color: #eee;
            cursor: not-allowed;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="complaint-form">
    <h2>食堂投诉</h2>
    <p>请填写以下表单，我们会尽快处理您的投诉。</p>
    <form action="complaintDealServlet" method="post"  onsubmit="return handleFormSubmission()">
        <div class="form-group">
            <label for="username">用户名：</label>
            <input type="text" id="username" name="username" value="${username}" readonly>
        </div>
        <div class="form-group">
            <label for="object">投诉对象：</label>
            <input type="text" id="object" name="object" value="${canteenName}" readonly>
        </div>
        <div class="form-group">
            <label for="complaint">投诉内容：</label>
            <textarea id="complaint" name="complaint" rows="4" required></textarea>
        </div>
        <button type="submit">提交投诉</button>
    </form>
</div>
<script>
    // 处理表单提交
    function handleFormSubmission() {
        // 获取投诉内容
        var complaintContent = document.getElementById("complaint").value;
        // 检查投诉内容是否为空
        if (complaintContent.trim() === "") {
            // 如果为空，弹出提示信息
            alert("请输入投诉内容后才能提交。");
            return false; // 阻止表单正常提交
        }
        window.location.href = "success_page.html";
        return false; // 阻止表单正常提交
    }
</script>
</body>
</html>

