<%-- 
    Document   : checkOut
    Created on : Feb 22, 2024, 1:00:01 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Schön. | eCommerce HTML5 Template</title>
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
            <div class="w1">
                <%@include file = "panner.jsp" %>
                <!-- Main of the Page -->
                <main id="mt-main">
                    <!-- Mt Process Section of the Page -->
                    <div class="mt-process-sec wow fadeInUp" data-wow-delay="0.4s">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <!-- Process List of the Page -->
                                    <ul class="list-unstyled process-list">
                                        <li class="active">
                                            <span class="counter">01</span>
                                            <strong class="title">Shopping Cart</strong>
                                        </li>
                                        <li class="active">
                                            <span class="counter">02</span>
                                            <strong class="title">Check Out</strong>
                                        </li>
                                        <li>
                                            <span class="counter">03</span>
                                            <strong class="title">Order Complete</strong>
                                        </li>
                                    </ul>
                                    <!-- Process List of the Page end -->
                                </div>
                            </div>
                        </div>
                    </div><!-- Mt Process Section of the Page end -->
                    <!-- Mt Detail Section of the Page -->
                    <section class="mt-detail-sec toppadding-zero wow fadeInUp" data-wow-delay="0.4s">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6">
                                    <h2>BILLING DETAILS</h2>
                                    <!-- Bill Detail of the Page -->
                                    <form action="checkout" method="post" class="bill-detail" id="billDetail">
                                        <fieldset>
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Name" value="${requestScope.name}">
                                            </div>
                                            <div class="form-group">
                                                <textarea class="form-control" name="address" placeholder="Address" name="address"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <div class="col">
                                                    <input type="email" class="form-control" name="email" placeholder="Email Address" value="${requestScope.email}">
                                                </div>
                                                <div class="col">
                                                    <input type="tel" class="form-control" name="phone" placeholder="Phone Number" value="${requestScope.phone}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input type="checkbox"> Ship to a different address?
                                            </div>
                                            <div class="form-group">
                                                <textarea class="form-control" placeholder="Order Notes"></textarea>
                                            </div>
                                            <input type="text" style="display: none;" id="paymentOption" name="paymentOption" value="Pay In Cash">
                                        </fieldset>
                                    </form>
                                    <!-- Bill Detail of the Page end -->
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <div class="holder">
                                        <h2>YOUR ORDER</h2>
                                        <ul class="list-unstyled block">
                                            <li>
                                                <div class="txt-holder">
                                                    <div class="text-wrap pull-left">
                                                        <strong class="title">PRODUCTS</strong>
                                                        <c:forEach var="item" items="${sessionScope.cart}">
                                                            <span>${item.product.getNameProduct()}       x${item.getQuantity()}</span>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="text-wrap txt text-right pull-right">
                                                        <strong class="title">TOTALS</strong>
                                                        <c:forEach var="item" items="${sessionScope.cart}">
                                                            <span><i class="fa fa-eur"></i> ${item.getTotal()}</span>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="txt-holder">
                                                    <strong class="title sub-title pull-left">CART SUBTOTAL</strong>
                                                    <div class="txt pull-right">
                                                        <span><i class="fa fa-eur"></i> ${requestScope.subtotal}</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="txt-holder">
                                                    <strong class="title sub-title pull-left">SHIPPING</strong>
                                                    <div class="txt pull-right">
                                                        <span>Free Shipping</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li style="border-bottom: none;">
                                                <div class="txt-holder">
                                                    <strong class="title sub-title pull-left">ORDER TOTAL</strong>
                                                    <div class="txt pull-right">
                                                        <span><i class="fa fa-eur"></i> ${requestScope.ordertotal}</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <h2>PAYMENT METHODS</h2>
                                        <!-- Panel Group of the Page -->
                                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">


                                            <!-- Panel Panel Default of the Page -->
                                            <div class="panel panel-default">
                                                <div class="panel-heading" role="tab" id="headingOne">
                                                    <h4 class="panel-title">
                                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" onclick="paymentSelection('Pay In Cash')">
                                                            PAY IN CASH
                                                            <span class="check"><i class="fa fa-check"></i></span>
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                                    <div class="panel-body">
                                                        <p>Pay in delivery</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- PAY IN CASH OPTION -->
                                            <div class="panel panel-default">
                                                <div class="panel-heading" role="tab" id="headingTwo">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" onclick="paymentSelection('Bank Transfer')">
                                                            DIRECT BANK TRANSFER 
                                                            <span class="check"><i class="fa fa-check"></i></span>
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                                    <div class="panel-body">
                                                        <p>Transfer into account:</p>
                                                        <p>Bank Name: TheBank</p>
                                                        <p>Name holder: Nguyen Kha Nghi</p>
                                                        <p>Bank number: 0000 0000 7777 6666</p>
                                                        <p>Write note with format: [Order id] [username] [Yourname]</p>                        
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Panel Panel Default of the Page end -->
                                            <!-- Panel Panel Default of the Page -->
                                            <div class="panel panel-default">
                                                <div class="panel-heading" role="tab" id="headingThree">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree" onclick="paymentSelection('Credit Card')">
                                                            CREDIT CARD (VISA, MASTERCARD)
                                                            <span class="check"><i class="fa fa-check"></i></span>
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                                    <div class="panel-body">
                                                        <p>You will be redirect to 3rd payment portal.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Panel Panel Default of the Page end -->
                                        </div>
                                        <!-- Panel Group of the Page end -->
                                    </div>
                                    <div class="block-holder">
                                        <input type="checkbox" checked> I’ve read &amp; accept the <a href="#">terms &amp; conditions</a>
                                    </div>             
                                    <a href="#" id="submitOrderButton" class="process-btn">PROCEED TO CHECKOUT <i class="fa fa-check"></i></a>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Mt Detail Section of the Page end -->
                </main><!-- Main of the Page end here -->
                <%@include file = "footer.jsp" %> 
                <!-- footer of the Page end -->
            </div>
            <span id="back-top" class="fa fa-arrow-up"></span>
        </div>
        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>
        <script>
            function paymentSelection(option) {
                document.getElementById('paymentOption').value = option;
            }
            document.getElementById("submitOrderButton").addEventListener("click", function(event) {
                
                var form = document.getElementById("billDetail");
                form.submit();
            });
        </script>

    </body>
</html>
