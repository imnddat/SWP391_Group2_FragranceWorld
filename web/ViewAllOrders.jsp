<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>All Orders</title>
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
        <div class="w1">
            <%@include file = "panner.jsp" %>
            <!-- Main of the Page -->
            <div id="wrapper">
                <div class="mt-product-table">
                    <div class="container">
                        <div class="row border">
                            <div class="col-xs-12 col-sm-1">
                                <strong class="title">ID</strong>
                            </div>
                            <div class="col-xs-12 col-sm-4">
                                <strong class="title">PRODUCT</strong>
                            </div>
                            <div class="col-xs-12 col-sm-1">
                                <strong class="title">TOTAL</strong>
                            </div>
                            <div class="col-xs-12 col-sm-2">
                                <strong class="title">ORDER DATE</strong>
                            </div>
                            <div class="col-xs-12 col-sm-2">
                                <strong class="title">PAYMENT MEDTHOD</strong>
                            </div>
                            <div class="col-xs-12 col-sm-1">
                                <strong class="title">STATUS</strong>
                            </div>
                        </div>

                        <div id="content">
                            <div class="row border rowItem">
                                <div class="col-xs-12 col-sm-1">
                                    <strong class="product-name">1</strong>
                                </div>
                                <div class="col-xs-12 col-sm-4">
                                    <div class="row rowItem">
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="img-holder">
                                                <img src="images/image_2024-01-17_235614124.png" alt="image description">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-9">
                                            <strong class="product-name">
                                                Nước hoa a
                                            </strong>
                                        </div>
                                    </div>
                                    <!-- item2 -->
                                    <div class="row rowItem">
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="img-holder">
                                                <img src="images/image_2024-01-17_235614124.png" alt="image description">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-9">
                                            <strong class="product-name">
                                                Nước hoa b
                                            </strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-1">
                                    <strong class="product-name">100.000</strong>
                                </div>
                                <div class="col-xs-12 col-sm-2">
                                    <strong class="product-name">
                                        13/03/2024
                                    </strong>
                                </div>
                                <div class="col-xs-12 col-sm-2">
                                    <strong class="product-name">
                                        Pay in Cash
                                    </strong>
                                </div>
                                <div class="col-xs-12 col-sm-1">
                                    <strong class="product-name">
                                        Complete
                                    </strong>
                                </div>
                                <div class="col-xs-12 col-sm-1">
                                    <strong class="product-name">
                                        <button>Detail</button>
                                    </strong>
                                </div>
                            </div>
                        </div>
                        <div class="row rowItem">
                            <div class="col-xs-12 col-sm-10"></div>
                            <div class="col-xs-12 col-sm-2">
                                <input id="page" style="width: 50px; margin-top: 10px" data-val="true" data-val-number="The field Amount must be a number." max="${requestScope.totalPage}" min="1" type="number" value="1" />
                                of ${requestScope.totalPage}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main><!-- Main of the Page end -->
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
    <script src="js/ViewAllOrders.js"></script>
</body>
</html>
