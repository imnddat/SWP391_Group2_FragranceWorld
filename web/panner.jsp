<%-- 
    Document   : panner
    Created on : Feb 6, 2024, 7:59:31 PM
    Author     : Thinkpad
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    </head><!-- comment -->

    <body>
        <!-- W1 start here -->
        <!-- mt header style4 start here -->
        <header id="mt-header" class="style4">
            <!-- mt bottom bar start here -->
            <div class="mt-bottom-bar">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- mt logo start here -->
                            <div class="mt-logo"><a href="#"><img src="images/mt-logo.png" alt="schon"></a></div>
                            <!-- mt icon list start here -->
                            <ul class="mt-icon-list">
                                <li class="hidden-lg hidden-md">
                                    <a href="#" class="bar-opener mobile-toggle">
                                        <span class="bar"></span>
                                        <span class="bar small"></span>
                                        <span class="bar"></span>
                                    </a>
                                </li>                                  
                                <li class="drop">
                                    <a href="#" class="icon-heart cart-opener"><span style="margin-bottom: -3px;" class="num">3</span></a>
                                    <!-- mt drop start here -->
                                    <div class="mt-drop">
                                        <!-- mt drop sub start here -->
                                        <div class="mt-drop-sub">
                                            <!-- mt side widget start here -->
                                            <div class="mt-side-widget">
                                                <!-- cart row start here -->
                                                <div class="cart-row">
                                                    <a href="#" class="img"><img src="http://placehold.it/75x75" alt="image" class="img-responsive"></a>
                                                    <div class="mt-h">
                                                        <span class="mt-h-title"><a href="#">Marvelous Modern 3 Seater</a></span>
                                                        <span class="price"><i class="fa fa-eur" aria-hidden="true"></i> 599,00</span>
                                                    </div>
                                                    <a href="#" class="close fa fa-times"></a>
                                                </div><!-- cart row end here -->
                                             
                                                <!-- cart row total start here -->
                                                <div class="cart-row-total">
                                                    <span class="mt-total">Add them all</span>
                                                    <span class="mt-total-txt"><a href="#" class="btn-type2">add to CART</a></span>
                                                </div>
                                                <!-- cart row total end here -->
                                            </div><!-- mt side widget end here -->
                                        </div>
                                        <!-- mt drop sub end here -->
                                    </div><!-- mt drop end here -->
                                    <span class="mt-mdropover"></span>
                                </li>
                                <li class="drop">
                                    <a href="#" class="cart-opener">
                                        <span class="icon-handbag"></span>
                                        <span class="num">3</span>
                                    </a>
                                    <!-- mt drop start here -->
                                    <div class="mt-drop">
                                        <!-- mt drop sub start here -->
                                        <div class="mt-drop-sub">
                                            <!-- mt side widget start here -->
                                            <div class="mt-side-widget">
                                                <!-- cart row start here -->
                                                <div class="cart-row">
                                                    <a href="#" class="img"><img src="http://placehold.it/75x75" alt="image" class="img-responsive"></a>
                                                    <div class="mt-h">
                                                        <span class="mt-h-title"><a href="#">Marvelous Modern 3 Seater</a></span>
                                                        <span class="price"><i class="fa fa-eur" aria-hidden="true"></i> 599,00</span>
                                                        <span class="mt-h-title">Qty: 1</span>
                                                    </div>
                                                    <a href="#" class="close fa fa-times"></a>
                                                </div><!-- cart row end here -->
                                                
                                                <!-- cart row total start here -->
                                                <div class="cart-row-total">
                                                    <span class="mt-total">Sub Total</span>
                                                    <span class="mt-total-txt"><i class="fa fa-eur" aria-hidden="true"></i> 799,00</span>
                                                </div>
                                                <!-- cart row total end here -->
                                                <div class="cart-btn-row">
                                                    <a href="#" class="btn-type2">VIEW CART</a>
                                                    <a href="#" class="btn-type3">CHECKOUT</a>
                                                </div>
                                            </div><!-- mt side widget end here -->
                                        </div>
                                        <!-- mt drop sub end here -->
                                    </div><!-- mt drop end here -->
                                    <span class="mt-mdropover"></span>
                                </li>
                                <li>
                                    <a href="#" class="bar-opener side-opener">
                                        <span class="bar"></span>
                                        <span class="bar small"></span>
                                        <span class="bar"></span>
                                    </a>
                                </li>
                            </ul><!-- mt icon list end here -->
                            <!-- navigation start here -->
                            <nav id="nav">
                                <ul>
                                    <li>
                                        <a class="drop-link" href="homepage1.html">HOME <i class="fa fa-angle-down hidden-lg hidden-md" aria-hidden="true"></i></a>
                                      
                                    </li>
                                    <li class="drop">
                                        <a href="product-grid-view.html">PRODUCTS <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                        <!-- mt dropmenu start here -->
                                        <div class="mt-dropmenu text-left">
                                            <!-- mt frame start here -->
                                            <div class="mt-frame">
                                                <!-- mt f box start here -->
                                                <div class="mt-f-box">
                                                    <!-- mt col3 start here -->
                                                    <div class="mt-col-3">
                                                        <div class="sub-dropcont">
                                                            <strong class="title"><a href="product-grid-view.html" class="mt-subopener">Gender Product</a></strong>
                                                         
                                                               
                                                            <div class="sub-drop">
                                                                <ul>
                                                                    <li><a href="ListProductViewController?id=1"> Man</a></li>
                                                                    <li><a href="ListProductViewController?id=2"> Women</a></li>
                                                                    <li><a href="ListProductViewController?id=3"> Unisex</a></li>
                                                                </ul>
                                                            </div>
                                                           
                                                            
                                                        </div>
                                                        <div class="sub-dropcont">
                                                            <strong class="title"><a href="#" class="mt-subopener">CAPACITY</a></strong>
                                                            <div class="sub-drop">
                                                                <ul>
                                                                    <li><a href="ListProductViewController?volumeSearchCapacity=30">30ml</a></li>
                                                                    <li><a href="ListProductViewController?volumeSearchCapacity=50">50ml</a></li>
                                                                    <li><a href="ListProductViewController?volumeSearchCapacity=100">100ml</a></li>
                                                                    
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- mt col3 end here -->

                                                    <!-- mt col3 start here -->
                                                    <div class="mt-col-3">
                                                        <div class="sub-dropcont">
                                                            <strong class="title"><a href="#" class="mt-subopener">SCENT</a></strong>
                                                            <div class="sub-drop">
                                                                <ul>
                                                                    <li><a href="ListProductViewController?productSearchScent=Floral Fruity">Floral Fruity</a></li>
                                                                    <li><a href="ListProductViewController?productSearchScent=Floral Woody Musk">Floral Woody Musk</a></li>
                                                                    <li><a href="ListProductViewController?productSearchScent=Woody Spicy">Woody Spicy</a></li>
                                                                    <li><a href="ListProductViewController?productSearchScent=Aromantic Fougere"> Aromantic Fougere </a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                       
                                                        <div class="sub-dropcont">
                                                            <strong class="title"><a href="#" class="mt-subopener">Make By From</a></strong>
                                                            <div class="sub-drop">
                                                                <ul>
                                                                    <li><a href="ListProductViewController?brandSortMakebyFrom=America">America</a></li>
                                                                    <li><a href="ListProductViewController?brandSortMakebyFrom=France">France</a></li>
                                                                    <li><a href="ListProductViewController?brandSortMakebyFrom=Italy">Italy</a></li>
                                                                    <li><a href="ListProductViewController?brandSortMakebyFrom=Arabic">Arabic</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- mt col3 end here -->

                                                    <!-- mt col3 start here -->
                                                    <div class="mt-col-3">
                                                        <div class="sub-dropcont">
                                                            <strong class="title"><a href="#" class="mt-subopener">PERFUME BRAND</a></strong>
                                                            <div class="sub-drop">
                                                                <ul>
                                                                    <li><a href="ListProductViewController?brandID=Moncblanc">Moncblanc</a></li>
                                                                    <li><a href="ListProductViewController?brandID=Dior">Dior</a></li>
                                                                    <li><a href="ListProductViewController?brandID=Chanel">Chanel</a></li>
                                                                    <li><a href="ListProductViewController?brandID=Armaf">Armaf</a></li>
                                                                    <li><a href="ListProductViewController?brandID=Gucci">Gucci</a></li>
                                                                    <li><a href="ListProductViewController?brandID=Versace">Versace</a></li>
                                                                    <li><a href="ListProductViewController?brandID=Tom Ford">Tom Ford</a></li>
                                                                    
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- mt col3 end here -->

                                                    <!-- mt col3 start here -->
                                                    <div class="mt-col-3 promo">
                                                        <div class="mt-promobox">
                                                            <a href="#"><img src="images/banner3.png" alt="promo banner" class="img-responsive" style="height: 285; width: 275"></a>
                                                        </div>
                                                    </div>
                                                    <!-- mt col3 end here -->
                                                </div>
                                                <!-- mt f box end here -->
                                            </div>
                                            <!-- mt frame end here -->
                                        </div>
                                        <!-- mt dropmenu end here -->
                                        <span class="mt-mdropover"></span>
                                    </li>
                                    
                                    
                                    <!-- Blog -->
                                    <li>
                                        <a class="drop-link" href="blog-right-sidebar.html">Blog(LS) <i class="fa fa-angle-down hidden-lg hidden-md" aria-hidden="true"></i></a>
                                        <div class="s-drop">
                                            <ul>
                                                <li><a href="blog-fullwidth-page.html">Blog ve dior</a></li>
                                                <li><a href="blog-right-sidebar2.html">blog ve gucci</a></li>
                                                <li><a href="blog-postlist-3-masonry.html">blog postlist masonry</a></li>
                                                <li><a href="blog-post-detail-sidebar.html">blog post detail sidebar</a></li>
                                                <li><a href="blog-post-detail-full-width.html">blog post detail full width</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <!-- About us -->
                                    <li><a href="about-us.html">About</a></li>
                                    <li>
                                        <a class="drop-link" href="contact-us.html">Contact <i class="fa fa-angle-down hidden-lg hidden-md" aria-hidden="true"></i></a>
                                        <div class="s-drop">
                                            <ul>
                                                <li><a href="contact-us.html">Contact</a></li>
                                                <li><a href="contact-us2.html">Contact 2</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </nav>
                            <!-- mt icon list end here -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- mt bottom bar end here -->
            <span class="mt-side-over"></span>
        </header><!-- mt header style4 end here -->
        <div class="mt-side-menu">
				<!-- mt holder start here -->
				<div class="mt-holder">
					<a href="#" class="side-close"><span></span><span></span></a>
					<strong class="mt-side-title">MY ACCOUNT</strong>
					<!-- mt side widget start here -->
					<div class="mt-side-widget">
						<header>
                                                    <a href="registerpage.jsp"><span class="mt-side-subtitle"><button type="submit" class="btn-type1">SIGN UP</button></span></a>
						</header>	
					</div>
					<!-- mt side widget end here -->
					<div class="or-divider"><span class="txt">or</span></div>
					<!-- mt side widget start here -->
					<div class="mt-side-widget">
						<header>
                                                    <a href="loginpage.jsp"><span class="mt-side-subtitle"><button type="submit" class="btn-type1">LOGIN</button></span></a>
						</header>
					</div>
					<!-- mt side widget end here -->
				</div>
				<!-- mt holder end here -->
			</div><!-- mt side menu end here -->
        
        
        <!-- Header -->    
        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>  

    </body>
