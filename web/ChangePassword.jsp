<%-- 
    Document   : ChangePassword
    Created on : Feb 24, 2024, 7:03:32 AM
    Author     : Thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SWP team2</title>
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
        <%-- Check If user is logged in or not, if not redirect to index --%>
    <c:if test="${sessionScope.currUser == null}">
        <c:redirect url="/index.jsp"/>
    </c:if>
    <%-- Include header page --%>
    <jsp:include page="panner.jsp"/>
    <div class="main">

        <%-- Login form --%>
        <div class="container" style="align-self: center; min-height: 50vh; margin-top: 3vh;">
            <div class="row">
                <%-- Bootstrap to center form --%>
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <%-- Start form --%>
                    <form action="${contextPath}/ChangePasswordController" method="POST" name="changePassword" id="changePassword">
                        <%--Input old password--%>
                        <div class="row" style="margin-top: 3vh;">
                            <div class="col-md-4" style="text-align: right"><label class="label control-label">Old Password</label></div>
                            <div class="col-md-8">
                                <input type="password" class="form-control" name="oldPassword" placeholder="Enter old password" required>
                            </div>
                        </div>
                        <%--Input new password--%>
                        <div class="row" style="margin-top: 3vh;">
                            <div class="col-md-4" style="text-align: right"><label class="label control-label">New Password</label></div>
                            <div class="col-md-8">
                                <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="Enter new password" onkeyup='check();' required>
                            </div>
                        </div>
                        <%--Input confirm new password--%>
                        <div class="row" style="margin-top: 3vh;">
                            <div class="col-md-4" style="text-align: right"><label class="label control-label">Confirm Password</label></div>
                            <div class="col-md-8">
                                <input type="password" class="form-control" name="rePassword" id="rePassword" placeholder="Confirm new password" onkeyup='check();' required>
                            </div>
                        </div>
                        <div id="message" style="text-align: center; margin-top: 2vh"></div>
                        <br>
                        <%-- Submit form --%>
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <button type="submit" id="submit" class="btn btn-success">Change password!</button>
                            </div>
                            <div class="col-md-4"></div>
                        </div>

                    </form>
                    <%-- Display messages, if any --%>
                    <div style="text-align: center; margin-top: 2vh">
                        <h6 style="color:${color}"><c:out value="${message}"/></h6>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

    </div>
    <%-- Include footer page --%>
    <jsp:include page="footer.jsp"/>



    <script>
        <%-- Check if new password and re-enter password match or not --%>
    var check = function () {
        if (document.getElementById('newPassword').value == document.getElementById('rePassword').value) {
            document.getElementById('message').style.color = 'green';
            document.getElementById('message').innerHTML = 'Valid';
            document.getElementById('submit').disabled = false;
        } else {
            document.getElementById('message').style.color = 'red';
            document.getElementById('message').innerHTML = 'New password dont match';
            document.getElementById('submit').disabled = true;
        }
    }
    </script>
     <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>
</body>
</html>