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
                <header class="style14" id="mt-header">
                    <!-- mt top bar start from here -->
                    <div class="mt-top-bar">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 hidden-xs">
                                    <span class="tel"> <i class="fa fa-phone" aria-hidden="true"></i> +1 (555) 333 22 11</span>
                                </div>
                                <div class="col-xs-12 col-sm-6 text-right">
                                    <!-- mt top lang start from here -->  
                                    <div class="mt-top-lang">
                                        <a href="#" class="lang-opener">Language<i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                        <div class="drop">
                                            <ul>
                                                <li><a href="#">English</a></li>
                                                <li><a href="#">Urdu</a></li>
                                                <li><a href="#">Hindi</a></li>
                                                <li><a href="#">Dutch</a></li>
                                                <li><a href="#">German</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- mt top lang end from here -->  
                                    <span class="account"><a href="#">Login</a> or <a href="#">Create Account</a></span>
                                </div>
                            </div>
                        </div>
                    </div><!-- mt top bar end here -->
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <!-- mt bottom bar start from here -->
                                <div class="mt-bottom-bar">
                                    <!-- mt logo start from here -->
                                    <div class="mt-logo"><a href="#"><img alt="schon" src="images/mt-logo.png"></a></div>
                                    <!-- mt icon list start from here -->
                                    <ul class="mt-icon-list">
                                        <li><a class="icon-magnifier" href="#"></a></li>
                                        <li><a class="icon-heart" href="#"></a></li>
                                        <li class="drop">
                                            <a class="cart-opener" href="#">
                                                <span class="icon-handbag"></span>
                                                <c:set var="size" value="${empty sessionScope.cartsize ? 0 : sessionScope.cartsize}"/>
                                                <span class="num" id="cart-size">${size}</span>
                                            </a>
                                            <!-- mt drop start here -->
                                            <div class="mt-drop">
                                                <!-- mt drop sub start here -->
                                                <div class="mt-drop-sub">
                                                    <!-- mt side widget start here -->
                                                    <div class="mt-side-widget">
                                                        <!-- cart row start here -->

                                                        <div class="cartUI" style="max-height: 270px; overflow-y: auto">
                                                            <!-- cart row start here -->

                                                            <c:forEach var="i" items="${sessionScope.cart}">
                                                                <div class="cart-row">
                                                                    <a href="#" class="img"><img src="http://placehold.it/75x75" alt="image" class="img-responsive"></a>
                                                                        <%--<a href="#" class="img"><img src="${i.getPtoduct().getDefaultImg()}" alt="image" class="img-responsive"></a>--%>
                                                                    <div class="mt-h">
                                                                        <span class="mt-h-title"><a href="#">${i.getProduct().getNameProduct()}</a></span>
                                                                        <span class="price"><i class="fa fa-eur" aria-hidden="true"></i>${i.getPrice()}</span>
                                                                        <span class="mt-h-title">${i.getQuantity()}</span>
                                                                    </div>
                                                                    <a href="#" class="close fa fa-times"></a>
                                                                </div><!-- cart row end here -->
                                                            </c:forEach>

                                                        </div>

                                                        <!-- cart row total start here -->
                                                        <div class="cart-row-total">
                                                            <span class="mt-total">Sub Total</span>
                                                            <span class="mt-total-txt" ><i class="fa fa-eur" aria-hidden="true"></i>${sessionScope.totalMoney}</span>
                                                        </div>
                                                        <!-- cart row total end here -->
                                                        <!--                                                        <div class="cart-btn-row">
                                                                                                                    <a href="#" class="btn-type2">VIEW CART</a>
                                                                                                                    <a href="#" class="btn-type3">CHECKOUT</a>
                                                                                                                </div>-->
                                                    </div>
                                                    <!-- mt side widget end here -->
                                                </div>
                                                <!-- mt drop sub end here -->
                                            </div><!-- mt drop end here -->
                                            <span class="mt-mdropover"></span>
                                        </li>
                                        <li class="hidden-md hidden-lg">
                                            <a href="#" class="bar-opener big mobile-toggle">
                                                <span class="bar"></span>
                                                <span class="bar small"></span>
                                                <span class="bar"></span>
                                            </a>
                                        </li>
                                    </ul><!-- mt icon list end here -->
                                    <!-- navigation start here -->
                                    <nav id="nav">
                                        <ul>
                                            <li>
                                                <a  href="${pageContext.request.contextPath}/HomeController">HOME <i class="fa fa-angle-down hidden-lg hidden-md" aria-hidden="true"></i></a>                     
                                            </li>
                                            <li>
                                                <a class="drop-link" href="product-grid-view.html">PRODUCTS <i class="fa fa-angle-down hidden-lg hidden-md" aria-hidden="true"></i></a>
                                                <div class="s-drop">
                                                    <ul>
                                                        <li><a href="product-grid-view.html">Product Grid View</a></li>
                                                        <li><a href="product-grid-view2.html">Product Grid View2</a></li>
                                                        <li><a href="product-grid-view3.html">Product Grid View3</a></li>
                                                        <li><a href="product-grid-view4.html">Product Grid View4</a></li>
                                                        <li><a href="product-grid-view5.html">Product Grid View5</a></li>
                                                        <li><a href="product-grid-view6.html">Product Grid View6</a></li>
                                                        <li><a href="product-grid-view7.html">Product Grid View7</a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li>
                                                <a class="drop-link" href="blog-right-sidebar.html">Blog <i class="fa fa-angle-down hidden-lg hidden-md" aria-hidden="true"></i></a>
                                                <div class="s-drop">
                                                    <ul>
                                                        <li><a href="blog-fullwidth-page.html">Blog Fullwidth Page</a></li>
                                                        <li><a href="blog-right-sidebar2.html">blog right sidebar2</a></li>
                                                        <li><a href="blog-postlist-3-masonry.html">blog postlist masonry</a></li>
                                                        <li><a href="blog-post-detail-sidebar.html">blog post detail sidebar</a></li>
                                                        <li><a href="blog-post-detail-full-width.html">blog post detail full width</a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li class="drop">
                                                <a href="#">PAGES <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                                <!-- mt dropmenu start here -->
                                                <div class="mt-dropmenu text-left">
                                                    <!-- mt frame start here -->
                                                    <div class="mt-frame">
                                                        <!-- mt f box start here -->
                                                        <div class="mt-f-box">
                                                            <!-- mt col3 start here -->
                                                            <div class="mt-col-3">
                                                                <div class="sub-dropcont">
                                                                    <strong class="title"><a href="product-grid-view.html" class="mt-subopener">Shop Pages</a></strong>
                                                                    <div class="sub-drop">
                                                                        <ul>
                                                                            <li><a href="product-grid-view.html">Product Grid View</a></li>
                                                                            <li><a href="product-list-view.html">Product List View</a></li>
                                                                            <li><a href="product-quickview.html">Product QuickView popup</a></li>
                                                                            <li><a href="product-detail.html">Product Detail</a></li>
                                                                            <li><a href="product-detail2.html">Product Detail V2</a></li>
                                                                            <li><a href="order-shopping-cart.html">Shopping Cart</a></li>
                                                                            <li><a href="order-checkout.html">Checkout</a></li>
                                                                            <li><a href="ordertracking.html">Order Tracking</a></li>
                                                                            <li><a href="wishlist.html">Wish List</a></li>
                                                                            <li><a href="faq.html">FAQ Page</a></li>
                                                                            <li><a href="loginpage.html">Login Page</a></li>
                                                                            <li><a href="registerpage.html">Register Page</a></li>
                                                                            <li><a href="newsletter-popup.html">Newsletter Popup</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- mt col3 end here -->

                                                            <!-- mt col3 start here -->
                                                            <div class="mt-col-3">
                                                                <div class="sub-dropcont">
                                                                    <strong class="title"><a href="#" class="mt-subopener">404 Pages</a></strong>
                                                                    <div class="sub-drop">
                                                                        <ul>
                                                                            <li><a href="404-page.html">404 Page</a></li>
                                                                            <li><a href="404-page2.html">404 Page2</a></li>
                                                                            <li><a href="404-page3.html">404 Page3</a></li>
                                                                            <li><a href="404-page4.html">404 Page4</a></li>
                                                                            <li><a href="404-page5.html">404 Page5</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="sub-dropcont">
                                                                    <strong class="title"><a href="#" class="mt-subopener">Coming Soon</a></strong>
                                                                    <div class="sub-drop">
                                                                        <ul>
                                                                            <li><a href="coming-soon.html">Coming Soon</a></li>
                                                                            <li><a href="coming-soon2.html">Coming Soon2</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- mt col3 end here -->

                                                            <!-- mt col3 start here -->
                                                            <div class="mt-col-3">
                                                                <div class="sub-dropcont">
                                                                    <strong class="title"><a href="#" class="mt-subopener">KITCHEN FURNITURE</a></strong>
                                                                    <div class="sub-drop">
                                                                        <ul>
                                                                            <li><a href="#">Kitchen Taps</a></li>
                                                                            <li><a href="#">Breakfast time</a></li>
                                                                            <li><a href="#">Cooking</a></li>
                                                                            <li><a href="#">Food Storage Boxes</a></li>
                                                                            <li><a href="#">Spice Jars</a></li>
                                                                            <li><a href="#">Napskins</a></li>
                                                                            <li><a href="#">Oven Gloves</a></li>
                                                                            <li><a href="#">Placemats</a></li>
                                                                            <li><a href="#">Cooking</a></li>
                                                                            <li><a href="#">Food Storage Boxes</a></li>
                                                                            <li><a href="#">Spice Jars</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- mt col3 end here -->

                                                            <!-- mt col3 start here -->
                                                            <div class="mt-col-3 promo">
                                                                <div class="mt-promobox">
                                                                    <a href="#"><img src="images/banner-drop.jpg" alt="promo banner" class="img-responsive"></a>
                                                                </div>
                                                            </div>
                                                            <!-- mt col3 end here -->
                                                        </div>
                                                        <!-- mt f box end here -->
                                                    </div>
                                                    <!-- mt frame end here -->
                                                </div>
                                                <!-- mt dropmenu end here -->
                                                <span class="mt-mdropover"></span>
                                            </li>
                                            <li><a href="about-us.html">About</a></li>
                                            <li>
                                                <a class="drop-link" href="contact-us.html">Contact <i class="fa fa-angle-down hidden-lg hidden-md" aria-hidden="true"></i></a>
                                                <div class="s-drop">
                                                    <ul>
                                                        <li><a href="contact-us.html">Contact</a></li>
                                                        <li><a href="contact-us2.html">Contact 2</a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                        </ul>
                                    </nav><!-- navigation end here -->
                                </div><!-- mt bottom bar end here -->
                            </div>
                        </div>
                    </div>
                    <span class="mt-side-over"></span>
                </header><!-- mt -header style14 end here -->
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
                                        <strong class="product-name">${i.getProduct().getNameProduct()}</strong>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <strong class="price"><i class="fa fa-eur"></i>${i.getPrice()}</strong>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <strong class="price">
                                            <button class="quantity-btn" data-action="decrease" data-product-id="${i.getProduct().getId()}" data-product-price="${i.getPrice()}">-</button>
                                            <input style="text-align: center; width: 30px" type="text" value="${i.getQuantity()}" class="quantity-input" readonly>
                                            <button class="quantity-btn" data-action="increase" data-product-id="${i.getProduct().getId()}" data-product-price="${i.getPrice()}">+</button>
                                        </strong>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <strong id="totalItemPrice_${i.getProduct().getId()}" class="price"><i class="fa fa-eur"></i> ${i.getPrice()*i.getQuantity()}</strong>
                                        <input type="hidden" style="text-align: center; width: 30px" type="text" value="${i.getQuantity()}" class="quantity-input" readonly>
                                        <i class="fa fa-close quantity-btn" data-action="delete" data-product-id="${i.getProduct().getId()}" data-product-price="${i.getPrice()}"></i>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="row">
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
                            </div>
                        </div>
                    </div><!-- Mt Product Table of the Page end -->
                    <!-- Mt Detail Section of the Page -->
                    <section class="mt-detail-sec style1">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6">
                                    <h2>CALCULATE SHIPPING</h2>
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
                                    </form>
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <h2>CART TOTAL</h2>
                                    <ul class="list-unstyled block cart">
                                        <li>
                                            <div class="txt-holder">
                                                <strong class="title sub-title pull-left">CART SUBTOTAL</strong>
                                                <div class="txt pull-right">
                                                    <span class="total-money">${sessionScope.totalMoney}</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="txt-holder">
                                                <strong class="title sub-title pull-left">SHIPPING</strong>
                                                <div class="txt pull-right">
                                                    <strong>Free Shipping</strong>
                                                </div>
                                            </div>
                                        </li>
                                        <li style="border-bottom: none;">
                                            <div class="txt-holder">
                                                <strong class="title sub-title pull-left">CART TOTAL</strong>
                                                <div class="txt pull-right">
                                                    <span class="total-money">${sessionScope.totalMoney}</span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <a href="checkout" class="process-btn">PROCEED TO CHECKOUT <i class="fa fa-check"></i></a>
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
                    var quantityInput = $(this).siblings(".quantity-input");
                    var $totalItemPrice = $("#totalItemPrice_" + productId);

                    var currentQuantity = parseInt(quantityInput.val());

                    if (action === "increase") {
                        quantityInput.val(currentQuantity + 1);
                        console.log("New Quantity:", quantityInput.val());
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
                    updateCart(productId, quantityInput.val(), productPrice);
                });



                function updateCart(productId, newQuantity, productPrice) {
                    var contextPath = "<%= request.getContextPath() %>";
                    var servletPath = "/cart"; // Đường dẫn của Servlet cập nhật giỏ hàng
                    var fullPath = contextPath + servletPath;

                    $.ajax({
                        url: fullPath, // Đường dẫn của API hoặc servlet cập nhật giỏ hàng trên máy chủ
                        type: 'POST',
                        data: {
                            id: productId,
                            quantity: newQuantity,
                            price: productPrice
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
                    $(".cartUI").empty();
                    // Thêm sản phẩm mới vào giỏ hàng

                    for (var i = 0; i < cart.length; i++) {
                        // Console log để kiểm tra giá trị
//                        console.log("Name:", cart[i].productName);
//                        console.log("Price:", cart[i].productPrice);
//                        console.log("Quantity:", cart[i].productQuantity);
                        var cartRowHtml = `
    <div class="cart-row">
        <a href="#" class="img"><img src="http://placehold.it/75x75" alt="image" class="img-responsive"></a>
        <div class="mt-h">
            <span class="mt-h-title"><a href="#">` + cart[i].productName + `</a></span>
            <span class="price"><i class="fa fa-eur" aria-hidden="true"></i>` + cart[i].productPrice + `</span>
            <span class="mt-h-title">` + cart[i].productQuantity + `</span>
        </div>
        <a href="#" class="close fa fa-times"></a>
    </div><!-- cart row end here -->
`;

                        $(".cartUI").append(cartRowHtml);
                    }
                }
            });
        </script>                            

        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>
    </body>
</html>
