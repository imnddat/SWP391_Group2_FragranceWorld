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
                            <%--                            <c:set var="wsize" value="${empty sessionScope.wishlistsize ? 0 : sessionScope.wishlistsize}"/>
                                                        <a href="#" class="icon-heart wishlist-opener"><span style="margin-bottom: -3px;" class="num" id="wishlist-size">${wsize}</span></a>--%>
                            <a href="#" class="cart-opener wishlistItemOpen">
                                <span class="icon-heart"></span>
                                <c:set var="wsize" value="${empty sessionScope.wishlistsize ? 0 : sessionScope.wishlistsize}"/>
                                <span class="num" id="wishlist-size">${wsize}</span>
                            </a>

                            <!-- mt drop start here -->
                            <div class="mt-drop">
                                <!-- mt drop sub start here -->
                                <div class="mt-drop-sub">
                                    <!-- mt side widget start here -->
                                    <div class="mt-side-widget">

                                        <div class="wishlistItem" style="max-height: 270px; overflow-y: auto">
                                            <!-- cart row start here -->


                                            <c:forEach var="i" items="${sessionScope.wishlist}">
                                                <div class="cart-row">
                                                    <!--<a href="#" class="img"><img src="http://placehold.it/75x75" alt="image" class="img-responsive"></a>-->
                                                    <a href="#" class="img"><img src="${i.getProduct().getDefaultImg()}" alt="image" class="img-responsive"></a>
                                                    <div class="mt-h">
                                                        <span class="mt-h-title"><a href="#">${i.getProduct().getNameProduct()} (${i.getVolume()})</a></span>
                                                        <span class="price"><i class="fa fa-eur" aria-hidden="true"></i>${i.getPrice()}</span>                   
                                                    </div>
                                                    <!--<a href="#" class="close fa fa-times"></a>-->
                                                </div><!-- cart row end here -->
                                            </c:forEach>

                                        </div>


                                        <div class="cart-row-total">
                                            <a href="#" class="btn-type2" onclick="confirmDelete()">Delete all</a>
                                            <span class="mt-total-txt"><a href="${pageContext.request.contextPath}/wishlist" class="btn-type2">view list</a></span>
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
                                                        <span class="mt-h-title"><a href="#">${i.getProduct().getNameProduct()} (${i.getVolume()})</a></span>
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
                                            <a href="javascript:void(0);" onclick="checkCurrentUser()" class="btn-type3">CHECKOUT</a>
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
                                                            <li><a href="ListProductViewController?id=1">Product Boy</a></li>
                                                            <li><a href="ListProductViewController?id=2">Product Girl</a></li>
                                                            <li><a href="ListProductViewController?id=3">Product Unisex</a></li>
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
                                                            <li><a href="#?brandID">Gucci</a></li>
                                                            <li><a href="#">Dior</a></li>
                                                            <li><a href="#">Icss</a></li>
                                                            <li><a href="#">Food Storage Boxes</a></li>
                                                            <li><a href="#">Spice Jars</a></li>
                                                            <li><a href="#">Napskins</a></li>

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
        <c:if test="${sessionScope.currentUser == null}">
            <a href="#" class="side-close"><span></span><span></span></a>
            <strong class="mt-side-title">MY ACCOUNT</strong>
            <!-- mt side widget start here -->
            <div class="mt-side-widget">
                <header>
                    <span class="mt-side-subtitle">SIGN IN</span>
                    <p>Welcome back! Sign in to Your Account</p>
                </header>
                <!--<form>
                    <fieldset>
                        <input type="text" placeholder="Username or email address" class="input">
                        <input type="password" placeholder="Password" class="input">
                        <div class="box">
                            <span class="left"><input class="checkbox" type="checkbox" id="check1"><label for="check1">Remember Me</label></span>
                            <a href="#" class="help">Help?</a>
                        </div>
                        <button type="submit" class="btn-type1">Login</button>
                    </fieldset>
                </form>-->
                <a href="login" class="btn-type1">Login</a>
            </div>
            <!-- mt side widget end here -->
            <div class="or-divider"><span class="txt">or</span></div>
            <!-- mt side widget start here -->
            <div class="mt-side-widget">
                <header>
                    <span class="mt-side-subtitle">CREATE NEW ACCOUNT</span>
                    <p>Create your very own account</p>
                </header>
                <form action="#">
                    <fieldset>
                        <input type="text" placeholder="Username or email address" class="input">
                        <button type="submit" class="btn-type1">Register</button>
                    </fieldset>
                </form>
            </div>
        </c:if>

        <c:if test="${sessionScope.currentUser ne null}">
            <strong class="mt-side-title"> Xin chao ${sessionScope.currentUser.name}</strong>
            <!--            <div class="text-center"><a href="profile" >Edit profile</a></div>
                        <div class="text-center"><a href="signout" >Sign Out</a></div>-->
            <ul class="list-group">
                <li class="text-center">
                    <a href="profile"><h2>Edit profile</h2></a>
                </li>
                <li class="text-center">
                    <a href="signout"><h2>Sign Out</h2></a>
                </li>
            </ul>

        </c:if>
        <!-- mt side widget end here -->
    </div>
    <!-- mt holder end here -->
</div><!-- mt side menu end here -->

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
                                                function confirmDelete(event) {
                                                    event = event || window.event;
                                                    event.stopPropagation();

                                                    var confirmed = confirm("Delete all?");
                                                    if (confirmed) {
                                                        var contextPath = "${pageContext.request.contextPath}";
                                                        var servletPath = "/wishlist";
                                                        var deleteAllUrl = contextPath + servletPath;
                                                        var action1 = "deleteAll";

                                                        // S? d?ng AJAX ?? g?i yêu c?u xóa
                                                        $.ajax({
                                                            type: "GET",
                                                            url: deleteAllUrl,
                                                            data: {
                                                                action: action1
                                                            },
                                                            success: function () {
                                                                // C?p nh?t giao di?n ng??i dùng ho?c th?c hi?n các hành ??ng c?n thi?t sau khi xóa
                                                                console.log("Delete successful");
                                                                $("#wishlist-size").text(0);
                                                                $(".wishlistItem").empty();
                                                            },
                                                            error: function () {
                                                                console.error("Error deleting wishlist");
                                                            }
                                                        });
                                                    }

                                                    // Ng?n ch?n hành vi m?c ??nh c?a th? <a>
                                                    event.preventDefault();
                                                    return false;
                                                }
</script>

<script>
    var currentUser = '<%= session.getAttribute("currentUser") %>';
    console.log("currentUser:", currentUser);
</script>
<script src="${pageContext.request.contextPath}/js/checkCurrentUser.js"></script>