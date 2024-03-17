<%-- 
    Document   : profileSetting
    Created on : Mar 13, 2024, 10:53:30 PM
    Author     : THAISON
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CodingDung | Profile Template</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profileSetting.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900,900italic%7cMontserrat:400,700%7cOxygen:400,300,700' rel='stylesheet' type='text/css'>
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icon-fonts.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    </head>
    <body>
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
                <div class="container light-style flex-grow-1 container-p-y">

                    <h4 class="font-weight-bold py-3 mb-4">
                        Account settings
                    </h4>
                    <div class="card overflow-hidden">
                        <div class="row no-gutters row-bordered row-border-light">
                            <div class="col-md-3 pt-0">
                                <div class="list-group list-group-flush account-settings-links">
                                    <a class="list-group-item list-group-item-action active" data-toggle="list"
                                       href="#account-general">General</a>
                                    <a class="list-group-item list-group-item-action" data-toggle="list"
                                       href="#account-change-password">Change password</a>
                                    <a class="list-group-item list-group-item-action" data-toggle="list"
                                       href="#account-forgot-password">Forgot Password</a>
                                    <!--                            <a class="list-group-item list-group-item-action" data-toggle="list"
                                                                   href="#account-info">Info</a>
                                                                <a class="list-group-item list-group-item-action" data-toggle="list"
                                                                   href="#account-social-links">Social links</a>
                                                                <a class="list-group-item list-group-item-action" data-toggle="list"
                                                                   href="#account-connections">Connections</a>
                                                                <a class="list-group-item list-group-item-action" data-toggle="list"
                                                                   href="#account-notifications">Notifications</a>-->
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="tab-content">
                                    <div class="tab-pane fade active show" id="account-general">
                                        <div class="card-body media align-items-center">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt
                                                 class="d-block ui-w-80">
                                            <div class="media-body ml-4">
                                                <label class="btn btn-outline-primary">
                                                    Upload new photo
                                                    <input type="file" class="account-settings-fileinput">
                                                </label> &nbsp;
                                                <button type="button" class="btn btn-default md-btn-flat">Reset</button>
                                                <div class="text-light small mt-1">Allowed JPG, GIF or PNG. Max size of 800K</div>
                                            </div>
                                        </div>
                                        <hr class="border-light m-0">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label class="form-label">Username</label>
                                                <input type="text" class="form-control mb-1" value="nmaxwell">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Name</label>
                                                <input type="text" class="form-control" value="Nelle Maxwell">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">E-mail</label>
                                                <input type="text" class="form-control mb-1" value="nmaxwell@mail.com">
                                                <div class="alert alert-warning mt-3">
                                                    Your email is not confirmed. Please check your inbox.<br>
                                                    <a href="javascript:void(0)">Resend confirmation</a>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Company</label>
                                                <input type="text" class="form-control" value="Company Ltd.">
                                            </div>
                                        </div>
                                    </div>

                                    <!--  Change pass word-->
                                    <!--  Change pass word-->
                                    <!--  Change pass word-->
                                    <!--  Change pass word-->
                                    <div class="tab-pane fade" id="account-change-password">
                                        <div class="card-body pb-2">
                                            <%
                                          // Không cần khai báo session vì nó đã tự động có sẵn
                                               String message1 = (String) session.getAttribute("message");
                                               if (message1 != null) {
                                               out.println("<p>" + message1 + "</p>");
                                               session.removeAttribute("message");
                                               }
                                            %>
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
                                                        <button type="button" class="btn btn-default">Cancel</button>
                                                    </div>
                                                    <div class="col-md-4"></div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>



                                    <!--Forgot password-->
                                    <!--Forgot password-->
                                    <!--Forgot password-->
                                    <!--Forgot password-->

                                    <div class="tab-pane fade" id="account-forgot-password">
                                        <% 
                                            String message2 = (String) session.getAttribute("message");
                                            if (message2 != null) {
                                            out.println("<p>" + message2 + "</p>");
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
                                                        <button type="button" class="btn btn-default">Cancel</button>
                                                    </div>
                                                </div>
                                                <div class="col-md-3"></div>
                                            </div>

                                        </form>
                                    </div>

                                    <!--  end end end         -->





                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-right mt-3">
                <button type="button" class="btn btn-primary">Save changes</button>&nbsp;
                <button type="button" class="btn btn-default">Cancel</button>
            </div>

        </div>

        <%@include file = "footer.jsp" %>        

    </div><!-- W1 end here -->
    <span id="back-top" class="fa fa-arrow-up"></span>
</div>

<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

</script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- include jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!-- include jQuery -->
<script src="${pageContext.request.contextPath}/js/plugins.js"></script>
<!-- include jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.main.js"></script>
</body>
</html>
