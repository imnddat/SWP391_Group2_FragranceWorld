<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : listProductView
    Created on : Feb 26, 2024, 4:13:55 AM
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
                    <!-- Mt Contact Banner of the Page -->
                    <section class="mt-contact-banner style4 wow fadeInUp" data-wow-delay="0.4s" style="background-image: url(images/banner1.png); resize: 100%">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12 text-center">
                                    <h1>CHAIRS</h1>
                                    <!-- Breadcrumbs of the Page -->             
                                </div>
                            </div>
                        </div>
                    </section><!-- Mt Contact Banner of the Page end -->
                    <div class="container">
                        <div class="row">
                            <!-- sidebar of the Page start here -->
                            <aside id="sidebar" class="col-xs-12 col-sm-4 col-md-3 wow fadeInLeft" data-wow-delay="0.4s">
                                <!-- shop-widget filter-widget of the Page start here -->
                                <section class="shop-widget filter-widget bg-grey">
                                    <h2>FILTER</h2>
                                    <span class="sub-title">Filter by Brands</span>
                                    <!-- nice-form start here -->
                                    <form method="get" action="ListProductViewController">
                                        <ul class="list-unstyled nice-form">
                                            <li>
                                                <label for="check-1">
                                                    <input id="check-1" name="brandID" value="" type="checkbox">
                                                    <span class="fake-input"></span>
                                                    <span class="fake-label">Alll</span>
                                                </label>
                                                <span class="num">2</span>
                                            </li>
                                            <li>
                                                <label for="check-1">
                                                    <input id="check-1" name="brandID" value="id brands" type="checkbox">
                                                    <span class="fake-input"></span>
                                                    <span class="fake-label">Casali</span>
                                                </label>
                                                <span class="num">2</span>
                                            </li>

                                        </ul><!-- nice-form end here -->
                                    </form>
                                    <span class="sub-title">Filter by Price</span>
                                    <form method="get" action="ListProductViewController">
                                        <div class="price-range">

                                            <div class="range-slider">
                                                <span class="dot"></span>
                                                <span class="dot dot2"></span>
                                            </div>
                                            <span class="price">
                                               From: <input type="number" name="priceFrom"> To <input type="number" name="priceTo"><br>   
                                            </span>
                                            <button type="submit" class="filter-btn">Filter</a></button>

                                        </div>
                                        <div>
                                            Search: <input type="text" name="search"><br>
                                        </div>
                                    </form>
                                </section><!-- shop-widget filter-widget of the Page end here -->
                                <!-- shop-widget of the Page start here -->
                                <section class="shop-widget">
                                    <h2>PERFUME BRAND</h2>
                                    <form method="get" action="ListProductViewController">
                                        <!-- category list start here -->
                                        <ul class="list-unstyled category-list">
                                            <li>
                                                <a href="#">
                                                    <span class="name">CHAIRS</span>
                                                    <span class="num">12</span>
                                                </a>
                                            </li>
                                        </ul><!-- category list end here -->
                                    </form>
                                </section><!-- shop-widget of the Page end here -->

                            </aside><!-- sidebar of the Page end here -->

                            <div class="col-xs-12 col-sm-8 col-md-9 wow fadeInRight" data-wow-delay="0.4s">
                                <!-- mt shoplist header start here -->
                                <header class="mt-shoplist-header">
                                    <!-- btn-box start here -->
                                    <div class="btn-box">
                                        <ul class="list-inline">
                                            <li>
                                                <a href="#" class="drop-link">
                                                    Default Sorting <i aria-hidden="true" class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="drop">
                                                    <ul class="list-unstyled">
                                                        <li value=" oder by p.[nameProduct] asc "><a href="/teenconroller?sortid=1">Name: Low to Hight </a></li>
                                                        <li value=" oder by p.[nameProduct] desc "><a href="/teenconroller?sortid=2">Name: Hight to Low </a></li>
                                                        <li value=" ORDER BY vp.price ASC "><a href="/teenconroller?sortid=3">Price: Low to Hight</a></li>
                                                        <li value=" ORDER BY vp.price DESC "><a href="/teenconroller?sortid=3">Price: Hight to Low</a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li><a class="mt-viewswitcher" href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a></li>
                                            <li><a class="mt-viewswitcher" href="#"><i class="fa fa-th-list" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div><!-- btn-box end here -->
                                    <!-- mt-textbox start here -->
                                    <div class="mt-textbox">
                                        <p>View all product </p>
                                    </div><!-- mt-textbox end here -->
                                </header><!-- mt shoplist header end here -->



                                <!-- mt productlisthold start here -->

                                <c:forEach items="${requestScope.listProduct}" var="p" >   
                                    <ul class="mt-productlisthold list-inline">     
                                        <li>

                                            <!-- mt product1 large start here -->
                                            <div class="mt-product1 large">
                                                <div class="box">
                                                    <div class="b1">
                                                        <div class="b2">
                                                            <a href="product-detail.html"><img src="${p.defaultImg}" alt="image description"></a>
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
                                                    <strong class="title"><a href="product-detail.html">${p.nameProduct}</a></strong>
                                                    <span class="price"><i class="fa fa-eur"></i> <span>$${p.getVolumes().get(0).getPrice()}</span></span>
                                                </div>
                                            </div><!-- mt product1 center end here -->

                                        </li>	 
                                    </ul><!-- mt productlisthold end here -->      
                                </c:forEach> 


                                <!-- mt pagination start here -->
                                <c:forEach begin="${1}" end="${requestScope.num}" step="1" var="i">
                                    <nav class="mt-pagination">
                                        <ul class="list-inline">
                                            <li><a class="${i==page?"active":""}" href="ListProductViewController?id=${requestScope.id}&page=${i}">${i}</a></li>       
                                        </ul>
                                    </nav><!-- mt pagination end here -->
                                </c:forEach> 
                            </div>

                        </div>
                    </div>
                </main><!-- mt main end here -->
                <%@include file = "footer.jsp" %>   
            </div><!-- W1 end here -->
            <span id="back-top" class="fa fa-arrow-up"></span>
        </div>
        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>
    </body>
</html>
