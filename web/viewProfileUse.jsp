<%-- 
    Document   : editProfile
    Created on : Feb 25, 2024, 11:20:52 PM
    Author     : Thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <style>
            body {
                background: #F6F6F6;
            }

            .form-control:focus {
                box-shadow: none;
                border-color: #F6F6F6;
            }

            .profile-button {
                background: #3A3B3C;
                box-shadow: none;
                border: none;
            }

            .profile-button:hover {
                background: #682773;
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none;
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none;
            }

            .back:hover {
                color: #682773;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <!-- main container of all the page elements -->
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

                <div class="container rounded bg-white mt-5">
                    <div class="row">
                        <div class="col-md-4 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="img/default-avatar.jpg" width="90"><span class="font-weight-bold">${profile.username}</span><span class="text-black-50">${profile.email}</span><span>${profile.address}</span></div>
                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <label for="username">Username</label>
                                    <input name="username" type="text" class="form-control"  placeholder="Username" value="${sessionScope.user.username}" readonly>
                                </div>

                                <div class="d-flex justify-content-between align-items-center mb-3 p-1 py-5">
                                    <a href="changepassword" class="d-flex flex-row align-items-center back ">
                                        <h6>Change Password</h6>    
                                        <i class="fa fa-long-arrow-right mr-1 mb-1"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <a href="../Project_BookStore/Home" class="d-flex flex-row align-items-center back">
                                        <i class="fa fa-long-arrow-left mr-1 mb-1"></i>
                                        <h6>Back to home</h6>
                                    </a>
                                    <h6 class="text-right">Edit Profile</h6>
                                </div>
                                <form method="post" action="viewUserProfile" onsubmit="showSuccessMessage();">
                                    <div class="row mt-2">
                                        <div class="col-md-6">
                                            <label for="name">Name</label>
                                            <input name="name" type="text" class="form-control" id="name" placeholder="Name"
                                                   value="${sessionScope.user.name}}">
                                        </div> 
                                    </div>
                                   
                                    <div class="row mt-3">
                                        <div class="col-md-6">
                                            <label for="email">Email</label>
                                            <input name="email" type="email" class="form-control" id="email" placeholder="Email"
                                                   value="${sessionScope.user.mail}">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="phone">Phone Number</label>
                                            <input name="phone" type="tel" class="form-control" id="phone"
                                                   value="${sessionScope.user.phone}" placeholder="Phone number">
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-6">
                                            <label for="address">Address</label>
                                            <input name="address" type="text" class="form-control" id="address" placeholder="Address"
                                                   value="${sessionScope.user.address}">
                                        </div>
                                        <div class="col-md-6">

                                            <input name="username" type="text" class="form-control" id="username" placeholder="Username"
                                                   value="${sessionScope.user.username}" hidden>
                                        </div>
                                    </div>
                                   
                                    <div class="mt-5 text-right">
                                        <button class="btn btn-primary profile-button" type="Submit" value="Update">Save Profile</button>
                                    </div>
                                    <a href="home.jsp">Back to HomePage</a>
                                </form>
                                ${mess}
                            </div>
                        </div>
                    </div>
                </div>

                <%@include file = "footer.jsp" %>        

            </div><!-- W1 end here -->
            <span id="back-top" class="fa fa-arrow-up"></span>

        <script>
            function showSuccessMessage() {
                const successMessage = document.getElementById('successMessage');
                successMessage.style.display = 'block';
                 alert("Form submitted successfully!");
            }
            $(document).ready(function () {
                $('#showPassword').click(function () {
                    const passwordInput = $('#password');
                    const passwordToggle = $('#passwordToggle');

                    if (passwordInput.attr('type') === 'password') {
                        passwordInput.attr('type', 'text');
                        passwordToggle.removeClass('fa-eye');
                        passwordToggle.addClass('fa-eye-slash');
                    } else {
                        passwordInput.attr('type', 'password');
                        passwordToggle.removeClass('fa-eye-slash');
                        passwordToggle.addClass('fa-eye');
                    }
                });
            });
        </script>

    </body>
</html>
