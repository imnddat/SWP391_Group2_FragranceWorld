<%-- 
    Document   : ResetPassword
    Created on : Feb 24, 2024, 7:03:16 AM
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
           <title>Reset Password</title>
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
        <jsp:include page="panner.jsp"/>
        <div class="main">
            <div class="container" style="align-self: center; min-height: 50vh">  
                <%
       String message = (String) session.getAttribute("message");
       if (message != null) {
           out.println("<p>" + message + "</p>");
           session.removeAttribute("message");
       }
       String email = request.getParameter("email"); // Lấy email từ request
       String otp = request.getParameter("otp"); // Lấy otp từ request
                %>
                <form action="ResetPasswordController" method="POST">
                    <input type="hidden" name="email" value="<%= email %>">
                    <input type="hidden" name="otp" value="<%= otp %>">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <label class="label control-label">Enter your new pass</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input type="password" class="form-control"  name="newPassword"  required>
                            </div>
                            <label class="label control-label">Re-Enter your new pass</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="password" class="form-control" id="" name="confirmnewPassword"  required>
                            </div>
                        </div>
                        <div class="col-md-3"></div>
                    </div>  
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <label class="label control-label">Enter your email</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input type="text" class="form-control" name="enteredUserMail" placeholder="">
                            </div>
                            <br>
                            <div class="input-group">    
                                <button type="submit" class="btn btn-success">Change password!</button>     
                            </div>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                </form>

            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>
    </body>
</html>

