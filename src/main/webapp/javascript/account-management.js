// JavaScript 代码来处理点击切换
$(document).ready(function() {
    $('.account-link').click(function() {
        let target = $(this).attr('href');
        $('.account-section').removeClass('active');
        $(target).addClass('active');
    });
});

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

// 获取身份选择框和食堂选择框
let identitySelect = document.getElementById('identity');
let canteenSelect = document.getElementById('canteenSelect');

// 添加事件监听器
identitySelect.addEventListener('change', function() {
    // 获取当前所选身份
    let selectedIdentity = identitySelect.value;

    // 如果选择了食堂管理员，则显示食堂选择框，否则隐藏
    if (selectedIdentity === '食堂管理员') {
        canteenSelect.style.display = 'block';
    } else {
        canteenSelect.style.display = 'none';
    }
});

function fillEditModal(userId) {
    // 获取表格中的信息
    let editUsername = document.getElementById('username_' + userId).textContent;
    let editPhoneNumber = document.getElementById('phoneNumber_' + userId).textContent;
    let editRole = document.getElementById('role_' + userId).textContent;

    // 获取模态框中的表单元素
    let modalUsername = document.getElementById('editUsername_' + userId);
    let modalPhoneNumber = document.getElementById('editPhone_' + userId);
    let modalRole = document.getElementById('editRole_' + userId);
    let modalCanteenSection = document.getElementById('editCanteenSection_' + userId);

    // 填充模态框中的表单元素值
    modalUsername.value = editUsername;
    modalPhoneNumber.value = editPhoneNumber;
    modalRole.value = editRole;
    // 添加事件监听器
    if(editRole === "食堂管理员"){
        modalCanteenSection.style.display = 'block';
    } else {
        modalCanteenSection.style.display = 'none';
    }
    modalRole.addEventListener('change', function() {
        // 获取当前所选身份
        let selectedIdentity = modalRole.value;
        // 如果选择了食堂管理员，则显示食堂选择框，否则隐藏
        if (selectedIdentity === '食堂管理员') {
            modalCanteenSection.style.display = 'block';
        } else {
            modalCanteenSection.style.display = 'none';
        }
    });
    // 将表单字段设置为可编辑状态
    document.getElementById('editUsername_' + userId).readOnly = false;
    document.getElementById('editPassword_' + userId).readOnly = false;
    document.getElementById('editPhone_' + userId).readOnly = false;
    document.getElementById('editRole_' + userId).readOnly = false;
    document.getElementById('editCanteen_' + userId).readOnly = false; // 如果需要食堂信息的话
}

document.getElementById('saveButton').addEventListener('click', function() {
    let username = document.getElementById('addUsername').value;
    let password = document.getElementById('addPassword').value;
    let phone = document.getElementById('addPhone').value;
    let identity = document.getElementById('identity').value;
    let canteenId = document.getElementById('canteen').value;

    let userData = {
        username: username,
        password: password,
        phone: phone,
        identity: identity,
        canteenId: canteenId
    };

    let xhr = new XMLHttpRequest();
    let url = 'AddAccountServlet'; // 替换为您的 Servlet 地址

    xhr.open('POST', url, true);
    xhr.setRequestHeader('Content-Type', 'application/json; charset=utf-8');

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                let responseJson = JSON.parse(xhr.responseText);
                console.log(responseJson);
                if (responseJson.redirect) {
                    window.location.href = responseJson.redirect;
                }
            } else {
                console.error('Error occurred while sending data!');
            }
        }
    };

    xhr.send(JSON.stringify(userData));
});

// 获取所有模态框中的保存按钮
let saveButtons = document.querySelectorAll('[id^="editModal"] .btn-primary');

// 为每个保存按钮添加点击事件监听器
saveButtons.forEach(function(button) {
    button.addEventListener('click', function() {
        // 获取当前保存按钮所在模态框的用户ID
        let modalId = this.closest('.modal').id; // 获取最近的模态框的ID
        let userId = modalId.replace('editModal', ''); // 从模态框ID中提取用户ID

        // 使用提取的用户ID构建表单元素ID，并获取表单数据
        let editedUsername = document.getElementById('editUsername_'+userId).value;
        let editedPassword = document.getElementById('editPassword_'+userId).value;
        let editedPhone = document.getElementById('editPhone_'+userId).value;
        let editedRole = document.getElementById('editRole_'+userId).value;
        let editedCanteen = document.getElementById('CanteenSection_'+userId).value;

        document.getElementById('username_'+userId).textContent = editedUsername;
        document.getElementById('phoneNumber_'+userId).textContent = editedPhone;
        document.getElementById('role_'+userId).textContent = editedRole

        // 创建包含用户编辑数据的对象
        let editedUserData = {
            userId: userId,
            editedUsername: editedUsername,
            editedPassword: editedPassword,
            editedPhone: editedPhone,
            editedRole: editedRole,
            editedCanteenId: editedCanteen
        };

        let xhr = new XMLHttpRequest();
        let url = 'UpdateAccountServlet'; // 替换为您的 Servlet 地址

        xhr.open('POST', url, true);
        xhr.setRequestHeader('Content-Type', 'application/json');

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    console.log('Data sent successfully!');
                    // 可以在此处编写成功后的逻辑
                } else {
                    console.error('Error occurred while sending data!');
                }
            }
        };
        xhr.send(JSON.stringify(editedUserData));
        // 关闭模态框
        $('#editModal'+userId).modal('hide');
    });
});

// 确认删除按钮点击事件处理函数
function confirmDelete(userId) {
    $('#confirmDeleteModal').modal('show'); // 弹出确认删除的模态框

    // 当确认删除按钮点击时，将用户 ID 发送到 Servlet 进行处理
    document.getElementById('confirmDeleteBtn').onclick = function() {
        document.getElementById('allUser_'+userId).style.display = 'none';
        let data = {
            userId : userId
        };
        let xhr = new XMLHttpRequest();
        let url = 'DeleteAccountServlet'; // 替换为您的 Servlet 地址

        xhr.open('POST', url, true);
        xhr.setRequestHeader('Content-Type', 'application/json');

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    console.log('Data sent successfully!');
                    // 可以在此处编写成功后的逻辑
                } else {
                    console.error('Error occurred while sending data!');
                }
            }
        };
        xhr.send(JSON.stringify(data));
        $('#confirmDeleteModal').modal('hide');
    };
}

document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('searchInput');
    const searchButton = document.getElementById('searchButton');
    const userTable = document.getElementById('userTable');

    searchButton.addEventListener('click', function() {
        performSearch();
    });

    searchInput.addEventListener('keydown', function(event) {
        if (event.key === 'Enter') {
            performSearch();
        }
    });

    function performSearch() {
        const searchText = searchInput.value.trim().toLowerCase();
        const rows = userTable.getElementsByTagName('tr');

        for (let i = 0; i < rows.length; i++) {
            const row = rows[i];
            if (row.cells.length > 0) {
                const username = row.cells[0].textContent.toLowerCase();
                if (username.includes(searchText)) {
                    row.style.display = ''; // 显示匹配的行
                } else {
                    if (!row.classList.contains('table-header')) {
                        row.style.display = 'none'; // 仅隐藏数据行，不隐藏表头
                    }
                }
            }
        }
    }
});