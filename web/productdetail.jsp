<%-- 
    Document   : productdetail
    Created on : Feb 18, 2024, 2:06:21 PM
    Author     : Thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Schön. | eCommerce HTML5 Template</title>
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
        <script src="js/productDetail.js" defer></script>
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
                <!-- mt side menu start here -->     
            </div><!-- mt side menu end here -->
            <!-- mt main start here -->
            <main id="mt-main">
                <!-- Mt Product Detial of the Page -->
                <section class="mt-product-detial wow fadeInUp" data-wow-delay="0.4s">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                             
                                    <!-- Slider of the Page -->
                                    <div class="slider">
                                        <!-- Comment List of the Page -->
                                        <ul class="list-unstyled comment-list">
                                            <li><a href="#"><i class="fa fa-heart"></i>27</a></li>
                                            <li><a href="#"><i class="fa fa-comments"></i>12</a></li>
                                            <li><a href="#"><i class="fa fa-share-alt"></i>14</a></li>
                                        </ul>
                                        <!-- Comment List of the Page end -->
                                        <!-- Product Slider of the Page -->
                                        <div class="product-slider">
                                            <c:forEach items="${image}" var="i">
                                                <div class="slide">
                                                    <img src="http://localhost:8080/FragranceWorld/images/${i}" alt="image descrption">
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <!-- Product Slider of the Page end -->
                                        <!-- Pagg Slider of the Page -->
                                        <ul class="list-unstyled slick-slider pagg-slider">
                                            <c:forEach items="${image}" var="i">
                                                <div class="slide">
                                                    <li><div class="img"><img src="http://localhost:8080/FragranceWorld/images/${i}" alt="image description"></div></li>
                                                </div>
                                            </c:forEach>
                                        </ul>
                                        <!-- Pagg Slider of the Page end -->
                                    </div>
                                    <!-- Slider of the Page end -->
                                    <!-- Detail Holder of the Page -->
                                    <div class="detial-holder">
                                        <!-- Breadcrumbs of the Page -->
                                        <ul class="list-unstyled breadcrumbs">
                                            <li><a href="#">Chairs <i class="fa fa-angle-right"></i></a></li>
                                            <li>Products</li>
                                        </ul>
                                        <!-- Breadcrumbs of the Page end -->
                                        <h2>${product.nameProduct}</h2>
                                        <!-- Rank Rating of the Page -->
                                        <div class="rank-rating">
                                            <ul class="list-unstyled rating-list">
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o"></i></a></li>
                                            </ul>
                                            <span class="total-price">Reviews (12)</span>
                                        </div>
                                        <!-- Rank Rating of the Page end -->
                                        <ul class="list-unstyled list">
                                            <li><a href="#"><i class="fa fa-share-alt"></i>SHARE</a></li>
                                            <li><a href="#"><i class="fa fa-exchange"></i>COMPARE</a></li>
                                            <li><a href="#"><i class="fa fa-heart"></i>ADD TO WISHLIST</a></li>
                                        </ul>
                                        <div class="total-price" style="font-size: 18px"> 
                                            <p>Hãng: ${brand}</p>
                                            <p>Giới tính: ${gender}</p>
                                            <p>Mùi hương: ${scent}</p>
                                        </div>
                                        <br>
                                        <div class="button-holder">
                                            <p style="font-size: 18px">Lựa chọn dung tích:   </p>
                                            <c:forEach items="${volume}" var="v">
                                                <button onclick="updatePrice(this)" value='${v.id}' price='${v.price}' style="font-size: 18px">
                                                    ${v.capacity} ML
                                                </button>
                                            </c:forEach>
                                            </p>
                                        </div>
                                        <br>
                                        <br>
                                        <div class="text-holder" style="display: flex;">
                                            <span id="field-price" class="price" value="${priceId}">$ ${price} </span>
<!--                                            <del id="field-discount" value="${discount}">${discount * price}</del>-->
                                        </div>


                                        <!-- Product Form of the Page -->
                                        <form action="#" class="product-form">
                                            <fieldset>
                                                <div class="row-val">
                                                    <label for="qty">qty</label>
                                                    <input type="number" id="qty" placeholder="1" min="0">
                                                </div>
                                                <div class="row-val">
                                                    <button type="submit">ADD TO CART</button>
                                                </div>
                                            </fieldset>
                                        </form>
                                        <!-- Product Form of the Page end -->
                                    </div>
                                    <!-- Detail Holder of the Page end -->
                                
                            </div>
                        </div>
                    </div>
                </section><!-- Mt Product Detial of the Page end -->
                <div class="product-detail-tab wow fadeInUp" data-wow-delay="0.4s">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="mt-tabs text-center text-uppercase">
                                    <li><a href="#tab1" class="active">DESCRIPTION</a></li>

                                    <li><a href="#tab3">REVIEWS (12)</a></li>F
                                </ul>
                                <div class="tab-content">
                                    <div id="tab1">
                                        <p>${product.description}</p>									
                                    </div>

                                    <div id="tab3">
                                        <div class="product-comment">
                                            <div class="col-md-6">
                                                <h4 class="mb-4">${totalReview} review for ${detail.name}</h4>

                                                <c:forEach items="${listReview}" var="lr">           
                                                    <div class="media mb-4">
                                                        <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                                        <div class="media-body">                                        
                                                            <h6>${lr.name}<small> - <i>${lr.date}</i></small></h6>
                                                            <div class="text-primary mb-2">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star-half-alt"></i>
                                                                <i class="far fa-star"></i>
                                                            </div>
                                                            <p>${lr.review}</p>
                                                        </div>
                                                    </div>
                                                </c:forEach>    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- related products start here -->
                <div class="related-products wow fadeInUp" data-wow-delay="0.4s">
                    <div class="container">
                        <<h2>LATEST PRODUCT</h2>
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
                    </div><!-- related products end here -->
                </div>
            </main><!-- mt main end here -->
            <%@include file = "footer.jsp" %>  	
        </div><!-- W1 end here -->
        <span id="back-top" class="fa fa-arrow-up"></span>
    </div>
    <script src="js/productDetail.js"></script>
    <!-- include jQuery -->
    <script src="js/jquery.js"></script>
    <!-- include jQuery -->
    <script src="js/plugins.js"></script>
    <!-- include jQuery -->
    <script src="js/jquery.main.js"></script>
</body>
</html>

