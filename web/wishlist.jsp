<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Schön. | eCommerce HTML5 Template</title>
        <!-- include the site stylesheet -->
        <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900,900italic%7cMontserrat:400,700%7cOxygen:400,300,700' rel='stylesheet' type='text/css'>
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icon-fonts.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    </head>
    <body>
        <!-- main container of all the page elements -->  
        <div id="wrapper">
            <!-- Page Loader -->
            <div id="pre-loader" class="loader-container">
                <div class="loader">
                    <img src="images/svg/rings.svg" alt="loader">
                </div>
            </div>
            <div class="w1">
                <!-- mt -header style14 start from here -->
                <%@include file = "panner.jsp" %>

                <main id="mt-main">
                    <section class="mt-contact-banner mt-banner-22 wow fadeInUp" data-wow-delay="0.4s" style="background-image: url(http://placehold.it/1920x325);">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <h1 class="text-center">Wish List</h1>
                                    <!-- Breadcrumbs of the Page -->
                                    <nav class="breadcrumbs">
                                        <ul class="list-unstyled">
                                            <li><a href="#">Home <i class="fa fa-angle-right"></i></a></li>
                                            <li>Wish List</li>
                                        </ul>
                                    </nav>
                                    <!-- Breadcrumbs of the Page end -->
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="paddingbootom-md hidden-xs"></div>
                    <!-- Mt Product Table of the Page -->
                    <div class="mt-product-table wow fadeInUp" data-wow-delay="0.4s">
                        <div class="container">
                            <c:forEach var="i" items="${sessionScope.wishlist}">   
                                <div class="row border rowItem">
                                    <div class="col-xs-12 col-sm-2">
                                        <div class="img-holder">
                                            <img src="${i.getProduct().getDefaultImg()}" alt="image description">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-5">
                                        <strong class="product-name">${i.getProduct().getNameProduct()}(${i.getVolume()})</strong>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <strong class="price"><i class="fa fa-eur"></i> ${i.getPrice()}</strong>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <form action="#" class="coupon-form">
                                            <fieldset>
                                                <button class="quantity-btn" data-action="addtocart" data-product-id="${i.getProduct().getId()}" data-product-price="${i.getPrice()}" data-product-volume="${i.getVolume()}" type="submit" style="margin-top: 15px;">APPLY</button>
                                            </fieldset>
                                        </form>
                                    </div>
                                    <div class="col-xs-12 col-sm-1">
                                        <a href="#"><i class="fa fa-close quantity-btn" data-action="delete" data-product-id="${i.getProduct().getId()}" data-product-price="${i.getPrice()}"></i></a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div><!-- Mt Product Table of the Page end -->
                    <div class="paddingbootom-md hidden-xs"></div>
                </main><!-- Main of the Page end here -->
                <!-- footer of the Page -->
                <%@include file = "footer.jsp" %>     
                <!-- footer of the Page end -->
            </div>
            <span id="back-top" class="fa fa-arrow-up"></span>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".quantity-btn").on("click", function () {
                    event.preventDefault(); // Chặn hành vi mặc định của form
                    var action = $(this).data("action");
                    var productId = $(this).data("product-id");
                    var productPrice = $(this).data("product-price");
                    var productVolume = $(this).data("product-volume");
                    var quantity;

                    if (action === "delete") {
                        // Hiển thị hộp thoại xác nhận
                        var confirmed = confirm("Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?");
                        if (confirmed) {
                            quantity = 0;
                            $(this).closest(".rowItem").hide();
                            updateWishlist(productId, productPrice, quantity);
                        }
                    } else if (action === "addtocart") {
                        quantity = 1;
                        addtocart(productId, productPrice, quantity, quantity, productVolume);                        
                        $(this).closest(".rowItem").hide();
                        updateWishlist(productId, productPrice, 0);
                        $(".cartItemOpen").trigger('click');
                            setTimeout(function () {
                                $(".cartItemOpen").trigger('click');
                            }, 3000);
                    }

                    // Tự động cập nhật thông tin giỏ hàng hoặc gửi yêu cầu Ajax đến máy chủ để cập nhật giỏ hàng.
                    // Ở đây chỉ cập nhật giao diện người dùng mẫu.

                });


                function addtocart(productId, productPrice, productQuantity, productVolume) {
                    var contextPath = "<%= request.getContextPath() %>";
                    var servletPath = "/cart"; // Đường dẫn của Servlet cập nhật giỏ hàng
                    var fullPath = contextPath + servletPath;

                    $.ajax({
                        url: fullPath, // Đường dẫn của API hoặc servlet cập nhật giỏ hàng trên máy chủ
                        type: 'POST',
                        data: {
                            id: productId,
                            price: productPrice,
                            quantity: productQuantity,
                            volume: productVolume
                        },
                        success: function (response) {
                            console.log("wishlist addtocart successfully");
                            // Cập nhật giao diện người dùng
                            $("#total-money").text(response.totalMoney.toFixed(2));
                            $("#cart-size").text(response.cartsize);

                            // Cập nhật giao diện người dùng với danh sách sản phẩm mới từ máy chủ
                            updateCartUI(response.cart);
                        },
                        error: function (error) {
                            console.error("Error updating cart: " + error);
                        }
                    });
                }

                function updateWishlist(productId, productPrice, newQuantity) {
                    var contextPath = "<%= request.getContextPath() %>";
                    var servletPath = "/wishlist"; // Đường dẫn của Servlet cập nhật giỏ hàng
                    var fullPath = contextPath + servletPath;

                    $.ajax({
                        url: fullPath, // Đường dẫn của API hoặc servlet cập nhật giỏ hàng trên máy chủ
                        type: 'POST',
                        data: {
                            id: productId,
                            price: productPrice,
                            quantity: newQuantity
                        },
                        success: function (response) {
                            console.log("wishlist updated successfully");
                            // Cập nhật giao diện người dùng
                            $("#wishlist-size").text(response.wishlistsize);

                            // Cập nhật giao diện người dùng với danh sách sản phẩm mới từ máy chủ
                            updateWishlistUI(response.wishlist);
                        },
                        error: function (error) {
                            console.error("Error updating wishlist: " + error);
                        }
                    });
                }

                function updateCartUI(cart) {
                    // Xóa nội dung cũ của giỏ hàng
                    $(".cartItem").empty();
                    // Thêm sản phẩm mới vào giỏ hàng

                    for (var i = 0; i < cart.length; i++) {
                        // Console log để kiểm tra giá trị
                        console.log("img1:", cart[i].productImg);
                        console.log("Name1:", cart[i].productName);
                        console.log("Price1:", cart[i].productPrice);
                        console.log("Quantity123:", cart[i].productQuantity);
                        var cartRowHtml = `
    <div class="cart-row">
        <a href="#" class="img"><img src="` + cart[i].productImg + `" alt="image" class="img-responsive"></a>
        <div class="mt-h">
            <span class="mt-h-title"><a href="#">` + cart[i].productName + `(` + cart[i].productVolume + `)` + `</a></span>
            <span class="price"><i class="fa fa-eur" aria-hidden="true"></i>` + cart[i].productPrice + `</span>
            <span class="mt-h-title">` + cart[i].productQuantity + `</span>
        </div>
    </div><!-- cart row end here -->
`;

                        $(".cartItem").append(cartRowHtml);
                    }
                }

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
            <span class="mt-h-title"><a href="#">` + wishlist[i].productName + `(` + wishlist[i].productVolume + `)` + `</a></span>
            <span class="price"><i class="fa fa-eur" aria-hidden="true"></i>` + wishlist[i].productPrice + `</span>
        </div>
    </div><!-- cart row end here -->
`;

                        $(".wishlistItem").append(cartRowHtml);
                    }
                }
            });
        </script> 

        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.main.js"></script>
    </body>
</html>