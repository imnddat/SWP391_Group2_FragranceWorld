/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */
$(document).ready(function () {
    $('form').submit(function (event) {
        // Ngăn chặn hành động mặc định của form (tải lại trang)
        event.preventDefault();

        // Lấy dữ liệu từ form
        var formData = $(this).serialize();

        // Gửi yêu cầu AJAX đến servlet
        $.ajax({
            type: 'POST',
            url: 'login', // Đường dẫn tới servlet
            data: formData,
            success: function (response) {
                if (response.errorMessage) {
                    $("#login-alert").text(response.errorMessage);
                } else if (response.redirectURL) {
                    // Chuyển hướng nếu có URL redirect được trả về từ servlet
                    window.location.href = response.redirectURL;
                }

                console.log(response); // In ra console để kiểm tra phản hồi
            },
            error: function (error) {
                // Xử lý lỗi nếu có
                console.error('Error:', error);
            }
        });
    });
});



