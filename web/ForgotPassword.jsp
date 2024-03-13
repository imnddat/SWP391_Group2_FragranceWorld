<%-- 
    Document   : ForgotPassword
    Created on : Mar 13, 2024, 6:09:19 PM
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
        <title>Forgot Password</title>
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
                <div class="form-container">
               <h2>Forgot Password</h2>
        
        <form action="forgotPassword" method="post">
            <label for="email">Enter your email:</label>
            <input type="email" id="email" name="email" required>
            
            <input type="submit" value="Send OTP">
        </form>
        
        <p>${sessionScope.resetMessage}</p>
        <p>${sessionScope.resetError}</p>
                
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
