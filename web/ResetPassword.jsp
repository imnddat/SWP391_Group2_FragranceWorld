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
        <jsp:include page="panner.jsp"/>
        <div class="main">
            <div class="container" style="align-self: center; min-height: 50vh">
                <c:set var="userMail" value="${ param.userMail }"/>
                <c:choose >
                    <c:when  test="${ userMail != null }">
                        <c:set var="currentTime" value="${System.currentTimeMillis() }"/>
                        <c:set var="createTime" value="${ param.createTime }"/>
                        <c:choose>
                            <c:when test = "${ ((currentTim - createTime) / 1000 / 60) < 3 }">
                                <form action="${contextPath}/ResetPasswordController" method="post">
                                    <div class="row">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-6">
                                            <label class="label control-label">Enter your new pass</label>
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-user"></span></span>
                                                <input type="password" class="form-control" name="newPass" placeholder="">
                                            </div>
                                            <label class="label control-label">Re-Enter your new pass</label>
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-lock"></span></span>
                                                <input type="password" class="form-control" name="confirmNewPass">
                                            </div>
                                            <c:if test="${mess != null}">
                                                <label class="label control-label">
                                                    <p style="color: red; font-weight: bold;">
                                                    <c:out value="${mess}"/>
                                                    </p>
                                                </label>
                                            </c:if>
                                            <div class="input-group">
                                                <button type="submit" id="submit" class="btn btn-success">Change password!</button>
                                                <input type="hidden" name="service" value="resetPage">
                                                <input type="hidden" name="userMail" value="<c:out value="${userMail}"/>">  
                                            </div>

                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>  
                                </form>
                            </c:when>
                            <c:otherwise>
                                <p>Your link have over due</p>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <form action="${contextPath}/ResetPasswordController" method="post">
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-6">
                                    <label class="label control-label">Enter your email</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-user"></span></span>
                                        <input type="text" class="form-control" name="enteredUserMail" placeholder="">
                                    </div>
                                    <br>
                                    <c:if test="${mess != null}">
                                        <label class="label control-label">
                                            <p style="color: red; font-weight: bold;">
                                            <c:out value="${mess}"/>
                                            </p>
                                        </label>
                                    </c:if>
                                    <div class="input-group">                                        
                                        <button type="submit" id="submit" class="btn btn-success">Send confirm</button>
                                        <input type="hidden" name="service" value="resetPassword">
                                    </div>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                        </form>
                    </c:otherwise>
                </c:choose>
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

