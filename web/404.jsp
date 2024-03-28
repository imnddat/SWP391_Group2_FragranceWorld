<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.OrderWithItems"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Order</title>
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
        <script src="https://kit.fontawesome.com/46db81caa4.js" crossorigin="anonymous"></script>
        <div class="w1">
            <%@include file = "panner.jsp" %>
            <!-- Main of the Page -->
            <main id="mt-main">
                <!-- Mt Process Section of the Page -->
                <div class="mt-process-sec wow fadeInUp" data-wow-delay="0.4s">
                    <div class="container">
                        <!-- Mt Error Sec of the Page -->
                        <section class="mt-error-sec dark">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xs-12 text-center">
                                        <span class="error-code montserrat">404</span>
                                        <h1 class="text-uppercase montserrat">PAGE NOT FOUND!</h1>
                                        <div class="txt">
                                            <p>We're sorry, but something went wrong.</p>
                                        </div>
                                        <center>
                                            <a href="${pageContext.request.contextPath}" class="btn-back text-uppercase">BACK TO HOME</a>
                                        </center>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div><!-- Mt Process Section of the Page end -->
                <!-- Mt Detail Section of the Page -->

                <!-- Mt Detail Section of the Page end -->

            </main><!-- Main of the Page end here -->
            <%@include file = "footer.jsp" %>   
        </div>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/login.js"></script>

        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>
        <script src="js/Order.js"></script>
    </body>
</html>
