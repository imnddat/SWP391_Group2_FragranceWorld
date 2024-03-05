<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Complete</title>
        <!-- include the site stylesheet -->
        <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900,900italic%7cMontserrat:400,700%7cOxygen:400,300,700' rel='stylesheet' type='text/css'>
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="css/icon-fonts.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="css/main.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="css/responsive.css">
        <style>
            .optionbutton{
                margin: 10px;
            }
            .ordertext{
                margin-top: 10px;
                margin-bottom: 20px;
            }
            .greenCounter{
                border-color: #3fa047 !important;
                color: white !important;
                background-color: #3fa047 !important;
            }
        </style>
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
                <%@include file = "panner.jsp" %>
                <!-- Main of the Page -->
                <main id="mt-main">                    
                    <!-- Mt Process Section of the Page -->
                    <div class="mt-process-sec wow fadeInUp" data-wow-delay="0.4s">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <!-- Process List of the Page -->
                                    <ul class="list-unstyled process-list">
                                        <li class="active">
                                            <span class="counter">01</span>
                                            <strong class="title">Shopping Cart</strong>
                                        </li>
                                        <li class="active">
                                            <span class="counter">02</span>
                                            <strong class="title">Check Out</strong>
                                        </li>
                                        <li class="active">
                                            <span class="greenCounter counter">03</span>
                                            <strong class="title">Order Complete</strong>
                                        </li>
                                    </ul>
                                    <!-- Process List of the Page end -->
                                </div>
                            </div>
                        </div>
                    </div><!-- Mt Process Section of the Page end -->
                    <!-- Mt Detail Section of the Page -->
                    <section class="mt-detail-sec toppadding-zero">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12 col-sm-8 col-sm-push-2">
                                    <div class="holder" style="margin: 0;">
                                        <div class="mt-side-widget">
                                            <div class="text-center">
                                                <img src="images/green tick.png" alt="alt" style="width: 80px; display: inline"/>
                                            </div>
                                            <h1 class="text-center ordertext">ORDER COMPLETE</h1>
                                            <p class="text-center">Your Order ID: ${requestScope.orderid}</p>
                                            <div class="text-center">
                                                <button class="btn optionbutton" onclick="goToViewOrder()">View My Order</button>
                                                <button class="btn optionbutton" onclick="goToHomepage()">Go to Homepage</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Mt Detail Section of the Page end -->
                </main><!-- Main of the Page end here -->
                <%@include file = "footer.jsp" %>   
            </div>
            <span id="back-top" class="fa fa-arrow-up"></span>
        </div>
        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>
        <script>
            function goToHomepage() {
                // Chuyển hướng sang trang khác
                window.location.href = "HomeController";
            }

            function goToViewOrder() {
                // Chuyển hướng sang trang khác
                window.location.href = "#";
            }
        </script>
    </body>
</html>
