/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */
$(document).ready(function () {
                $(".addtowishlist").click(function (event) {
                    event.preventDefault(); // Chặn hành vi mặc định của form

                    // Lấy dữ liệu từ form
                    var formData = $(this).closest('.addToCartForm').serialize();

                    // Gửi yêu cầu AJAX đến servlet
                    $.ajax({
                        url: "wishlist",
                        type: 'POST',
                        data: formData,
                        success: function (response) {
                            console.log("wishlist updated successfully");
                            // Cập nhật giao diện người dùng                      
                            $("#wishlist-size").text(response.wishlistsize);
                            // Cập nhật giao diện người dùng với danh sách sản phẩm mới từ máy chủ
                            updateWishlistUI(response.wishlist);

                            // Trigger the click event for the cart opener after 3 seconds
                            $(".wishlistItemOpen").trigger('click');
                            setTimeout(function () {
                                $(".wishlistItemOpen").trigger('click');
                            }, 3000);
                        },
                        error: function (error) {
                            console.error("Error updating wishlist: " + error);
                        }
                    });
                });

                function updateWishlistUI(wishlist) {
                    // Xóa nội dung cũ của giỏ hàng
                    $(".wishlistItem").empty();
                    // Thêm sản phẩm mới vào giỏ hàng

                    for (var i = 0; i < wishlist.length; i++) {
                        // Console log để kiểm tra giá trị
//                        console.log("img1:", cart[i].productImg);
//                        console.log("Name1:", cart[i].productName);
//                        console.log("Price1:", cart[i].productPrice);
//                        console.log("Quantity123:", cart[i].productQuantity);
                        var cartRowHtml = `
    <div class="cart-row">
        <a href="#" class="img"><img src="` + wishlist[i].productImg + `" alt="image" class="img-responsive"></a>
        <div class="mt-h">
            <span class="mt-h-title"><a href="#">` + wishlist[i].productName + `(` + wishlist[i].productVolume + `)`+ `</a></span>
            <span class="price"><i class="fa fa-eur" aria-hidden="true"></i>` + wishlist[i].productPrice + `</span>
        </div>
    </div><!-- cart row end here -->
`;

                        $(".wishlistItem").append(cartRowHtml);
                    }
                }
            });


