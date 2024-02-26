<%-- 
    Document   : hotsale
    Created on : Feb 20, 2024, 2:19:00 PM
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
        <div class="mt-smallproducts wow fadeInUp" data-wow-delay="0.4s">
            <div class="container">
                <div class="row">                      
                        <div class="col-xs-12 col-sm-6 col-md-3 mt-paddingbottomsm">                            
                            <h3 class="heading">Hot Sale</h3>
                            <c:forEach items="${requestScope.HotSaleProducts}" var="p">    
                            <!-- mt product4 start here -->
                            <div class="mt-product4 mt-paddingbottom20">
                                <div class="img">
                                    <a href="product-detail.html"><img alt="image description" src="${p.getDefaultImg()}" style="height: 80; width: 80"></a>
                                </div>
                                <div class="text">
                                    <div class="frame">
                                        <strong><a href="product-detail.html">${p.getNameProduct()}</a></strong>
                                        <ul class="mt-stars">
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                        </ul>
                                    </div>
                                    <del class="off">$115,00</del>
                                    <span class="price">$${p.getVolumes().get(0).getPrice()}</span>
                                </div>
                            </div><!-- mt product4 end here -->     
                               </c:forEach>
                        </div>
                   
                    <div class="col-xs-12 col-sm-6 col-md-3 mt-paddingbottomsm">
                        <h3 class="heading">Featured Products</h3>
                        <!-- mt product4 start here -->
                        <div class="mt-product4 mt-paddingbottom20">
                            <div class="img">
                                <a href="product-detail.html"><img alt="image description" src="http://placehold.it/80x80"></a>
                            </div>
                            <div class="text">
                                <div class="frame">
                                    <strong><a href="product-detail.html">Bombi Chair</a></strong>
                                </div>
                                <del class="off">$75,00</del>
                                <span class="price">$33,00</span>
                            </div>
                        </div><!-- mt product4 end here -->         
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 mt-paddingbottomxs">
                        <h3 class="heading">Sale Products</h3>
                        <!-- mt product4 start here -->
                        <div class="mt-product4 mt-paddingbottom20">
                            <div class="img">
                                <a href="product-detail.html"><img alt="image description" src="http://placehold.it/80x80"></a>
                            </div>
                            <div class="text">
                                <div class="frame">
                                    <strong><a href="product-detail.html">Marvelous Wooden Chair</a></strong>
                                </div>
                                <del class="off">$75,00</del>
                                <span class="price">$55,00</span>
                            </div>
                        </div><!-- mt product4 end here -->                 
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <h3 class="heading">Top Rated Products</h3>
                        <!-- mt product4 start here -->
                        <div class="mt-product4 mt-paddingbottom20">
                            <div class="img">
                                <a href="product-detail.html"><img alt="image description" src="http://placehold.it/80x80"></a>
                            </div>
                            <div class="text">
                                <div class="frame">
                                    <strong><a href="product-detail.html">Egon Wooden Chair</a></strong>
                                    <ul class="mt-stars">
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star-o"></i></li>
                                    </ul>
                                </div>
                                <del class="off">$75,00</del>
                                <span class="price">$55,00</span>
                            </div>
                        </div><!-- mt product4 end here -->
                        <!-- mt product4 start here -->                 
                    </div>
                </div>
            </div>
        </div><!-- mt bestseller end here -->


    </body>
</html>
