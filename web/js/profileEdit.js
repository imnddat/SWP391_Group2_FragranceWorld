/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

document.getElementById("editButton").onclick = function () {
    // Đổi nút "Edit" thành "Save Change"
    document.getElementById("editButton").style.display = "none";
    document.getElementById("saveButton").style.display = "inline-block";
    // Ẩn nút "Cancel"
    document.getElementById("cancelButton").style.display = "inline-block";

    // Cho phép chỉnh sửa các trường input
    document.getElementById("usernameInput").readOnly = false;
    document.getElementById("fullNameInput").readOnly = false;
    document.getElementById("emailInput").readOnly = false;
    document.getElementById("phoneInput").readOnly = false;
    document.getElementById("addressInput").readOnly = false;
};

document.getElementById("cancelButton").onclick = function () {
    // Đổi nút "Save Change" thành "Edit"
    document.getElementById("editButton").style.display = "inline-block";
    document.getElementById("saveButton").style.display = "none";
    // Ẩn nút "Cancel"
    document.getElementById("cancelButton").style.display = "none";

    // Xóa giá trị trong các thẻ alert
    document.getElementById("username-alert").innerHTML = "";
    document.getElementById("fullName-alert").innerHTML = "";
    document.getElementById("email-alert").innerHTML = "";
    document.getElementById("phone-alert").innerHTML = "";
    document.getElementById("adress-alert").innerHTML = "";

    //ẩn alert
    document.getElementById("username-alert").style.display = "none";
    document.getElementById("fullName-alert").style.display = "none";
    document.getElementById("email-alert").style.display = "none";
    document.getElementById("phone-alert").style.display = "none";
    document.getElementById("adress-alert").style.display = "none";

    // Không cho phép chỉnh sửa các trường input
    document.getElementById("usernameInput").readOnly = true;
    document.getElementById("fullNameInput").readOnly = true;
    document.getElementById("emailInput").readOnly = true;
    document.getElementById("phoneInput").readOnly = true;
    document.getElementById("addressInput").readOnly = true;

    // Khôi phục giá trị gốc của mỗi trường input
    document.getElementById("usernameInput").value = originalValues.username;
    document.getElementById("fullNameInput").value = originalValues.fullName;
    document.getElementById("emailInput").value = originalValues.email;
    document.getElementById("phoneInput").value = originalValues.phone;
    document.getElementById("addressInput").value = originalValues.address;
};

document.getElementById("saveButton").onclick = function () {
    // Lấy dữ liệu từ các trường input
    var username = document.getElementById("usernameInput").value;
    var fullName = document.getElementById("fullNameInput").value;
    var email = document.getElementById("emailInput").value;
    var phone = document.getElementById("phoneInput").value;
    var address = document.getElementById("addressInput").value;

    // Gửi dữ liệu về servlet
    // Sử dụng AJAX hoặc form submission để gửi dữ liệu về servlet
    // Ví dụ sử dụng AJAX:
    $.ajax({
        url: "edituserprofile",
        type: "POST",
        //contentType: "application/json",
        data: {
            username: username,
            fullName: fullName,
            email: email,
            phone: phone,
            address: address
        },
        success: function (response) {
            // Xử lý phản hồi thành công từ servlet (nếu cần)
            if (response === "Update successful") {
                alert("Update thành công");
                location.reload(); // Reset lại trang
            } else {
                if (response.usernamealert) {
                    $("#username-alert").text(response.usernamealert);
                    //hiển thị alert
                    console.log("toi o day nhe");
                    document.getElementById("username-alert").style.display = "inline-block";
                }
                if (response.fullNamealert) {
                    $("#fullName-alert").text(response.fullNamealert);
                    //hiển thị alert
                    document.getElementById("fullName-alert").style.display = "inline-block";
                }
                if (response.emailalert) {
                    $("#email-alert").text(response.emailalert);
                    //hiển thị alert
                    document.getElementById("email-alert").style.display = "inline-block";
                }
                if (response.phonealert) {
                    $("#phone-alert").text(response.phonealert);
                    //hiển thị alert
                    document.getElementById("phone-alert").style.display = "inline-block";
                }
                if (response.addressalert) {
                    $("#adress-alert").text(response.addressalert);
                    //hiển thị alert
                    document.getElementById("adress-alert").style.display = "inline-block";
                }

                // Ví dụ: Hiển thị thông báo lỗi
                console.error("Update không thành công: " + response);
            }
        },
        error: function (error) {
            console.error("Error updating userProfile: " + error);
        }
    });

    // Sau khi gửi dữ liệu, có thể cần cập nhật giao diện hoặc thực hiện các hành động khác tùy thuộc vào kết quả từ servlet
};

