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
        <title>Change Password</title>
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
    <c:if test="${sessionScope.user == null}">
        <c:redirect url="/home.jsp"/>
    </c:if>
    <%-- Include header page --%>
    <jsp:include page="panner.jsp"/>
    <div class="main">
        <%-- Display messages, if any --%>
        <%
        // Không cần khai báo session vì nó đã tự động có sẵn
        String message = (String) session.getAttribute("message");
        if (message != null) {
        out.println("<p>" + message + "</p>");
        session.removeAttribute("message");
        }
        %>

        <%-- Login form --%>
        <div class="container" style="align-self: center; min-height: 50vh; margin-top: 3vh;">
            <div class="row">
                <%-- Bootstrap to center form --%>
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <%-- Start form --%>
                    <form action="ChangePasswordController" method="POST" >
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
                                <input type="password" class="form-control" name="newPassword" " placeholder="Enter new password" required>
                            </div>
                        </div>
                        <%--Input confirm new password--%>
                        <div class="row" style="margin-top: 3vh;">
                            <div class="col-md-4" style="text-align: right"><label class="label control-label">Confirm Password</label></div>
                            <div class="col-md-8">
                                <input type="password" class="form-control" name="confirmNewPassword"  placeholder="Confirm new password" required>
                            </div>
                        </div>
                        <br>
                        <%-- Submit form --%>
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-success">Change password!</button>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%-- Include footer page --%>
    <jsp:include page="footer.jsp"/>
    <!-- include jQuery -->
    <script src="js/jquery.js"></script>
    <!-- include jQuery -->
    <script src="js/plugins.js"></script>
    <!-- include jQuery -->
    <script src="js/jquery.main.js"></script>
</body>
</html>