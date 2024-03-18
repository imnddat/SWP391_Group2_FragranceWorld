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
                                    <div class="tab-pane fade" id="account-change-password">
                                        <div class="card-body pb-2">
                                            <div class="form-group">
                                                <label class="form-label">Current password</label>
                                                <input type="password" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">New password</label>
                                                <input type="password" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Repeat new password</label>
                                                <input type="password" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="account-info">
                                        <div class="card-body pb-2">
                                            <div class="form-group">
                                                <label class="form-label">Bio</label>
                                                <textarea class="form-control"
                                                          rows="5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc arcu, dignissim sit amet sollicitudin iaculis, vehicula id urna. Sed luctus urna nunc. Donec fermentum, magna sit amet rutrum pretium, turpis dolor molestie diam, ut lacinia diam risus eleifend sapien. Curabitur ac nibh nulla. Maecenas nec augue placerat, viverra tellus non, pulvinar risus.</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Birthday</label>
                                                <input type="text" class="form-control" value="May 3, 1995">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Country</label>
                                                <select class="custom-select">
                                                    <option>USA</option>
                                                    <option selected>Canada</option>
                                                    <option>UK</option>
                                                    <option>Germany</option>
                                                    <option>France</option>
                                                </select>
                                            </div>
                                        </div>
                                        <hr class="border-light m-0">
                                        <div class="card-body pb-2">
                                            <h6 class="mb-4">Contacts</h6>
                                            <div class="form-group">
                                                <label class="form-label">Phone</label>
                                                <input type="text" class="form-control" value="+0 (123) 456 7891">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Website</label>
                                                <input type="text" class="form-control" value>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="account-social-links">
                                        <div class="card-body pb-2">
                                            <div class="form-group">
                                                <label class="form-label">Twitter</label>
                                                <input type="text" class="form-control" value="https://twitter.com/user">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Facebook</label>
                                                <input type="text" class="form-control" value="https://www.facebook.com/user">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Google+</label>
                                                <input type="text" class="form-control" value>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">LinkedIn</label>
                                                <input type="text" class="form-control" value>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Instagram</label>
                                                <input type="text" class="form-control" value="https://www.instagram.com/user">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="account-connections">
                                        <div class="card-body">
                                            <button type="button" class="btn btn-twitter">Connect to
                                                <strong>Twitter</strong></button>
                                        </div>
                                        <hr class="border-light m-0">
                                        <div class="card-body">
                                            <h5 class="mb-2">
                                                <a href="javascript:void(0)" class="float-right text-muted text-tiny"><i
                                                        class="ion ion-md-close"></i> Remove</a>
                                                <i class="ion ion-logo-google text-google"></i>
                                                You are connected to Google:
                                            </h5>
                                            <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                               data-cfemail="f9979498818e9c9595b994989095d79a9694">[email&#160;protected]</a>
                                        </div>
                                        <hr class="border-light m-0">
                                        <div class="card-body">
                                            <button type="button" class="btn btn-facebook">Connect to
                                                <strong>Facebook</strong></button>
                                        </div>
                                        <hr class="border-light m-0">
                                        <div class="card-body">
                                            <button type="button" class="btn btn-instagram">Connect to
                                                <strong>Instagram</strong></button>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="account-notifications">
                                        <div class="card-body pb-2">
                                            <h6 class="mb-4">Activity</h6>
                                            <div class="form-group">
                                                <label class="switcher">
                                                    <input type="checkbox" class="switcher-input" checked>
                                                    <span class="switcher-indicator">
                                                        <span class="switcher-yes"></span>
                                                        <span class="switcher-no"></span>
                                                    </span>
                                                    <span class="switcher-label">Email me when someone comments on my article</span>
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label class="switcher">
                                                    <input type="checkbox" class="switcher-input" checked>
                                                    <span class="switcher-indicator">
                                                        <span class="switcher-yes"></span>
                                                        <span class="switcher-no"></span>
                                                    </span>
                                                    <span class="switcher-label">Email me when someone answers on my forum
                                                        thread</span>
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label class="switcher">
                                                    <input type="checkbox" class="switcher-input">
                                                    <span class="switcher-indicator">
                                                        <span class="switcher-yes"></span>
                                                        <span class="switcher-no"></span>
                                                    </span>
                                                    <span class="switcher-label">Email me when someone follows me</span>
                                                </label>
                                            </div>
                                        </div>
                                        <hr class="border-light m-0">
                                        <div class="card-body pb-2">
                                            <h6 class="mb-4">Application</h6>
                                            <div class="form-group">
                                                <label class="switcher">
                                                    <input type="checkbox" class="switcher-input" checked>
                                                    <span class="switcher-indicator">
                                                        <span class="switcher-yes"></span>
                                                        <span class="switcher-no"></span>
                                                    </span>
                                                    <span class="switcher-label">News and announcements</span>
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label class="switcher">
                                                    <input type="checkbox" class="switcher-input">
                                                    <span class="switcher-indicator">
                                                        <span class="switcher-yes"></span>
                                                        <span class="switcher-no"></span>
                                                    </span>
                                                    <span class="switcher-label">Weekly product updates</span>
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label class="switcher">
                                                    <input type="checkbox" class="switcher-input" checked>
                                                    <span class="switcher-indicator">
                                                        <span class="switcher-yes"></span>
                                                        <span class="switcher-no"></span>
                                                    </span>
                                                    <span class="switcher-label">Weekly blog digest</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.main.js"></script>
    </body>
</html>
