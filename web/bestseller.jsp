
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

