<%-- 
    Document   : registerpage
    Created on : Feb 21, 2024, 8:35:13 AM
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
          <%@include file = "panner.jsp" %>
       <main id="mt-main">
        <!-- Mt Content Banner of the Page -->
        <section class="mt-contact-banner" style="background-image: url(http://placehold.it/1920x205);">
          <div class="container">
            <div class="row">
              <div class="col-xs-12 text-center">
                <h1>register</h1>
                <nav class="breadcrumbs">
                  <ul class="list-unstyled">
                    <li><a href="index.html">home <i class="fa fa-angle-right"></i></a></li>
                    <li>register</li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </section>
        <!-- Mt Content Banner of the Page end -->
        <!-- Mt About Section of the Page -->
        <section class="mt-about-sec" style="padding-bottom: 0;">
          <div class="container">
            <div class="row">
              <div class="col-xs-12">
                  <div class="txt" style="text-align: center">
                  <h1>Welcome to Shop Brand </h1>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- Mt About Section of the Page -->
            
        <!-- Mt Detail Section of the Page -->
        <section class="mt-detail-sec toppadding-zero">
          <div class="container">
            <div class="row">
              <div class="col-xs-12 col-sm-10 col-sm-push-1">
                <div class="holder" style="margin: 0;">
                    <div class="mt-side-widget">
                      <header>
                        <h2 style="margin: 0 0 5px;">register</h2>
                        <p>Don’t have an account?</p>
                      </header>
                        <form action="register" method="post" style="margin: 0 0 80px;">
                        <fieldset>
                          <div class="row">
                            <div class="col-xs-12 col-sm-6">
                              <input type="text" placeholder="Full Name" name="name" class="input" required>
                            </div>
<!--                            <div class="col-xs-12 col-sm-6">
                              <input type="text" placeholder="DOB" name="dob" class="input" required>
                            </div>-->
                          </div>
                          <div class="row">
                            <div class="col-xs-12 col-sm-6">
                              <input type="text" placeholder="Username" name="username" class="input" required>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                              <input type="text" placeholder="Your Email" name="email" required class="input">
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-xs-12 col-sm-6">
                              <input type="text" placeholder="Your Phone" name="phone" required class="input">
                            </div>
                            <div class="col-xs-12 col-sm-6">
                              <textarea placeholder="Address" name="address" required class="input"></textarea>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <input type="password" placeholder="Re-type Password" name="password" required class="input">
                            </div>
                            <div class="col-xs-12 col-sm-6">
                              <input type="password" placeholder="Password" name="password" required class="input">
                            </div>
                          </div>
                          <div class="box">
                            <a href="about" class="help">Help?</a>
                          </div>
                            <button type="submit" value="register" class="btn-type1">Register Me</button>
                        </fieldset>
                      </form>
                      <header>
                        <h2 style="margin: 0 0 5px;">register with social</h2>
                        <p>Create an account using social</p>
                      </header>

                      <ul class="mt-socialicons">
                        <li class="mt-facebook"><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                        <li class="mt-twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li class="mt-linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li class="mt-dribbble"><a href="#"><i class="fa fa-dribbble"></i></a></li>
                        <li class="mt-pinterest"><a href="#"><i class="fa fa-openid"></i></a></li>
                        <li class="mt-youtube"><a href="#"><i class="fa fa-youtube-play"></i></a></li>
                      </ul>
                    </div>
                </div>
              </div>
            </div>
          </div>
        </section>
       
        <!-- Mt Detail Section of the Page end -->
        <div class="container">
          <div class="row">
            <div class="col-xs-12">         
            </div>
          </div>
        </div>
      </main><!-- Main of the Page end -->
        <%@include file = "footer.jsp" %>    
    </body>
</html>
