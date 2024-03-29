<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900,900italic%7cMontserrat:400,700%7cOxygen:400,300,700' rel='stylesheet' type='text/css'>

        <title>Before you go</title>
        <!-- Bootstrap core CSS -->
        <!--        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
                 Custom styles for this template 
                <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">      
                <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icon-fonts.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    </head>

    <body>
        <div id="wrapper">
            <div class="w1">
                <%@include file = "/panner.jsp" %>
                <div class="container">

                    <h3>Before you go</h3>
                    <div class="table-responsive">
                        <form action="paylater" id="frmCreateOrder" method="post">        
                            <div class="form-group">
                                <label for="amount">Amount to pay:</label>
                                <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="${sessionScope.ordertotal}" readonly="" />
                            </div>
                            <h4>Billing Detail</h4>
                            <div class="form-group">
                                <label for="amount">Name:</label>
                                <input class="form-control" id="name" type="text" value="${sessionScope.order_name}" readonly="" />
                                <label for="amount">Email:</label>
                                <input class="form-control" id="name" type="text" value="${sessionScope.order_email}" readonly="" />
                                <label for="amount">Phone:</label>
                                <input class="form-control" id="name" type="text" value="${sessionScope.order_phone}" readonly="" />
                                <label for="amount">Address:</label>
                                <input class="form-control" id="name" type="text" value="${sessionScope.order_address}" readonly="" />
                                <label for="amount">Note:</label>
                                <input class="form-control" id="name" type="text" value="${sessionScope.order_note}" readonly="" />
                            </div>
                            <button type="submit" class="btn btn-default">Proceed</button>
                        </form>
                    </div>
                    <p>
                        &nbsp;
                    </p>
                </div>

                <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
                <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
                <script type="text/javascript">
                    $("#frmCreateOrder").submit(function () {
                        var postData = $("#frmCreateOrder").serialize();
                        var submitUrl = $("#frmCreateOrder").attr("action");
                        $.ajax({
                            type: "POST",
                            url: submitUrl,
                            data: postData,
                            dataType: 'JSON',
                            success: function (x) {
                                if (x.code === '00') {
                                    if (window.vnpay) {
                                        vnpay.open({width: 768, height: 600, url: x.data});
                                    } else {
                                        location.href = x.data;
                                    }
                                    return false;
                                } else {
                                    alert(x.Message);
                                }
                            }
                        });
                        return false;
                    });
                </script>
                <%@include file = "/footer.jsp" %>
            </div>
        </div>
                            <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.main.js"></script>
    </body>
</html>