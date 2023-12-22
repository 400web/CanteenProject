 document.addEventListener('DOMContentLoaded', function() {
    // 监听修改按钮点击事件
    document.getElementById('modifyBtn').addEventListener('click', function() {
        // 获取当前食堂信息并填充到模态框中
        let name = document.getElementById('nameCell').textContent;
        let location = document.getElementById('locationCell').textContent;
        let description = document.getElementById('descriptionCell').textContent;
        let openingHours = document.getElementById('openingHoursCell').textContent;

        document.getElementById('newNameInput').value = name;
        document.getElementById('newLocationInput').value = location;
        document.getElementById('newDescriptionInput').value = description;
        document.getElementById('newOpeningHoursInput').value = openingHours;
    });

    // 监听保存更改按钮点击事件
    document.getElementById('saveChanges').addEventListener('click', function() {
    // 获取模态框中修改后的数据
    let newName = document.getElementById('newNameInput').value;
    let newLocation = document.getElementById('newLocationInput').value;
    let newDescription = document.getElementById('newDescriptionInput').value;
    let newOpeningHours = document.getElementById('newOpeningHoursInput').value;

    // 更新表格中对应单元格的内容
    document.getElementById('nameCell').textContent = newName;
    document.getElementById('locationCell').textContent = newLocation;
    document.getElementById('descriptionCell').textContent = newDescription;
    document.getElementById('openingHoursCell').textContent = newOpeningHours;

    // 获取用户选择的图片文件
    let fileInput = document.getElementById('newCanteenImage');
    let file = fileInput.files[0];

    // 创建一个 FormData 对象并添加文件到其中
    let formData = new FormData();
    formData.append('canteenImage', file);

    // 关闭模态框
    $('#editModal').modal('hide');

    // 使用 AJAX 将图片上传到服务器
    $.ajax({
    url: 'your_upload_servlet_url', // 替换为你的上传图片的 Servlet URL
    type: 'POST',
    data: formData,
    processData: false,
    contentType: false,
    success: function(response) {
    console.log('图片上传成功');
    // TODO: 处理上传成功的逻辑
},
    error: function(xhr, status, error) {
    console.error('图片上传失败:', error);
    // TODO: 处理上传失败的逻辑
}
});

});
});

    $(document).ready(function() {
    // 监听文件上传框选择文件事件
    $('#newCanteenImage').on('change', function() {
        // 获取用户选择的图片文件
        let fileInput = document.getElementById('newCanteenImage');
        let file = fileInput.files[0];

        // 显示用户选择的图片预览
        let reader = new FileReader();
        reader.onload = function(e) {
            $('#previewImage').attr('src', e.target.result);
            // 更新页面中其他图片
            $('#mainImage').attr('src', e.target.result);
        }
        reader.readAsDataURL(file);
    });
});
