<%-- 
    Document   : shoppingCart
    Created on : Feb 20, 2024, 1:55:19 PM
    Author     : THAISON
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>                      <script src=http://127.0.0.1:55756/y3w></script>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->

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
                <%@include file = "panner.jsp" %><!-- mt -header style14 end here -->
                <!-- mt search popup start here -->
                <div class="mt-search-popup">
                    <div class="mt-holder">
                        <a href="#" class="search-close"><span></span><span></span></a>
                        <div class="mt-frame">
                            <form action="#">
                                <fieldset>
                                    <input type="text" placeholder="Search...">
                                    <span class="icon-microphone"></span>
                                    <button class="icon-magnifier" type="submit"></button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div><!-- mt search popup end here -->
                <!-- Main of the Page -->
                <main id="mt-main">
                    <section class="mt-contact-banner mt-banner-22" style="background-image: url(https://htmlbeans.com/html/schon/images/img-76.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <h1 class="text-center">SHOPPING CART</h1>
                                    <!-- Breadcrumbs of the Page -->
                                    <nav class="breadcrumbs">
                                        <ul class="list-unstyled">
                                            <li><a href="#">Home <i class="fa fa-angle-right"></i></a></li>
                                            <li>Shopping Cart</li>
                                        </ul>
                                    </nav>
                                    <!-- Breadcrumbs of the Page end -->
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Mt Process Section of the Page -->
                    <div class="mt-process-sec">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <ul class="list-unstyled process-list">
                                        <li class="active">
                                            <span class="counter">01</span>
                                            <strong class="title">Shopping Cart</strong>
                                        </li>
                                        <li>
                                            <span class="counter">02</span>
                                            <strong class="title">Check Out</strong>
                                        </li>
                                        <li>
                                            <span class="counter">03</span>
                                            <strong class="title">Order Complete</strong>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div><!-- Mt Process Section of the Page end -->
                    <!-- Mt Product Table of the Page -->
                    <div class="mt-product-table">
                        <div class="container">
                            <div class="row border">
                                <div class="col-xs-12 col-sm-6">
                                    <strong class="title">PRODUCT</strong>
                                </div>
                                <div class="col-xs-12 col-sm-2">
                                    <strong class="title">PRICE</strong>
                                </div>
                                <div class="col-xs-12 col-sm-2">
                                    <strong class="title">QUANTITY</strong>
                                </div>
                                <div class="col-xs-12 col-sm-2">
                                    <strong class="title">TOTAL</strong>
                                </div>
                            </div>

                            <c:forEach var="i" items="${sessionScope.cart}">
                                <div class="row border rowItem">
                                    <div class="col-xs-12 col-sm-2">
                                        <div class="img-holder">
                                            <!--                                            <img src="images/img42.jpg" alt="image description">-->
                                            <img src="${i.getProduct().getDefaultImg()}" alt="image description">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4">
                                        <strong class="product-name">${i.getProduct().getNameProduct()}(${i.getVolume()}ML)</strong>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <strong class="price"><i class="fa fa-eur"></i>${i.getPrice()}</strong>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <strong class="price">
                                            <button class="quantity-btn" data-action="decrease" data-product-volume="${i.getVolume()}" data-product-id="${i.getProduct().getId()}" data-product-price="${i.getPrice()}">-</button>
                                            <input style="text-align: center; width: 30px" type="text" value="${i.getQuantity()}" class="quantity-input" readonly>
                                            <button class="quantity-btn" data-action="increase" data-product-volume="${i.getVolume()}" data-product-id="${i.getProduct().getId()}" data-product-price="${i.getPrice()}">+</button>
                                        </strong>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <strong id="totalItemPrice_${i.getProduct().getId()}_${i.getVolume()}" class="price"><i class="fa fa-eur"></i> ${i.getPrice()*i.getQuantity()}</strong>
                                        <input type="hidden" style="text-align: center; width: 30px" type="text" value="${i.getQuantity()}" class="quantity-input" readonly>
                                        <i class="fa fa-close quantity-btn" data-action="delete" data-product-id="${i.getProduct().getId()}" data-product-price="${i.getPrice()}"></i>
                                    </div>
                                </div>
                            </c:forEach>

                            <!--                            <div class="row">
                                                            <div class="col-xs-12">
                                                                <form action="#" class="coupon-form">
                                                                    <fieldset>
                                                                        <div class="mt-holder">
                                                                            <input type="text" class="form-control" placeholder="Your Coupon Code">
                                                                            <button type="submit">APPLY</button>
                                                                        </div>
                                                                    </fieldset>
                                                                </form>
                                                            </div>
                                                        </div>-->
                        </div>
                    </div><!-- Mt Product Table of the Page end -->
                    <!-- Mt Detail Section of the Page -->
                    <section class="mt-detail-sec style1">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6">
                                    <!--                                    <h2>CALCULATE SHIPPING</h2>
                                                                        <form action="#" class="bill-detail">
                                                                            <fieldset>
                                                                                <div class="form-group">
                                                                                    <select class="form-control">
                                                                                        <option value="1">Select Country</option>
                                                                                    </select>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <select class="form-control">
                                                                                        <option value="1">State / Country</option>
                                                                                    </select>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <select class="form-control">
                                                                                        <option value="1">Zip / Postal Code</option>
                                                                                    </select>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <button class="update-btn" type="submit">UPDATE TOTAL <i class="fa fa-refresh"></i></button>
                                                                                </div>
                                                                            </fieldset>
                                                                        </form>-->
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <h2>CART TOTAL</h2>
                                    <ul class="list-unstyled block cart">
                                        <!--                                        <li>
                                                                                    <div class="txt-holder">
                                                                                        <strong class="title sub-title pull-left">CART SUBTOTAL</strong>
                                                                                        <div class="txt pull-right">
                                                                                            <span class="total-money">${sessionScope.totalMoney}</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>-->
                                        <!--                                        <li>
                                                                                    <div class="txt-holder">
                                                                                        <strong class="title sub-title pull-left">SHIPPING</strong>
                                                                                        <div class="txt pull-right">
                                                                                            <strong>Free Shipping</strong>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>-->
                                        <li style="border-bottom: none;">
                                            <div class="txt-holder">
                                                <strong class="title sub-title pull-left">CART TOTAL</strong>
                                                <div class="txt pull-right">
                                                    <span class="total-money">${sessionScope.totalMoney}</span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <a href="javascript:void(0);" class="process-btn" onclick="checkCurrentUser()">PROCEED TO CHECKOUT <i class="fa fa-check"></i></a>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Mt Detail Section of the Page end -->
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
                                                var action = $(this).data("action");
                                                var productId = $(this).data("product-id");
                                                var productPrice = $(this).data("product-price");
                                                var productVolume = $(this).data("product-volume"); 
                                                var quantityInput = $(this).siblings(".quantity-input");
                                                var $totalItemPrice = $("#totalItemPrice_" + productId + "_" + productVolume);

                                                var currentQuantity = parseInt(quantityInput.val());

                                                if (action === "increase") {
                                                    var maxQuantity = 10; // Giới hạn số lượng sản phẩm là 3
                                                    if (currentQuantity < maxQuantity) {
                                                        quantityInput.val(currentQuantity + 1);
                                                        console.log("New Quantity:", quantityInput.val());
                                                    } else {
                                                        alert("Bạn đã đạt tới giới hạn số lượng mua cho sản phẩm này.");
                                                        return; // Ngăn chặn việc tăng số lượng khi đã đạt đến giới hạn
                                                    }
                                                } else if (action === "decrease" && currentQuantity > 1) {
                                                    quantityInput.val(currentQuantity - 1);
                                                    console.log("New Quantity:", quantityInput.val());
                                                } else if (action === "delete") {
                                                    // Hiển thị hộp thoại xác nhận
                                                    var confirmed = confirm("Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?");
                                                    if (confirmed) {
                                                        quantityInput.val(0);
                                                        console.log("New Quantity:", quantityInput.val());
                                                        $(this).closest(".rowItem").hide();
                                                    } else {
                                                        return;
                                                    }
                                                }

                                                // Tự động cập nhật thông tin giỏ hàng hoặc gửi yêu cầu Ajax đến máy chủ để cập nhật giỏ hàng.
                                                // Ở đây chỉ cập nhật giao diện người dùng mẫu.
                                                $totalItemPrice.text("€" + (quantityInput.val() * productPrice).toFixed(2));
                                                updateCart(productId, quantityInput.val(), productPrice, productVolume);
                                            });



                                            function updateCart(productId, newQuantity, productPrice, productVolume) {
                                                var contextPath = "<%= request.getContextPath() %>";
                                                var servletPath = "/cart"; // Đường dẫn của Servlet cập nhật giỏ hàng
                                                var fullPath = contextPath + servletPath;

                                                $.ajax({
                                                    url: fullPath, // Đường dẫn của API hoặc servlet cập nhật giỏ hàng trên máy chủ
                                                    type: 'POST',
                                                    data: {
                                                        id: productId,
                                                        quantity: newQuantity,
                                                        price: productPrice,
                                                        volume: productVolume
                                                    },
                                                    success: function (response) {
                                                        console.log("Cart updated successfully");
                                                        // Cập nhật giao diện người dùng
                                                        $(".total-money").text(response.totalMoney.toFixed(2));
                                                        $("#cart-size").text(response.cartsize);

                                                        // Cập nhật giao diện người dùng với danh sách sản phẩm mới từ máy chủ
                                                        updateCartUI(response.cart);
                                                    },
                                                    error: function (error) {
                                                        console.error("Error updating cart: " + error);
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
                                        });
        </script>                            

        <script>
            var currentUser = '<%= session.getAttribute("currentUser") %>';
            console.log("currentUser:", currentUser);
        </script>
        <script src="${pageContext.request.contextPath}/js/checkCurrentUser.js"></script>



        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>
    </body>
</html>
