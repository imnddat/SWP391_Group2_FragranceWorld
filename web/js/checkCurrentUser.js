/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */
/* global currentUser */

function checkCurrentUser() {
        // Kiểm tra xem currentUser có trong session hay không
        //var currentUser = "<%= session.getAttribute("currentUser") %>";

        if (currentUser!=="null") {
            // Nếu có currentUser, chuyển hướng đến servlet checkout
            window.location.href = "checkout";
        } else {
            // Nếu không có, hiển thị thông báo và chuyển hướng đến servlet login khi người dùng ấn OK
            var confirmMessage = "You have to login to checkout";
            if (confirm(confirmMessage)) {
                window.location.href = "login";
            }
        }
    }


