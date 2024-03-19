<%-- 
    Document   : register
    Created on : Feb 27, 2024, 3:41:44 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
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
                <%@include file = "panner.jsp" %>

                <!-- Main of the Page -->
                <main id="mt-main">
                    <!-- Mt Content Banner of the Page -->
                    <section class="mt-contact-banner" style="background-image: url(http://placehold.it/1920x205);">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12 text-center">
                                    <h1>register</h1>
                                    <nav class="breadcrumbs">
                                        <ul class="list-unstyled">
                                            <li><a href="index.html">home <i class="fa fa-angle-right"></i></a></li>
                                            <li>register</li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Mt Content Banner of the Page end -->
                    <!-- Mt About Section of the Page -->
                    <section class="mt-about-sec" style="padding-bottom: 0;">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="txt">
                                        <h2>register</h2>
                                        <p>Morbi in erat malesuada, sollicitudin massa at, tristique nisl. Maecenas id eros scelerisque, vulputate tortor quis, efficitur arcu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Umco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit sse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat <strong>Vestibulum sit amet metus euismod, condimentum lectus id, ultrices sem.</strong></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Mt About Section of the Page -->
                    <!-- Mt Detail Section of the Page -->
                    <section class="mt-detail-sec toppadding-zero">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12 col-sm-10 col-sm-push-1">
                                    <div class="holder" style="margin: 0;">
                                        <div class="mt-side-widget">
                                            <header>
                                                <h2 style="margin: 0 0 5px;">register</h2>
                                                <p>Don’t have an account?</p>
                                            </header>
                                            <form action="register" method="post" style="margin: 0 0 80px;">
                                                <fieldset>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12">
                                                            <input type="text" placeholder="Your Name" class="input" name="name">
                                                        </div>
                                                         <div class="col-xs-12 col-sm-12">
                                                            <input type="date" placeholder="Date Of Birthday" class="input" name="dob">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-6">
                                                            <input type="text" placeholder="Username" class="input" name="username">
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <input type="text" placeholder="Your Email" class="input" name="email">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-6">
                                                            <input type="text" placeholder="Your Phone" class="input" name="phone">
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <textarea placeholder="Address" class="input" name="address"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-6">
                                                            <input type="password" placeholder="Password" class="input" name="password">
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <input type="password" placeholder="Re-type Password" class="input" name="retypepassword">
                                                        </div>
                                                    </div>
                                                    <div class="box">
                                                        <a href="#" class="help">Help?</a>
                                                    </div>
                                                    <button type="submit" class="btn-type1">Register Me</button>
                                                </fieldset>
                                            </form>
                                            <header>
                                                <h2 style="margin: 0 0 5px;">register with social</h2>
                                                <p>Create an account using social</p>
                                            </header>
                                            <ul class="mt-socialicons">
                                                <li class="mt-facebook"><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                                                <li class="mt-twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li class="mt-linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                <li class="mt-dribbble"><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                                <li class="mt-pinterest"><a href="#"><i class="fa fa-openid"></i></a></li>
                                                <li class="mt-youtube"><a href="#"><i class="fa fa-youtube-play"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    
                </main><!-- Main of the Page end -->
                <%@include file = "footer.jsp" %>
            </div>
            <span id="back-top" class="fa fa-arrow-up"></span>
        </div>
        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.main.js"></script>
    </body>
</html>