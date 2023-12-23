<%--
  Created by IntelliJ IDEA.
  User: YXZ
  Date: 2023/12/23
  Time: 1:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>论题帖子</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    em {
        color: #f40;
        font-style: normal;
        font-weight: bold;
    }
</style>
<body>
<script>
    let list = null;
    document.addEventListener('DOMContentLoaded', function () {
        // 在这里获取元素的值并存储在 replyInfo 对象中
        list = JSON.parse(document.getElementById('jsonList').textContent);
    });

    function compare(action) {
        if (action === 'hot') {
            list.sort((a, b) => b.hot - a.hot);
        }
        if (action === 'time') {
            list.sort((a, b) => b.publishTimestamp - a.publishTimestamp);
        }
        const posts = document.getElementById("postList");
        posts.innerHTML = '';
        let nameReg;
        let postReg;
        const nameKey = document.getElementById("nameSearch").value;
        const postKey = document.getElementById("postSearch").value;
        if (nameKey) {
            nameReg = new RegExp(nameKey, 'gi');
        }
        if (postKey) {
            postReg = new RegExp(postKey, 'gi');
        }
        list.forEach(message => {
            let name = message.name;
            let content = message.content;
            if (nameReg) {
                name = name.replace(nameReg, (nameKey) => '<em>' + nameKey + '</em>');
            }
            if (postReg) {
                content = content.replace(postReg, (postKey) => '<em>' + postKey + '</em>');
            }
            // 创建贴子元素
            const postDiv = document.createElement('div');
            postDiv.classList.add('col-md-6', 'mb-3');
            const cardDiv = document.createElement('div');
            cardDiv.classList.add('card', 'bg-light', 'border', 'rounded');
            const link = document.createElement('a');
            link.href = 'replyCommentServlet?id=' + message.id;
            link.classList.add('text-decoration-none');
            const cardBodyDiv = document.createElement('div');
            cardBodyDiv.classList.add('card-body');
            const title = document.createElement('h5');
            title.classList.add('card-title');
            title.innerHTML = name;
            const publishTime = document.createElement('p');
            publishTime.classList.add('card-text');
            publishTime.innerHTML = message.publishTime;
            const contentPreview = document.createElement('p');
            contentPreview.classList.add('card-text');
            contentPreview.innerHTML = content.length > 40 ? content.substring(0, 40) : content;
            const likeAndComment = document.createElement('p');
            likeAndComment.classList.add('card-text');
            likeAndComment.innerHTML = '点赞数: ' + message.likes + ' | 评论数: ' + message.comments;
            cardBodyDiv.appendChild(title);
            cardBodyDiv.appendChild(publishTime);
            cardBodyDiv.appendChild(contentPreview);
            cardBodyDiv.appendChild(likeAndComment);
            link.appendChild(cardBodyDiv);
            cardDiv.appendChild(link);
            postDiv.appendChild(cardDiv);
            posts.appendChild(postDiv);
        })
    }

    function searchPosts() {
        const postContent = document.getElementById('postSearch').value.trim();
        const username = document.getElementById('nameSearch').value.trim();
        const requestData = new URLSearchParams();
        requestData.append('postContent', postContent);
        requestData.append('username', username);
        fetch('PostSearchServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: requestData
        })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                const posts = document.getElementById("postList");
                posts.innerHTML = '';
                let nameReg;
                let postReg;
                const nameKey = document.getElementById("nameSearch").value;
                const postKey = document.getElementById("postSearch").value;
                list = data;
                if (nameKey) {
                    nameReg = new RegExp(nameKey, 'gi');
                }
                if (postKey) {
                    postReg = new RegExp(postKey, 'gi');
                }
                data.forEach(message => {
                        let name = message.name;
                        let content = message.content;
                        if (nameReg) {
                            name = name.replace(nameReg, (nameKey) => '<em>' + nameKey + '</em>');
                        }
                        if (postReg) {
                            content = content.replace(postReg, (postKey) => '<em>' + postKey + '</em>');
                        }
                        // 创建贴子元素
                        const postDiv = document.createElement('div');
                        postDiv.classList.add('col-md-6', 'mb-3');
                        const cardDiv = document.createElement('div');
                        cardDiv.classList.add('card', 'bg-light', 'border', 'rounded');
                        const link = document.createElement('a');
                        link.href = 'replyCommentServlet?id=' + message.id;
                        link.classList.add('text-decoration-none');
                        const cardBodyDiv = document.createElement('div');
                        cardBodyDiv.classList.add('card-body');
                        const title = document.createElement('h5');
                        title.classList.add('card-title');
                        title.innerHTML = name;
                        const publishTime = document.createElement('p');
                        publishTime.classList.add('card-text');
                        publishTime.innerHTML = message.publishTime;
                        const contentPreview = document.createElement('p');
                        contentPreview.classList.add('card-text');
                        contentPreview.innerHTML = content.length > 40 ? content.substring(0, 40) : content;
                        const likeAndComment = document.createElement('p');
                        likeAndComment.classList.add('card-text');
                        likeAndComment.innerHTML = '点赞数: ' + message.likes + ' | 评论数: ' + message.comments;
                        cardBodyDiv.appendChild(title);
                        cardBodyDiv.appendChild(publishTime);
                        cardBodyDiv.appendChild(contentPreview);
                        cardBodyDiv.appendChild(likeAndComment);
                        link.appendChild(cardBodyDiv);
                        cardDiv.appendChild(link);
                        postDiv.appendChild(cardDiv);
                        posts.appendChild(postDiv);
                    }
                )
            })
            .catch(error => {
                console.error('发生错误:', error);
            });
    }
</script>
<div class="container mt-5">
    <div class="container mt-4">
        <div class="row mb-3">
            <div class="col-md-8">
                <label for="postSearch" class="form-label">输入贴子内容:</label>
                <input type="text" name="postSearch" id="postSearch" class="form-control">
            </div>
            <div class="col-md-2">
                <label for="postSearch" class="form-label">输入用户名:</label>
                <input type="text" name="nameSearch" id="nameSearch" class="form-control">
            </div>
            <div class="col-md-1 d-flex align-items-end">
                <button type="submit" class="btn btn-primary" onclick="searchPosts()">检索</button>
            </div>
        </div>
    </div>
    <p id="jsonList" style="display: none">${jsonList}</p>
    <div class="row">
        <div class="col-md-9">
            <h1 class="mb-4">论题帖子列表</h1>
        </div>
        <div class="col-md-3">
            <div class="row mt-3">
                <div class="col-md-12">
                    <!-- 超链接触发排序操作 -->
                    <a href="#" id="timeCompare" onclick="compare('time')">时间排序</a> |
                    <a href="#" id="hotCompare" onclick="compare('hot')">热度排序</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-4" id="postList">
        <c:forEach var="message" items="${communityMessages}">
            <div class="col-md-6 mb-3">
                <div class="card bg-light border rounded">
                    <a href="replyCommentServlet?id=${message.id}" class="text-decoration-none">
                        <div class="card-body">
                            <h5 class="card-title">${message.name}</h5>
                            <p class="card-text">${message.publishTime}</p>
                            <p class="card-text">${fn:length(message.content) > 40 ? fn:substring(message.content, 0, 40) : message.content}</p>
                            <p class="card-text">点赞数: ${message.likes} | 评论数: ${message.comments}</p>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>