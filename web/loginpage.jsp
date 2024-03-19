<%-- 
    Document   : loginpage
    Created on : Feb 21, 2024, 8:34:46 AM
    Author     : Thinkpad
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
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
    </head>
    <body>
        <%@include file = "panner.jsp" %>
        <!-- Main of the Page -->
        <main id="mt-main">
            <!-- Mt Content Banner of the Page -->
            <section class="mt-contact-banner" style="background-image: url(http://placehold.it/1920x205);">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <h1>login</h1>
                            <nav class="breadcrumbs">
                                <ul class="list-unstyled">
                                    <li><a href="index.html">home <i class="fa fa-angle-right"></i></a></li>
                                    <li>login</li>
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
                                <h2>login</h2>                           
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
                        <div class="col-xs-12 col-sm-8 col-sm-push-2">
                            <div class="holder" style="margin: 0;">
                                <div class="mt-side-widget">
                                    <header>
                                        <h2 style="margin: 0 0 5px;">SIGN IN</h2>
                                        <p>Welcome back! Sign in to Your Account</p>
                                    </header>
                                    <p id="login-alert" class="text-danger"></p>
                                    <form action="login" method="post">
                                        <fieldset>
                                            <input type="text" placeholder="Username or email address" name="username" class="input">
                                            <input type="password" placeholder="Password" name="password" class="input">
                                            <div class="box">
                                                <span class="left"><input class="checkbox" type="checkbox" id="check1"><label for="check1">Remember Me</label></span>
                                                <a href="#" class="help">Help?</a>
                                            </div>
                                            <div>
                                                <button type="submit" class="btn-type1">Login</button>
                                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:9999/FragranceWorld/LoginGoogleHandler&response_type=code
		   &client_id=784674948217-jtonajckjip23ebqt8c642n4g655gao2.apps.googleusercontent.com&approval_prompt=force" class="btn-type1">login with google</a>
                                                <a href="registerpage.jsp"> <button type="submit" class="btn-type1">Register Me</button></a>
                                            </div>
                                            

                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Mt Detail Section of the Page end -->




            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- banner frame start here -->
                        <div class="banner-frame toppadding-zero">
                            <!-- banner 5 white start here -->
                            <div class="banner-5 white wow fadeInLeft" data-wow-delay="0.4s">
                                <img src="http://placehold.it/590x565" alt="image description">
                                <div class="holder">
                                    <div class="texts">
                                        <strong class="title">FURNITURE DESIGNS IDEAS</strong>
                                        <h3><strong>New</strong> Collection</h3>
                                        <p>Consectetur adipisicing elit. Beatae accusamus, optio, repellendus inventore</p>
                                        <span class="price-add">$ 79.00</span>
                                    </div>
                                </div>
                            </div><!-- banner 5 white end here -->
                            <!-- banner 6 white start here -->
                            <div class="banner-6 white wow fadeInRight" data-wow-delay="0.4s">
                                <img src="http://placehold.it/275x565" alt="image description">
                                <div class="holder">
                                    <strong class="sub-title">SOFAS &amp; ARMCHAIRS</strong>
                                    <h3>3 Seater Leather Sofa</h3>
                                    <span class="offer">
                                        <span class="price-less">$ 659.00</span>
                                        <span class="prices">$ 499.00</span>
                                    </span>
                                    <a href="product-detail.html" class="btn-shop">
                                        <span>shop now</span>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </div><!-- banner 5 white end here -->
                            <!-- banner box two start here -->
                            <div class="banner-box two">
                                <!-- banner 7 right start here -->
                                <div class="banner-7 right wow fadeInUp" data-wow-delay="0.4s">
                                    <img src="http://placehold.it/295x275" alt="image description">
                                    <div class="holder">
                                        <h2><strong>ACRYLIC FABRIC <br>BEAN BAG</strong></h2>
                                        <ul class="mt-stars">
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                        </ul>
                                        <div class="price-tag">
                                            <span class="price">$ 99.00</span>
                                            <a class="shop-now" href="product-detail.html">SHOP NOW</a>
                                        </div>
                                    </div>
                                </div><!-- banner 7 right end here -->
                                <!-- banner 8 start here -->
                                <div class="banner-8 wow fadeInDown" data-wow-delay="0.4s">
                                    <img src="http://placehold.it/295x275" alt="image description">
                                    <div class="holder">
                                        <h2><strong>CHAIR WITH <br>ARMRESTS</strong></h2>
                                        <ul class="mt-stars">
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                        </ul>
                                        <div class="price-tag">
                                            <span class="price-off">$ 129.00</span>
                                            <span class="price">$ 99.00</span>
                                            <a class="btn-shop" href="product-detail.html">
                                                <span>HURRY UP!</span> 
                                                <i class="fa fa-angle-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div><!-- banner 8 start here -->
                            </div>
                        </div><!-- banner frame end here -->
                    </div>
                </div>
            </div>
        </main><!-- Main of the Page end -->
        <%@include file = "footer.jsp" %>   
        
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/login.js"></script>
        
        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>
    </body>
</html>
