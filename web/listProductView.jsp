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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
				<section class="mt-contact-banner style4 wow fadeInUp" data-wow-delay="0.4s" style="background-image: url(http://placehold.it/1920x205);">
					<div class="container">
						<div class="row">
							<div class="col-xs-12 text-center">
								<h1>CHAIRS</h1>
								<!-- Breadcrumbs of the Page -->
								<nav class="breadcrumbs">
									<ul class="list-unstyled">
										<li><a href="index.html">Home <i class="fa fa-angle-right"></i></a></li>
										<li><a href="product-detail.html">Products <i class="fa fa-angle-right"></i></a></li>
										<li>Chairs</li>
									</ul>
								</nav><!-- Breadcrumbs of the Page end -->
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
								<ul class="list-unstyled nice-form">
									<li>
										<label for="check-1">
                                                                                    <input id="check-1" name="brands" value="id brands" type="checkbox">
											<span class="fake-input"></span>
											<span class="fake-label">Casali</span>
										</label>
										<span class="num">2</span>
									</li>
									
								</ul><!-- nice-form end here -->
								<span class="sub-title">Filter by Price</span>
								<div class="price-range">
									<div class="range-slider">
										<span class="dot"></span>
										<span class="dot dot2"></span>
									</div>
									<span class="price">Price &nbsp;   $ 10  &nbsp;  -  &nbsp;   $ 599</span>
									<a href="#" class="filter-btn">Filter</a>
								</div>
							</section><!-- shop-widget filter-widget of the Page end here -->
							<!-- shop-widget of the Page start here -->
							<section class="shop-widget">
								<h2>CATEGORIES</h2>
								<!-- category list start here -->
								<ul class="list-unstyled category-list">
									<li>
										<a href="#">
											<span class="name">CHAIRS</span>
											<span class="num">12</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="name">SOFAS</span>
											<span class="num">24</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="name">ARMCHAIRS</span>
											<span class="num">9</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="name">BEDROOM</span>
											<span class="num">2</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="name">LIGHTING</span>
											<span class="num">17</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="name">KITCHEN</span>
											<span class="num">10</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="name">ACCESSORIES</span>
											<span class="num">23</span>
										</a>
									</li>
								</ul><!-- category list end here -->
							</section><!-- shop-widget of the Page end here -->
							<!-- shop-widget of the Page start here -->
							<section class="shop-widget">
								<h2>HOT SALE</h2>
								<!-- mt product4 start here -->
								<div class="mt-product4 mt-paddingbottom20">
									<div class="img">
										<a href="product-detail.html"><img src="http://placehold.it/80x80" alt="image description"></a>
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
								
							</section><!-- shop-widget of the Page end here -->
						</aside><!-- sidebar of the Page end here -->
                                                <c:forEach  items="i" begin="0" end="${numberPage}" step="1">
                                                   123
                                                </c:forEach>
                                                
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
													<li><a href="/teenconroller?sortid=1">ASC</a></li>
													<li><a href="/teenconroller?sortid=2">DSC</a></li>
													<li><a href="/teenconroller?sortid=3">Price</a></li>
													<li><a href="#">Relevance</a></li>
												</ul>
											</div>
										</li>
										<li><a class="mt-viewswitcher" href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a></li>
										<li><a class="mt-viewswitcher" href="#"><i class="fa fa-th-list" aria-hidden="true"></i></a></li>
									</ul>
								</div><!-- btn-box end here -->
								<!-- mt-textbox start here -->
								<div class="mt-textbox">
									<p>Showing  <strong>1–9</strong> of  <strong>65</strong> results</p>
									<p>View   <a href="#">9</a> / <a href="#">18</a> / <a href="#">27</a> / <a href="#">All</a></p>
								</div><!-- mt-textbox end here -->
							</header><!-- mt shoplist header end here -->
							<!-- mt productlisthold start here -->
							<ul class="mt-productlisthold list-inline">
								<li>
									<!-- mt product1 large start here -->
									<div class="mt-product1 large">
										<div class="box">
											<div class="b1">
												<div class="b2">
													<a href="product-detail.html"><img src="http://placehold.it/275x290" alt="image description"></a>
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
											<strong class="title"><a href="product-detail.html">Bombi Chair</a></strong>
											<span class="price"><i class="fa fa-eur"></i> <span>399,00</span></span>
										</div>
									</div><!-- mt product1 center end here -->
								</li>
								
							</ul><!-- mt productlisthold end here -->
							<!-- mt pagination start here -->
							<nav class="mt-pagination">
								<ul class="list-inline">
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
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
	<!-- include jQuery -->
	<script src="js/jquery.js"></script>
	<!-- include jQuery -->
	<script src="js/plugins.js"></script>
	<!-- include jQuery -->
	<script src="js/jquery.main.js"></script>
    </body>
</html>
