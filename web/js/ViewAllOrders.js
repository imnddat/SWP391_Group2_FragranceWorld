/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function () {
    $.ajax({
        url: "allorders",
        type: "POST",
        dataType: "json",
        success: function (data) {
            // Xử lý danh sách nhận được
            var contentDiv = document.getElementById("content");
            var content = orderPrinter(data);
            contentDiv.innerHTML = content;
        },
        error: function () {
            console.log("Lỗi khi gửi yêu cầu AJAX");
        }
    });
});
var numberInput = document.getElementById('page');
numberInput.addEventListener('keyup', function (event) {
    if (event.keyCode === 13) {
//        console.log('Số vừa nhập là:', Number(numberInput.value));
        $.ajax({
        url: "allorders",
        type: "POST",
        data: { pageOffset: Number(numberInput.value) },
        dataType: "json",
        success: function (data) {
            // Xử lý danh sách nhận được
            var contentDiv = document.getElementById("content");
            var content = orderPrinter(data);
            contentDiv.innerHTML = content;
        },
        error: function () {
            console.log("Lỗi khi gửi yêu cầu AJAX");
        }
    });
    }
});
//numberInput.addEventListener('input', function (event) {
//    console.log('Số vừa thay đổi là:', event.target.value);
//});
function orderPrinter(data) {
    var content = "";
    for (var i = 0; i < data.length; i++) {
//                console.log("Don hang " + (i+1) + " co: ");
//                console.log("id: " + data[i].id);
//                console.log(" total: " + data[i].totalPrice);
//                console.log(" orderdate: " + data[i].orderDate);
//                console.log(" paymentmedthod: " + data[i].paymentMedthod);
//                console.log(" status: " + data[i].status);
//                console.log(" VAT PHAM BAO GOM:");

        content += `<div class="row border rowItem">
                                <div class="col-xs-12 col-sm-1">
                                    <strong class="product-name">` + data[i].id + `</strong>
                                </div>
                                <div class="col-xs-12 col-sm-4">`;
        for (var j = 0; j < data[i].orderDetailList.length; j++) {
//                    console.log("  - " + data[i].orderDetailList[j].productName);
            content += `<div class="row rowItem">
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="img-holder">
                                                <img src="` + data[i].orderDetailList[j].img + `" alt="image description">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-9">
                                            <strong class="product-name">
                                                ` + data[i].orderDetailList[j].productName + `
                                            </strong>
                                        </div>
                                    </div>`;

        }
        content += `</div> <div class="col-xs-12 col-sm-1">
                                    <strong class="product-name">` + data[i].totalPrice + `</strong>
                                </div>
                                <div class="col-xs-12 col-sm-2">
                                    <strong class="product-name">
                                        ` + data[i].orderDate + `
                                    </strong>
                                </div>
                                <div class="col-xs-12 col-sm-2">
                                    <strong class="product-name">
                                        ` + data[i].paymentMedthod + `
                                    </strong>
                                </div>
                                <div class="col-xs-12 col-sm-1">
                                        ` + statusColour(data[i].status) + `
                                </div>
                                <div class="col-xs-12 col-sm-1">
                                    <strong class="product-name">
                                        <button onclick="redirectDetail(`+ data[i].id +`)">Detail</button>
                                    </strong>
                                </div>
                            </div>`;
    }
    return content;
}
function redirectDetail(id){
    window.location.href = "order?id=" + encodeURIComponent(id);
}
function statusColour(status){
    if (status == "unpaid" || status == "cancel"){
        return `<strong style="color: red;" class="product-name">` + status +`</strong>`;
    }else if(status == "completed"){
        return `<strong style="color: green;" class="product-name">` + status +`</strong>`;
    }else{
        return `<strong style="color: blue;" class="product-name">` + status +`</strong>`;
    }
}


