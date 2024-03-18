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
        <title>SWPgroup2</title>
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
            <section class="mt-contact-banner" style="background-image: url();">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <h1>login</h1>
                            <nav class="breadcrumbs">
                                <ul class="list-unstyled">
                                    <li><a href="HomeController">home <i class="fa fa-angle-right"></i></a></li>
                                    <li>login</li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Mt Content Banner of the Page end -->
            <!-- Mt About Section of the Page -->
<!--            <section class="mt-about-sec" style="padding-bottom: 0;">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="txt">
                                <h2>login</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </section>-->
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
