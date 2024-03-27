<%-- 
    Document   : index
    Created on : Jan 30, 2024, 11:16:23 PM
    Author     : Thinkpad
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
        <title>SWP team2</title>
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
            <!-- W1 start here -->
            <div class="w1">

                <%@include file = "panner.jsp" %>

                <!-- mt main start here -->
                <main id="mt-main">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <%@include file = "banner.jsp" %>

                                <%@include file = "search.jsp" %>	
                            </div>
                        </div>
                    </div>

                    <%@include file = "bestseller.jsp" %>

                    <%@include file = "hotsale.jsp" %>
                </main><!-- mt main end here -->

                <%@include file = "footer.jsp" %>        

            </div><!-- W1 end here -->
            <span id="back-top" class="fa fa-arrow-up"></span>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        <script>
            // JavaScript code để kiểm tra session timeout và hiển thị cảnh báo
            $(document).ready(function () {
                // Kiểm tra nếu session timeout
            <% if (request.getAttribute("sessionTimeout") != null) { %>
                alert("Session đã hết hạn, vui lòng đăng nhập lại.");
                // Chuyển hướng về trang login
                window.location.replace("${pageContext.request.contextPath}/login");
            <% } %>
            });
        </script>

        <script src="${pageContext.request.contextPath}/js/addToCart.js"></script>
        <script src="${pageContext.request.contextPath}/js/addToWishlist.js"></script>


        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.main.js"></script>
    </body>
</html>
