/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */
$(document).ready(function () {
                $(".addToCartForm").submit(function (event) {
                    event.preventDefault(); // Chặn hành vi mặc định của form

                    // Lấy dữ liệu từ form
                    var formData = $(this).serialize();

                    // Gửi yêu cầu AJAX đến servlet
                    $.ajax({
                        url: "cart",
                        type: 'POST',
                        data: formData,
                        success: function (response) {
                            console.log("Cart updated successfully");
                            // Cập nhật giao diện người dùng
                            $("#total-money").text(response.totalMoney.toFixed(2));
                            $("#cart-size").text(response.cartsize);
                            // Cập nhật giao diện người dùng với danh sách sản phẩm mới từ máy chủ
                            updateCartUI(response.cart);

                            // Trigger the click event for the cart opener after 3 seconds
                            $(".cartItemOpen").trigger('click');
                            setTimeout(function () {
                                $(".cartItemOpen").trigger('click');
                            }, 3000);
                        },
                        error: function (error) {
                            console.error("Error updating cart: " + error);
                        }
                    });
                });

                function updateCartUI(cart) {
                    // Xóa nội dung cũ của giỏ hàng
                    $(".cartItem").empty();
                    // Thêm sản phẩm mới vào giỏ hàng

                    for (var i = 0; i < cart.length; i++) {
                        // Console log để kiểm tra giá trị
                        console.log("img1:", cart[i].productImg);
                        console.log("Name1:", cart[i].productName);
                        console.log("Price1:", cart[i].productPrice);
//                        console.log("Quantity123:", cart[i].productQuantity);
                        var cartRowHtml = `
    <div class="cart-row">
        <a href="#" class="img"><img src="` + cart[i].productImg + `" alt="image" class="img-responsive"></a>
        <div class="mt-h">
            <span class="mt-h-title"><a href="#">` + cart[i].productName + `(` + cart[i].productVolume + `)`+ `</a></span>
            <span class="price"><i class="fa fa-eur" aria-hidden="true"></i>` + cart[i].productPrice + `</span>
            <span class="mt-h-title">` + cart[i].productQuantity + `</span>
        </div>
    </div><!-- cart row end here -->
`;

                        $(".cartItem").append(cartRowHtml);
                    }
                }
            });


