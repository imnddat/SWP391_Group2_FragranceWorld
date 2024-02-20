<%-- 
    Document   : content
    Created on : Feb 20, 2024, 3:55:05 PM
    Author     : Thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Schön. | eCommerce HTML5 Template</title>
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
    </body>
</html>
