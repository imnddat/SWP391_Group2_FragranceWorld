<header id="mt-header" class="style4">
    <!-- mt bottom bar start here -->
    <div class="mt-bottom-bar">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <!-- mt logo start here -->
                    <div class="mt-logo"><a href="HomeController"><img src="images/mt-logo.png" alt="schon"></a></div>
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
                                        <!-- cart row start here -->
                                        <div class="cart-row">
                                            <a href="#" class="img"><img src="http://placehold.it/75x75" alt="image" class="img-responsive"></a>
                                            <div class="mt-h">
                                                <span class="mt-h-title"><a href="#">Marvelous Modern 3 Seater</a></span>
                                                <span class="price"><i class="fa fa-eur" aria-hidden="true"></i> 599,00</span>
                                            </div>
                                            <a href="#" class="close fa fa-times"></a>
                                        </div><!-- cart row end here -->
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
                            <a href="#" class="cart-opener cartItemOpen">
                                <span class="icon-handbag"></span>
                                <c:set var="size" value="${empty sessionScope.cartsize ? 0 : sessionScope.cartsize}"/>
                                <span class="num" id="cart-size">${size}</span>
                            </a>
                            <!-- mt drop start here -->
                            <div class="mt-drop">
                                <!-- mt drop sub start here -->
                                <div class="mt-drop-sub">
                                    <!-- mt side widget start here -->
                                    <div class="mt-side-widget">
                                        <div class="cartItem" style="max-height: 270px; overflow-y: auto">
                                            <!-- cart row start here -->


                                            <c:forEach var="i" items="${sessionScope.cart}">
                                                <div class="cart-row">
                                                    <!--<a href="#" class="img"><img src="http://placehold.it/75x75" alt="image" class="img-responsive"></a>-->
                                                    <a href="#" class="img"><img src="${i.getProduct().getDefaultImg()}" alt="image" class="img-responsive"></a>
                                                    <div class="mt-h">
                                                        <span class="mt-h-title"><a href="#">${i.getProduct().getNameProduct()}</a></span>
                                                        <span class="price"><i class="fa fa-eur" aria-hidden="true"></i>${i.getPrice()}</span>
                                                        <span class="mt-h-title">${i.getQuantity()}</span>
                                                    </div>
                                                    <!--<a href="#" class="close fa fa-times"></a>-->
                                                </div><!-- cart row end here -->
                                            </c:forEach>

                                        </div>
                                        <!-- cart row total start here -->
                                        <div class="cart-row-total">
                                            <span class="mt-total">Sub Total</span>
                                            <span class="mt-total-txt" id="total-money"><i class="fa fa-eur" aria-hidden="true"></i>${sessionScope.totalMoney}</span>
                                        </div>
                                        <!-- cart row total end here -->
                                        <div class="cart-btn-row">
                                            <a href="${pageContext.request.contextPath}/cart" class="btn-type2">VIEW CART</a>
                                            <a href="checkout" class="btn-type3">CHECKOUT</a>
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
                                <a class="drop-link" href="HomeController">HOME <i class="fa fa-angle-down hidden-lg hidden-md" aria-hidden="true"></i></a>

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
                                                    <strong class="title"><a href="product-grid-view.html" class="mt-subopener">cacloainuoc</a></strong>
                                                    <div class="sub-drop">
                                                        <ul>
                                                            <li><a href="listProductView.jsp">Product Dior</a></li>
                                                            <li><a href="product-list-view.html">Product Gucci</a></li>
                                                            <li><a href="product-detail.html">Product Detail</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="sub-dropcont">
                                                    <strong class="title"><a href="#" class="mt-subopener">Stock</a></strong>
                                                    <div class="sub-drop">
                                                        <ul>
                                                            <li><a href="404-page.html">Stock1</a></li>
                                                            <li><a href="404-page2.html">Stock2</a></li>
                                                            <li><a href="404-page2.html">Stock2</a></li>
                                                            <li><a href="404-page2.html">Stock2</a></li>

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- mt col3 end here -->

                                            <!-- mt col3 start here -->
                                            <div class="mt-col-3">
                                                <div class="sub-dropcont">
                                                    <strong class="title"><a href="#" class="mt-subopener">Mau sac</a></strong>
                                                    <div class="sub-drop">
                                                        <ul>
                                                            <li><a href="about-us.html">About</a></li>
                                                            <li><a href="about-us.html">About</a></li>
                                                            <li><a href="about-us.html">About</a></li>
                                                            <li><a href="about-us.html">About</a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="sub-dropcont">
                                                    <strong class="title"><a href="#" class="mt-subopener">gia tien</a></strong>
                                                    <div class="sub-drop">
                                                        <ul>
                                                            <li><a href="coming-soon.html">Coming Soon</a></li>
                                                            <li><a href="coming-soon2.html">Coming Soon2</a></li>
                                                            <li><a href="about-us.html">About</a></li>
                                                            <li><a href="about-us.html">About</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- mt col3 end here -->

                                            <!-- mt col3 start here -->
                                            <div class="mt-col-3">
                                                <div class="sub-dropcont">
                                                    <strong class="title"><a href="#" class="mt-subopener">hang nuoc hoa</a></strong>
                                                    <div class="sub-drop">
                                                        <ul>
                                                            <li><a href="#">Kitchen Taps</a></li>
                                                            <li><a href="#">Breakfast time</a></li>
                                                            <li><a href="#">Cooking</a></li>
                                                            <li><a href="#">Food Storage Boxes</a></li>
                                                            <li><a href="#">Spice Jars</a></li>
                                                            <li><a href="#">Napskins</a></li>
                                                            <li><a href="#">Oven Gloves</a></li>
                                                            <li><a href="#">Placemats</a></li>
                                                            <li><a href="#">Cooking</a></li>
                                                            <li><a href="#">Food Storage Boxes</a></li>
                                                            <li><a href="#">Spice Jars</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- mt col3 end here -->

                                            <!-- mt col3 start here -->
                                            <div class="mt-col-3 promo">
                                                <div class="mt-promobox">
                                                    <a href="#"><img src="http://placehold.it/295x320" alt="promo banner" class="img-responsive"></a>
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
                <a href="register"><span class="mt-side-subtitle"><button type="submit" class="btn-type1">SIGN UP</button></span></a>
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
