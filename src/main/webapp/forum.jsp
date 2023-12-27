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

    function addPosts(data) {
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
        data.forEach(message => {
            let name = message.name;
            let content = message.content;
            let title = message.title;
            if (nameReg) {
                name = name.replace(nameReg, (nameKey) => '<em>' + nameKey + '</em>');
            }
            if (postReg) {
                content = content.replace(postReg, (postKey) => '<em>' + postKey + '</em>');
                title = title.replace(postReg, (postKey) => '<em>' + postKey + '</em>');
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
            const rowDiv = document.createElement('div');
            rowDiv.classList.add('row');
            const leftColDiv = document.createElement('div');
            leftColDiv.classList.add('col-8');
            const rightColDiv = document.createElement('div');
            rightColDiv.classList.add('col-4', 'text-end');
            const messageTitle = document.createElement('h5');
            messageTitle.classList.add('card-title', 'fw-bold');
            messageTitle.innerHTML = title;
            const username = document.createElement('p');
            username.classList.add('card-text', 'fw-bold');
            username.innerHTML = name;
            const contentPreview = document.createElement('p');
            contentPreview.classList.add('card-text');
            contentPreview.innerHTML = content.length > 30 ? content.substring(0, 30) : content;
            const publishTime = document.createElement('p');
            publishTime.classList.add('card-text');
            publishTime.innerHTML = message.publishTime;
            const likeAndComment = document.createElement('p');
            likeAndComment.classList.add('card-text');
            likeAndComment.innerHTML = '点赞: ' + message.likes + ' | 评论: ' + message.comments;
            leftColDiv.appendChild(messageTitle);
            leftColDiv.appendChild(username);
            leftColDiv.appendChild(contentPreview);
            rightColDiv.appendChild(publishTime);
            rightColDiv.appendChild(likeAndComment);
            rowDiv.appendChild(leftColDiv);
            rowDiv.appendChild(rightColDiv);
            cardBodyDiv.appendChild(rowDiv);
            link.appendChild(cardBodyDiv);
            cardDiv.appendChild(link);
            postDiv.appendChild(cardDiv);
            posts.appendChild(postDiv);
        })
    }

    function newPost() {
        const postContent=document.getElementById("postContent");
        const postTitle=document.getElementById("postTitle");
        const data = {
            username:"jjj",
            title: postTitle.value,
            'comment-content': postContent.value,
            replyId: 1,
            replyName: 1,
            parentId: 1,
        };
        console.log("发送请求的数据():", data)

        fetch('SubmitCommunityServlet', {
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
                console.log('贴子已提交');
                postTitle.value = '';
                postContent.value = '';
                postTitle.placeholder = '最大输入20字';
                postContent.placeholder = '请输入';
                return response.json();
            })
            .then(message => {
                // 在这里处理从服务器返回的数据
                console.log('从服务器返回的数据:', message);
                const posts = document.getElementById("postList");
                let name = message.name;
                let content = message.content;
                let title = message.title;
                const postDiv = document.createElement('div');
                postDiv.classList.add('col-md-6', 'mb-3');
                const cardDiv = document.createElement('div');
                cardDiv.classList.add('card', 'bg-light', 'border', 'rounded');
                const link = document.createElement('a');
                link.href = 'replyCommentServlet?id=' + message.id;
                link.classList.add('text-decoration-none');
                const cardBodyDiv = document.createElement('div');
                cardBodyDiv.classList.add('card-body');
                const rowDiv = document.createElement('div');
                rowDiv.classList.add('row');
                const leftColDiv = document.createElement('div');
                leftColDiv.classList.add('col-8');
                const rightColDiv = document.createElement('div');
                rightColDiv.classList.add('col-4', 'text-end');
                const messageTitle = document.createElement('h5');
                messageTitle.classList.add('card-title', 'fw-bold');
                messageTitle.innerHTML = title;
                const username = document.createElement('p');
                username.classList.add('card-text', 'fw-bold');
                username.innerHTML = name;
                const contentPreview = document.createElement('p');
                contentPreview.classList.add('card-text');
                contentPreview.innerHTML = content.length > 30 ? content.substring(0, 30) : content;
                const publishTime = document.createElement('p');
                publishTime.classList.add('card-text');
                publishTime.innerHTML = message.publishTime;
                const likeAndComment = document.createElement('p');
                likeAndComment.classList.add('card-text');
                likeAndComment.innerHTML = '点赞: ' + message.likes + ' | 评论: ' + message.comments;
                leftColDiv.appendChild(messageTitle);
                leftColDiv.appendChild(username);
                leftColDiv.appendChild(contentPreview);
                rightColDiv.appendChild(publishTime);
                rightColDiv.appendChild(likeAndComment);
                rowDiv.appendChild(leftColDiv);
                rowDiv.appendChild(rightColDiv);
                cardBodyDiv.appendChild(rowDiv);
                link.appendChild(cardBodyDiv);
                cardDiv.appendChild(link);
                postDiv.appendChild(cardDiv);
                posts.appendChild(postDiv);
            })
            .catch(error => {
                console.error('发生错误:', error);
            });
    }

    function compare(action) {
        if (action === 'hot') {
            list.sort((a, b) => b.hot - a.hot);
        }
        if (action === 'time') {
            list.sort((a, b) => b.publishTimestamp - a.publishTimestamp);
        }
        addPosts(list);
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
                addPosts(data);
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
                <label for="postSearch" class="form-label">输入贴子标题或内容:</label>
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
                                <div class="row">
                                    <div class="col-8">
                                        <h5 class="card-title fw-bold">${message.title}</h5>
                                        <p class="card-text fw-bold">${message.name}</p>
                                        <p class="card-text">${fn:length(message.content) > 30 ? fn:substring(message.content, 0, 30) : message.content}</p>
                                    </div>
                                    <div class="col-4 text-end">
                                        <p class="card-text">${message.publishTime}</p>
                                        <p class="card-text">点赞: ${message.likes} | 评论: ${message.comments}</p>
                                    </div>
                                </div>
                            </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="modal fade" id="publishPostModal" tabindex="-1" aria-labelledby="publishPostModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="publishPostModalLabel">发表新贴子</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="postTitle" class="form-label">标题</label>
                        <input type="text" class="form-control" id="postTitle" name="postTitle" placeholder="最大输入20字" maxlength="20">
                    </div>
                    <div class="mb-3">
                        <label for="postContent" class="form-label">内容</label>
                        <textarea class="form-control" id="postContent" name="postContent" rows="4" placeholder="请输入"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary" onclick="newPost()">发表</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-md-12">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#publishPostModal">
                发表新贴子
            </button>
        </div>
    </div>
</div>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
