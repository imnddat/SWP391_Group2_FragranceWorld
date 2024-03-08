        <!-- mt producttabs start here -->
        <div class="mt-producttabs wow fadeInUp" data-wow-delay="0.4s">
            <!-- producttabs start here -->
            <ul class="producttabs">
                <li>
                    <form action="HomeController" >
                        <div class="mt-holder">
                            <div class="mt-frame">
                                <fieldset>
                                    <input type="text" value="${keywords}" name="keywords" placeholder="Search by products"  />
                                    <span class="icon-microphone"></span>
                                    <button  type="submit" class="btn-search">Go</button>
                                </fieldset>
                            </div>
                        </div> 
                    </form>
                </li>
                <li><a href="#tab1" class="active"> FEATURED</a></li>
                <li><a href="#tab2"> HOT TREND</a></li>
                <li><a href="#tab3">Rates Products</a></li>
                <li><a href="#tab4"> HOT SALE</a></li>
            </ul>
            <!-- producttabs end here -->
            <div class="tab-content text-center">
                <div id="tab1">
                    <!-- tabs slider start here -->
                    <div class="tabs-slider">
                        <!-- slide start here -->
                        <c:forEach items="${requestScope.allProducts}" var="p" > 
                            <form class="addToCartForm" action="cart" method="post">
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
                                                        <li><a href="#"><i class="icon-handbag"></i><span><button style="border: none" type="submit">Add to Cart</button></span></a></li>
                                                        <li><a href="#"><i class="icomoon icon-heart-empty"></i></a></li>
                                                        <li><a href="#"><i class="icomoon icon-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>                               
                                        <div class="txt">
                                            <strong class="title"><a href="product-detail.html" >${p.getNameProduct()}</a></strong> 
                                            <input type="hidden" name="id" value="${p.getId()}" />
                                            <input type="hidden" name="quantity" value="1" />
                                        </div>                              
                                    </div> 

                                    <!-- mt product1 center start here -->
                                    <!-- mt product1 center end here -->
                                </div>
                            </form>
                        </c:forEach>

                        <!-- slide end here -->  
                    </div>
                </div>
                <!-- tabs slider end here -->

                <!-- tab2 --> 
                <div id="tab2">
                    <!-- tabs slider start here -->
                    <div class="tabs-slider">
                        <c:forEach items="${requestScope.productbySold}" var="p" > 
                            <!-- slide start here -->
                            <div class="slide">
                                <!-- mt product1 center start here -->
                                <div class="mt-product1 mt-paddingbottom20">
                                    <div class="box">
                                        <div class="b1">
                                            <div class="b2">
                                                <a href="product-detail.html"><img src="${p.getDefaultImg()}" alt="" style="height: 215; width: 215"></a>
                                                <span class="caption">
                                                    <span class="new" style="color: red">HOT</span>
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
                                        <strong class="title"><a href="product-detail.html">${p.getNameProduct()}</a></strong>        
                                        <span class="price">$${p.getVolumes().get(0).getPrice()}</span>
                                    </div>
                                </div>
                                <!-- mt product1 center end here -->
                            </div>
                        </c:forEach>
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
                        <c:forEach items="${requestScope.productbySale}" var="p" > 
                            <!-- slide start here -->
                            <div class="slide">
                                <!-- mt product1 center start here -->
                                <div class="mt-product1 mt-paddingbottom20">
                                    <div class="box">
                                        <div class="b1">
                                            <div class="b2">
                                                <a href="product-detail.html"><img src="${p.getDefaultImg()}" alt="" style="height: 215; width: 215" ></a>
                                                <span class="caption">
                                                    <span class="off">${p.getSales().get(0).getDiscount()}%</span>
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
                                        <strong class="title"><a href="product-detail.html">${p.getNameProduct()}</a></strong>

                                    </div>
                                </div><!-- mt product1 center end here -->
                            </div>
                            <!-- slide end here -->
                        </c:forEach>
                    </div>
                    <!-- tabs slider end here -->
                </div>
            </div>
            <!-- mt producttabs end here -->
            <!-- include jQuery -->
            <!--<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>-->
<!--            <script>
                $(document).ready(function () {
                    $("button.btn-search").click(function () {
                        $.ajax({
                            type: "GET",
                            url: "HomeController",
                            data: {"keywords": keywords},
                            success: function (result) {
                                $("#searchResults").html(result);
                            }
                        });
                    });
                });
                
                function search(){
                    let keywords = $('input[type="text"][name="keywords"]').val();
                    $.ajax({
                            type: "GET",
                            url: "HomeController",
                            data: {"keywords": keywords},
                            success: function (result) {
                                $("#searchResults").html(result);
                            }
                        });
                }
            </script>-->
            
