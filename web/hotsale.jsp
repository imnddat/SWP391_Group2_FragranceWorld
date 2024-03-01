
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

