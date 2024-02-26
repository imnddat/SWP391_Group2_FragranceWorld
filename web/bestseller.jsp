<%-- 
    Document   : bestseller
    Created on : Feb 20, 2024, 2:15:36 PM
    Author     : Thinkpad
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- mt bestseller start here -->
        <div class="mt-bestseller bg-grey text-center wow fadeInUp" data-wow-delay="0.4s">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 mt-heading text-uppercase">
                        <h2 class="heading">BEST SELLER </h2>
                       
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="bestseller-slider">
                            <c:forEach items="${requestScope.MaxPriceProducts}" var="p">                              
                            <div class="slide">
                              
                                <div class="mt-product1 large">
                                    <div class="box">
                                        <div class="b1">
                                            <div class="b2">
                                                <a href="product-detail.html"><img src="${p.getDefaultImg()}" alt="image description" style="height: 275; width: 285"></a>
                                                <span class="caption">
                                                    <span class="best-price">Best Price</span>
                                                </span>
                                                <ul class="links add">
                                                    <li><a href="#"><i class="icon-handbag"></i></a></li>
                                                    <li><a href="#"><i class="icomoon icon-heart-empty"></i></a></li>
                                                    <li><a href="#"><i class="icomoon icon-exchange"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="txt">
                                        <strong class="title"><a href="product-detail.html">${p.getNameProduct()}</a></strong>
                                        <span class="price"><i class="fa fa-eur"></i> <span>${p.getVolumes().get(0).getPrice()}</span></span>
                                    </div>
                                </div> 
                            </div>
                              </c:forEach>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- mt bestseller start here -->

        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>  

    </body>
</html>
