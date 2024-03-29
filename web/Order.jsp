<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.OrderWithItems"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Order</title>
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
        <script src="https://kit.fontawesome.com/46db81caa4.js" crossorigin="anonymous"></script>
        <div class="w1">
            <%@include file = "panner.jsp" %>
            <!-- Main of the Page -->
            <main id="mt-main">
                <!-- Mt Process Section of the Page -->
                <div class="mt-process-sec wow fadeInUp" data-wow-delay="0.4s">
                    <div class="container">
                        <div class="row">

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
                                            <input type="text" class="form-control" placeholder="Name" value="${requestScope.name}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <textarea class="form-control" name="address" placeholder="Address" name="address" value="${requestScope.address}" readonly></textarea>
                                        </div>
                                        <div class="form-group">
                                            <div class="col">
                                                <input type="email" class="form-control" name="email" placeholder="Email Address" value="${requestScope.email}" readonly>
                                            </div>
                                            <div class="col">
                                                <input type="tel" class="form-control" name="phone" placeholder="Phone Number" value="${requestScope.phone}" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <textarea class="form-control" name="note" placeholder="Order Notes" value="${requestScope.note} "readonly></textarea>
                                        </div>
                                    </fieldset>
                                </form>
                                <!-- Bill Detail of the Page end -->
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <div class="txt-holder">
                                    <div class="text-wrap txt text-right pull-right">
                                        <!--<button onclick="modifyOrder()"><i class="fas fa-edit" style="color: blue;"></i></button>-->
                                        <button onclick="cancelOrder()"><i class="fa-solid fa-ban" style="color: red;"></i></button>
                                    </div>
                                </div>
                                <div class="holder">
                                    <h2>ORDER INFORMATION</h2>
                                    <ul class="list-unstyled block">
                                        <li>
                                            <div class="txt-holder">
                                                <div class="text-wrap pull-left">
                                                    <strong class="title">ORDER ID</strong>
                                                </div>
                                                <div class="text-wrap txt text-right pull-right">
                                                    <strong id="orderId" class="title">${requestScope.orderid}</strong>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="txt-holder">
                                                <div class="text-wrap pull-left">
                                                    <strong class="title">ORDER DATE</strong>
                                                </div>
                                                <div class="text-wrap txt text-right pull-right">
                                                    <strong class="title">${requestScope.orderdate}</strong>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="txt-holder">
                                                <div class="text-wrap pull-left">
                                                    <strong class="title">PAYMENT MEDTHOD</strong>
                                                </div>
                                                <div class="text-wrap txt text-right pull-right">
                                                    <strong class="title">${requestScope.paymentmedthod}</strong>
                                                </div>
                                            </div>
                                        </li>
                                        <li style="border-bottom: none;">
                                            <div class="txt-holder">
                                                <div class="text-wrap pull-left">
                                                    <strong class="title">STATUS</strong>
                                                </div>
                                                <div class="text-wrap txt text-right pull-right">
                                                    <strong class="title">${requestScope.status}</strong>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <h2>PAYMENT STATUS</h2>
                                    <!-- Panel Group of the Page -->
                                    <div>
                                        <c:set var="status" value="${requestScope.status}" />
                                        <c:choose>
                                            <c:when test="${status eq 'unpaid'}">
                                                Your order have not been paid.
                                                <a onclick="paylater(${requestScope.orderid})" style="font-weight: bold; text-decoration: underline;" href="#">Click here to paid</a>
                                            </c:when>
                                            <c:otherwise>
                                                No need to paid!
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <!-- Panel Group of the Page end -->
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Mt Detail Section of the Page end -->
                <div class="mt-product-table">
                    <div class="container">
                        <div class="row border">
                            <div class="col-xs-12 col-sm-1">
                                <strong class="title">ID</strong>
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <strong class="title">PRODUCT</strong>
                            </div>
                            <div class="col-xs-12 col-sm-2">
                                <strong class="title">VOlUME</strong>
                            </div>
                            <div class="col-xs-12 col-sm-2">
                                <strong class="title">PRICE</strong>
                            </div>
                            <div class="col-xs-12 col-sm-1">
                                <strong class="title">QUANTITY</strong>
                            </div>
                        </div>

                        <div id="content">
                            <c:forEach var="item" items="${requestScope.itemList}">
                                <div class="row border rowItem">
                                    <div class="col-xs-12 col-sm-1">
                                        <strong class="product-name">${item.getProductId()}</strong>
                                    </div>
                                    <div class="col-xs-12 col-sm-5">
                                        <div class="row rowItem">
                                            <div class="col-xs-12 col-sm-3">
                                                <div class="img-holder">
                                                    <img src="${item.getImg()}" alt="image description">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-9">
                                                <strong class="product-name">
                                                    ${item.getProductName()}
                                                </strong>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <strong class="product-name">${item.getVolume()} ml</strong>
                                    </div>
                                    <div class="col-xs-12 col-sm-2">
                                        <strong class="product-name">
                                            ${item.getPrice()}
                                        </strong>
                                    </div>
                                    <div class="col-xs-12 col-sm-1">
                                        <strong class="product-name">
                                            ${item.getQuantity()}
                                        </strong>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="row rowItem">
                                <div class="col-xs-12 col-sm-10"></div>
                                <div class="col-xs-12 col-sm-2">
                                    <h3 style="font-weight: bold;">TOTAL: ${requestScope.totalPrice}</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main><!-- Main of the Page end here -->
            <%@include file = "footer.jsp" %>   
        </div>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/login.js"></script>

        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>
        <script src="js/Order.js"></script>
    </body>
</html>
