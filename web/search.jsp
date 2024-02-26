<%-- 
    Document   : search
    Created on : Feb 20, 2024, 2:27:47 PM
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
        <!-- mt producttabs start here -->
        <div class="mt-producttabs wow fadeInUp" data-wow-delay="0.4s">
            <!-- producttabs start here -->
            <ul class="producttabs">
                <li>
                    <form action="HomeController" >
                        <div class="mt-holder">
                            <div class="mt-frame">
                                <fieldset>
                                    <input type="text" value="${keywords}" name="keywords" placeholder="Search by products">
                                    <span class="icon-microphone"></span>
                                    <button  type="submit">Go</button>
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </li>
                <li><a href="#tab1" class="active">FEATURED</a></li>
                <li><a href="#tab2"> HOT TREND</a></li>
                <li><a href="#tab3">BEST SELLER</a></li>
                <li><a href="#tab4">SALE</a></li>
            </ul>
            <!-- producttabs end here -->
            <div class="tab-content text-center">
                <div id="tab1">
                    <!-- tabs slider start here -->
                    <div class="tabs-slider">
                        <!-- slide start here -->
                        <c:forEach items="${requestScope.allProducts}" var="p" > 

                            <div class="slide">
                                <!-- mt product1 center start here -->
                                <div class="mt-product1 mt-paddingbottom20" >                               
                                    <div class="box">
                                        <div class="b1">
                                            <div class="b2">                                        
                                                <a href="product-detail.html">
                                                    <img src="${p.getDefaultImg()}" alt="" style="height: 215; width: 215">
                                                </a>                                          
                                                <span class="caption">
                                                    <span class="new">NEW</span>
                                                </span>
                                                <ul class="mt-stars">
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                </ul>
                                                <ul class="links">
                                                    <li><a href="#"><i class="icon-handbag"></i><span>Add to Cart</span></a></li>
                                                    <li><a href="#"><i class="icomoon icon-heart-empty"></i></a></li>
                                                    <li><a href="#"><i class="icomoon icon-exchange"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>                               
                                    <div class="txt">
                                        <strong class="title"><a href="product-detail.html" >${p.getNameProduct()}</a></strong>                                    
                                    </div>                              
                                </div> 

                                <!-- mt product1 center start here -->
                                <!-- mt product1 center end here -->
                            </div>
                        </c:forEach>

                        <!-- slide end here -->  
                    </div>
                </div>
                <!-- tabs slider end here -->

                <!-- tab2 --> 
                <div id="tab2">
                    <!-- tabs slider start here -->
                    <div class="tabs-slider">
                        <!-- slide start here -->
                        <div class="slide">
                            <!-- mt product1 center start here -->
                            <div class="mt-product1 mt-paddingbottom20">
                                <div class="box">
                                    <div class="b1">
                                        <div class="b2">
                                            <a href="product-detail.html"><img src="images/AF0001-01.png" alt="image description" height="215" width="215"></a>
                                            <ul class="mt-stars">
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                            <ul class="links">
                                                <li><a href="#"><i class="icon-handbag"></i><span>Add to Cart</span></a></li>
                                                <li><a href="#"><i class="icomoon icon-heart-empty"></i></a></li>
                                                <li><a href="#"><i class="icomoon icon-exchange"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="txt">
                                    <strong class="title"><a href="product-detail.html">Easy chair with armrests</a></strong>                                   
                                </div>
                            </div>
                            <!-- mt product1 center end here -->

                        </div>
                        <!-- slide end here -->
                    </div>
                    <!-- tabs slider end here -->
                </div>

                <!-- tab3 -->
                <div id="tab3">
                    <!-- tabs slider start here -->
                    <div class="tabs-slider">
                        <!-- slide start here -->
                        <div class="slide">
                            <!-- mt product1 center start here -->
                            <div class="mt-product1 mt-paddingbottom20">
                                <div class="box">
                                    <div class="b1">
                                        <div class="b2">
                                            <a href="product-detail.html"><img src="http://placehold.it/215x215" alt="image description"></a>
                                            <span class="caption">
                                                <span class="new">NEW</span>
                                            </span>
                                            <ul class="mt-stars">
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                            <ul class="links">
                                                <li><a href="#"><i class="icon-handbag"></i><span>Add to Cart</span></a></li>
                                                <li><a href="#"><i class="icomoon icon-heart-empty"></i></a></li>
                                                <li><a href="#"><i class="icomoon icon-exchange"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="txt">
                                    <strong class="title"><a href="product-detail.html">Puff Chair</a></strong>
                                </div>
                            </div><!-- mt product1 center end here -->
                        </div>
                        <!-- slide end here -->

                    </div>
                    <!-- tabs slider end here -->
                </div>
                <!-- tab4 -->
                <div id="tab4">
                    <!-- tabs slider start here -->
                    <div class="tabs-slider">
                        <!-- slide start here -->
                        <div class="slide">
                            <!-- mt product1 center start here -->
                            <div class="mt-product1 mt-paddingbottom20">
                                <div class="box">
                                    <div class="b1">
                                        <div class="b2">
                                            <a href="product-detail.html"><img src="http://placehold.it/215x215" alt="image description"></a>
                                            <span class="caption">
                                                <span class="new">NEW</span>
                                            </span>
                                            <ul class="mt-stars">
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                            <ul class="links">
                                                <li><a href="#"><i class="icon-handbag"></i><span>Add to Cart</span></a></li>
                                                <li><a href="#"><i class="icomoon icon-heart-empty"></i></a></li>
                                                <li><a href="#"><i class="icomoon icon-exchange"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="txt">
                                    <strong class="title"><a href="product-detail.html">Puff Chair</a></strong>
                                </div>
                            </div><!-- mt product1 center end here -->
                        </div>
                        <!-- slide end here -->
                    </div>
                    <!-- tabs slider end here -->
                </div>
            </div>
            <!-- mt producttabs end here -->
            <!-- include jQuery -->
            <script src="js/jquery.js"></script>
            <!-- include jQuery -->
            <script src="js/plugins.js"></script>
            <!-- include jQuery -->
            <script src="js/jquery.main.js"></script>
    </body>
</html>
