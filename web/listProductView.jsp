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

                                    <!-- search by name -->    
                                    <form action="ListProductViewController" id="searchbyName">
                                        <div class="input-group" style="display: flex">
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder="Search by name"
                                                name="searchbyName"
                                                value="${searchbyNames}"
                                                />
                                            <div class="input-group-append">
                                                <button class="search-button btn btn-primary" type="submit">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>

                                    <br>


                                    <span class="sub-title">Filter by Brands</span>
                                    <!-- nice-form start here -->
                                    <c:set var="listbrand" value="${requestScope.listbrand}"/> 
                                    <c:set var="cid" value="${requestScope.cid}"/> 
                                    <form action="ListProductViewController">
                                        <ul class="list-unstyled nice-form">
                                            <c:forEach begin="0" end="${listbrand.size()-1}" var="i">
                                                <li>
                                                    <label >
                                                        <input type="checkbox" name="idbrands" value="${listbrand.get(i).getId()}" 

                                                               <c:forEach var="b" items="${bvalues}">
                                                                   ${b == listbrand.get(i).getId() ?"checked":""}
                                                               </c:forEach>
                                                               onclick="this.form.submit()"    >
                                                        <span class="fake-label">${listbrand.get(i).getName()} 
                                                        </span>
                                                    </label>
                                                </li>
                                            </c:forEach>                                          
                                        </ul><!-- nice-form end here -->
                                    </form>
                                    <span class="sub-title">Filter by Price</span>
                                    <form action="ListProductViewController">
                                        <div class="price">
                                            <input type="checkbox" name="filter" value="" onclick="this.form.submit()" />
                                            <label class="custom-control-label" >All Price </label >
                                        </div>
                                        <div class="price" >
                                            <input  type="checkbox" name="filter"  value="price-10-100" onclick="this.form.submit()" />
                                            <label class="custom-control-label"  >$10 - $100</label >
                                        </div>
                                        <div class="price" >
                                            <input type="checkbox" name="filter" value="price-100-250" onclick="this.form.submit()"/>
                                            <label class="custom-control-label"  >$100 - $250</label >
                                        </div>
                                        <div class="price">
                                            <input type="checkbox" name="filter" value="price-250-500" onclick="this.form.submit()" />
                                            <label class="custom-control-label" >$250 - $500</label  >
                                        </div>
                                        <div class="price">
                                            <input  type="checkbox" name="filter" value="price-500up" onclick="this.form.submit()" />
                                            <label  >$500+</label>
                                        </div>
                                    </form>
                                </section><!-- shop-widget filter-widget of the Page end here -->
                                <!-- shop-widget of the Page start here -->


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
                                                        <li ><a href="./ListProductViewController?sortType=1&id=${requestScope.id}&volumeSearchCapacity=${requestScope.volumeSearchCapacity}&productSearchScent=${requestScope.productSearchScent}&brandSortMakebyFrom=${requestScope.brandSortMakebyFrom}&brandSort=${requestScope.brandSort}&page=1&searchbyName=${searchbyNames}">Name: A-Z </a></li>
                                                        <li ><a href="./ListProductViewController?sortType=2&id=${requestScope.id}&volumeSearchCapacity=${requestScope.volumeSearchCapacity}&productSearchScent=${requestScope.productSearchScent}&brandSortMakebyFrom=${requestScope.brandSortMakebyFrom}&brandSort=${requestScope.brandSort}&page=1&searchbyName=${searchbyNames}">Name: Z-A</a></li>
                                                        <li ><a href="./ListProductViewController?sortType=3&id=${requestScope.id}&volumeSearchCapacity=${requestScope.volumeSearchCapacity}&productSearchScent=${requestScope.productSearchScent}&brandSortMakebyFrom=${requestScope.brandSortMakebyFrom}&brandSort=${requestScope.brandSort}&page=1&searchbyName=${searchbyNames}">Price: Low to Hight</a></li>
                                                        <li ><a href="ListProductViewController?sortType=4&id=${requestScope.id}&volumeSearchCapacity=${requestScope.volumeSearchCapacity}&productSearchScent=${requestScope.productSearchScent}&brandSortMakebyFrom=${requestScope.brandSortMakebyFrom}&brandSort=${requestScope.brandSort}&page=1&searchbyName=${searchbyNames}">Price: Hight to Low</a> </li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li><a class="mt-viewswitcher" href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a></li>
                                            <li><a class="mt-viewswitcher" href="#"><i class="fa fa-th-list" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div><!-- btn-box end here -->
                                    <!-- mt-textbox start here -->
                                    <div class="mt-textbox">
                                        <p><a hrer="#">View all product</a></p>
                                    </div><!-- mt-textbox end here -->
                                </header><!-- mt shoplist header end here -->

                                <!-- mt productlisthold start here -->


                                <ul class="mt-productlisthold list-inline"> 


                                    <c:forEach items="${requestScope.listProduct}" var="p" >

                                        <li>

                                            <!-- mt product1 large start here -->
                                            <div class="mt-product1 large">
                                                <div class="box">
                                                    <div class="b1">
                                                        <div class="b2">
                                                            <a href="ProductDetailController?productId=${p.getId()}"><img src="${p.defaultImg}" alt="image description"></a>
                                                            <ul class="mt-stars">
                                                                <li><i class="fa fa-star"></i></li>
                                                                <li><i class="fa fa-star"></i></li>
                                                                <li><i class="fa fa-star"></i></li>
                                                                <li><i class="fa fa-star-o"></i></li>
                                                            </ul>
                                                            <ul class="links">
                                                                <form class="addToCartForm" action="cart" method="post">
                                                                    <li><a href="#"><i class="icon-handbag"></i><span><button style="border: none" type="submit">Add to Cart</button></span></a></li>                                                         
                                                                    <li><a href="#" class="addtowishlist"><i class="icomoon icon-heart-empty"></i></a></li>
                                                                    <li><a href="#"><i class="icomoon icon-exchange"></i></a></li>
                                                                    <input type="hidden" name="id" value="${p.getId()}" />
                                                                    <input type="hidden" name="quantity" value="1" />
                                                                    <input type="hidden" name="price" value="${p.getVolumes().get(0).getPrice()}" />
                                                                    <input type="hidden" name="volume" value="${p.getVolumes().get(0).getCapacity()}" />
                                                                </form>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="txt">
                                                    <strong class="title"><a href="ProductDetailController?productId=${p.getId()}">${p.nameProduct}</a></strong>
                                                    <span class="price"><i class="fa fa-eur"></i> <span>$${p.getVolumes().get(0).getPrice()}</span></span>


                                                </div>
                                            </div><!-- mt product1 center end here -->

                                        </li>

                                    </c:forEach> 
                                </ul><!-- mt productlisthold end here -->      

                                <!-- mt pagination start here -->
                                <nav class="mt-pagination">
                                    <ul class="list-inline">
                                        <c:set var="k" value="${requestScope.searchbyName}"/> 
                                        <c:forEach begin="${1}" end="${requestScope.num}" step="1" var="i">
                                            <li><a class="${i==page?"active":""}" href="ListProductViewController?sortType=1&id=${requestScope.id}&volumeSearchCapacity=${requestScope.volumeSearchCapacity}&productSearchScent=${requestScope.productSearchScent}&brandSortMakebyFrom=${requestScope.brandSortMakebyFrom}&brandSort=${requestScope.brandSort}&page=${i}&searchbyName=${searchbyNames}">${i}</a></li>      
                                            </c:forEach> 
                                    </ul>
                                </nav><!-- mt pagination end here -->
                            </div>
                        </div>
                    </div>
                </main><!-- mt main end here -->
                <%@include file = "footer.jsp" %>   
            </div><!-- W1 end here -->
            <span id="back-top" class="fa fa-arrow-up"></span>
        </div>

        <script src="${pageContext.request.contextPath}/js/addToCart.js"></script>    
        <script src="${pageContext.request.contextPath}/js/addToWishlist.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>
    </body>
</html>
