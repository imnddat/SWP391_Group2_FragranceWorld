<!-- mt bestseller start here -->
<div class="mt-smallproducts wow fadeInUp" data-wow-delay="0.4s">
    <div class="container">
        <div class="row">                      
            <div class="col-xs-12 col-sm-6 col-md-3 mt-paddingbottomsm">                            
                <h3 class="heading">Top Girl Style</h3>
                <c:forEach items="${requestScope.HotSaleProducts}" var="p">    
                    <!-- mt product4 start here -->
                    <div class="mt-product4 mt-paddingbottom20">
                        <div class="img">
                            <a href="ProductDetailController?productId=${p.getId()}"><img alt="image description" src="${p.getDefaultImg()}" style="height: 80; width: 80"></a>
                        </div>
                        <div class="text">
                            <div class="frame">
                                <strong><a href="ProductDetailController?productId=${p.getId()}">${p.getNameProduct()}</a></strong>
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
                <h3 class="heading">Top Boy Style</h3>
                <c:forEach items="${requestScope.HotSaleProductstopboy}" var="p">    
                    <!-- mt product4 start here -->
                    <div class="mt-product4 mt-paddingbottom20">
                        <div class="img">
                            <a href="ProductDetailController?productId=${p.getId()}"><img alt="image description" src="${p.getDefaultImg()}" style="height: 80; width: 80"></a>
                        </div>
                        <div class="text">
                            <div class="frame">
                                <strong><a href="ProductDetailController?productId=${p.getId()}">${p.getNameProduct()}</a></strong>
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
                <h3 class="heading"> Top Scent </h3>
                <c:forEach items="${requestScope.HotSaleProducts}" var="p">    
                    <!-- mt product4 start here -->
                    <div class="mt-product4 mt-paddingbottom20">
                        <div class="img">
                            <a href="ProductDetailController?productId=${p.getId()}"><img alt="image description" src="${p.getDefaultImg()}" style="height: 80; width: 80"></a>
                        </div>
                        <div class="text">
                            <div class="frame">
                                <strong><a href="ProductDetailController?productId=${p.getId()}">${p.getNameProduct()}</a></strong>
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
                <h3 class="heading">Top Stock</h3>
                <c:forEach items="${requestScope.HotSaleProducts}" var="p">    
                    <!-- mt product4 start here -->
                    <div class="mt-product4 mt-paddingbottom20">
                        <div class="img">
                            <a href="ProductDetailController?productId=${p.getId()}"><img alt="image description" src="${p.getDefaultImg()}" style="height: 80; width: 80"></a>
                        </div>
                        <div class="text">
                            <div class="frame">
                                <strong><a href="ProductDetailController?productId=${p.getId()}">${p.getNameProduct()}</a></strong>
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
        </div>
    </div>
</div><!-- mt bestseller end here -->

