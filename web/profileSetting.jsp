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
                                                <!--                                                <label class="btn btn-outline-primary">
                                                                                                    Upload new photo
                                                                                                    <input type="file" class="account-settings-fileinput">
                                                                                                </label> &nbsp;-->
                                                <!--<button type="button" class="btn btn-default md-btn-flat">Update</button>-->
                                                <div class="text-light small mt-1">Allowed JPG, GIF or PNG. Max size of 800K</div>
                                            </div>
                                        </div>
                                        <hr class="border-light m-0">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label class="form-label">Username</label>                     
                                                <input id="usernameInput" type="text" class="form-control mb-1" value="${sessionScope.currentUser.username}" readonly>
                                                <p id="username-alert" class="text-danger"></p>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">fullName</label>
                                                <input id="fullNameInput" type="text" class="form-control" value="${sessionScope.currentUser.name}" readonly>
                                                <p id="fullName-alert" class="text-danger"></p>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">E-mail</label>
                                                <input id="emailInput" type="text" class="form-control mb-1" value="${sessionScope.currentUser.email}" readonly>
                                                <p id="email-alert" class="text-danger"></p>
                                                <!--                                                <div class="alert alert-warning mt-3">
                                                                                                    Your email is not confirmed. Please check your inbox.<br>
                                                                                                    <a href="javascript:void(0)">Resend confirmation</a>
                                                                                                </div>-->
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">phone</label>
                                                <input id="phoneInput" type="text" class="form-control" value="${sessionScope.currentUser.phone}" readonly>
                                                <p id="phone-alert" class="text-danger"></p>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Address</label>
                                                <input id="addressInput" type="text" class="form-control" value="${sessionScope.currentUser.address}" readonly>
                                                <p id="adress-alert" class="text-danger"></p>
                                            </div>
                                            <div class="text-right mt-3" style="padding-right: 20px;">
                                                <button id="editButton" type="button" class="btn btn-primary">Edit</button>&nbsp;
                                                <button id="saveButton" type="button" class="btn btn-success" style="display:none;">Save Change</button>
                                                <button id="cancelButton" type="button" class="btn btn-default" style="display:none;">Cancel</button>
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
                                            <form action="ChangePasswordController" method="post" >
                                                <%--Input User Name --%>
                                                <div class="row" style="margin-top: 3vh;">
                                                    <div class="col-md-4" style="text-align: right"><label class="label control-label">User Name</label></div>
                                                    <div class="col-md-8">
                                                        <input type="text" class="form-control" name="username" placeholder="User Name" required>
                                                    </div>
                                                </div>
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
                                                    <div class="col-md-4" style="text-align: right"><label class="label control-label">Confirm New Password</label></div>
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

                                                        <button type="submit" name="forgot" class="btn btn-success"><a href="ForgotPassword.jsp">Forgot password</a></button>
                                                    </div>
                                                    <div class="col-md-4"></div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                                                <%@include file = "footer.jsp" %>
            </div>
<!--            <div class="text-right mt-3">
                <button type="button" class="btn btn-primary">Save changes</button>&nbsp;
                <button type="button" class="btn btn-default">Cancel</button>
            </div>-->

        </div>

                
    
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script>
        // JavaScript code để kiểm tra session timeout và hiển thị cảnh báo
        $(document).ready(function () {
            // Kiểm tra nếu session timeout
        <% if (request.getAttribute("sessionTimeout") != null) { %>
            alert("Session đã hết hạn, vui lòng đăng nhập lại.");
            // Chuyển hướng về trang login
            window.location.replace("${pageContext.request.contextPath}/login");
        <% } %>
        });
    </script>

    <script>
        var originalValues = {
            username: "${sessionScope.currentUser.username}",
            fullName: "${sessionScope.currentUser.name}",
            email: "${sessionScope.currentUser.email}",
            phone: "${sessionScope.currentUser.phone}",
            address: "${sessionScope.currentUser.address}"
        };
    </script>
    <script src="${pageContext.request.contextPath}/js/profileEdit.js"></script>
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">

    
    <!-- include jQuery -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- include jQuery -->
    <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
    <!-- include jQuery -->
    <script src="${pageContext.request.contextPath}/js/jquery.main.js"></script>
</body>

</html>
