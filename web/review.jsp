<%-- 
Document   : loginpage
Created on : Feb 21, 2024, 8:34:46 AM
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
        <title>SWPgroup2</title>
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

            textarea {
                width: 100%;
                background: var(--light);
                padding: 1rem;
                border-radius: .5rem;
                border: none;
                outline: none;
                resize: none;
                margin-bottom: .5rem;
            }
            .btn-group {
                display: flex;
                grid-gap: .5rem;
                align-items: center;
            }
            .btn-group .btn {
                padding: .75rem 1rem;
                border-radius: .5rem;
                border: none;
                outline: none;
                cursor: pointer;
                font-size: .875rem;
                font-weight: 500;
            }
            .btn-group .btn.submit {
                background: var(--blue);
                color: var(--white);
            }
            .btn-group .btn.submit:hover {
                background: var(--blue-d-1);
            }
            .btn-group .btn.cancel {
                background: var(--white);
                color: var(--blue);
            }
            .btn-group .btn.cancel:hover {
                background: var(--light);
            }

            html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,caption, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
                margin: 0;
                padding: 0;
                border: 0;
                font: inherit;
                vertical-align: baseline;
            }

            body {
                background-attachment: fixed;
                color: #444444;
                font: 75%/1.3 Arial, Helvetica, sans-serif;
                margin: 0 auto;
            }

            input, input[type="text"], input[type="search"], isindex, textarea, button {
                outline:none;
                margin:0 auto;
                padding:5px 10px;
                -webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
                -moz-box-sizing: border-box;    /* Firefox, other Gecko */
                box-sizing: border-box;         /* Opera/IE 8+ */
            }

            .zf-clearBoth {
                clear:both;
            }
            ol, ul {
                list-style: none outside none;
            }

            .zf-heading {
                font-size:2em;
            }

            .zf-boldText, .zf-boldText a {
                font-weight:bold;
                text-decoration:none;
            }

            .zf-backgroundBg {
                background:#f5f5f5;
            }

            .zf-templateWidth {
                margin:1% auto;
            }

            .zf-templateWidth {
                width:800px;
            }

            .zf-templateWrapper {
                background:#fff;
                border:1px solid #d6d6d6;
                -webkit-box-shadow: 0 0px 3px #E1E1E1;
                -moz-box-shadow: 0 0px 3px #E1E1E1;
                box-shadow: 0 0px 3px #E1E1E1;
                -webkit-border-radius:2px;
                -moz-border-radius:2px;
                border-radius:2px;
            }

            .zf-tempContDiv input[type="text"], .zf-tempContDiv textarea, .zf-tempContDiv .zf-pdfTextArea {
                background:#fff;
                border:1px solid #e5e5e5;
                -webkit-border-radius:2px;
                -moz-border-radius:2px;
                border-radius:2px;
                padding:5px;
                font-size:13px;
            }

            .zf-tempContDiv input[type="text"]:hover,  .zf-tempContDiv textarea:hover{
                border:1px solid rgba(157, 157, 157, 0.75) !important;
            }
            .zf-tempContDiv input[type="text"]:focus, .zf-tempContDiv textarea:focus{
                border:1px solid rgba(121, 187, 238, 0.75) !important;
                -webkit-box-shadow:0 0 5px rgba(82, 168, 236, 0.5) !important;
                -moz-box-shadow:0 0 5px rgba(82, 168, 236, 0.5) !important;
                box-shadow:0 0 5px rgba(82, 168, 236, 0.5) !important;
            }

            .zf-tempContDiv textarea {
                height:75px;
            }
            .arrangeAddress .zf-addrCont  span.zf-addtwo{
                width: 99% !important;
                float: none !important;
            }
            /**********Error Message***********/
            .zf-errorMessage {
                font:12px Arial, Helvetica, sans-serif;
                color:#ff0000;
                padding-top:5px;
            }

            /**********Mandatory Message***********/
            .zf-important {
                color:#ff0000 !important;
                font-weight: normal;
                margin-left:0px;
                padding: 0;
                font-size:13px !important;
            }

            /**********instruction Message***********/
            .zf-instruction {
                color:#939393;
                font-style:italic;
                margin-top:3px;
                font-size:12px;
                overflow:visible !important;
                word-break: break-all;
                margin-bottom: 3px;
            }

            .zf-symbols {
                padding:0 5px;
            }

            /*****************template Header Starts Here****************/

            .zf-tempHeadBdr {
                margin:0;
                padding:0;
                overflow:hidden;
            }

            .zf-tempHeadContBdr {
                background: #494949;
                border-bottom:1px solid #EAEAEA;
                margin: 0;
                padding:10px 25px;
                -webkit-border-radius:2px 2px 0 0;
                -moz-border-radius:2px 2px 0 0;
                border-radius:2px 2px 0 0;
            }
            .zf-tempHeadContBdr .zf-frmTitle {
                color: #FFFFFF;
                margin: 0;
                padding: 0;
                font-size:2em;
            }
            .zf-tempHeadContBdr .zf-frmDesc {
                color: #DDDDDD;
                font-size: 14px;
                font-weight: normal;
                margin: 0;
                padding: 0;
            }

            /****************template Header Ends Here****************/


            .zf-subContWrap {
                padding:0;
                margin:10px;
                margin-bottom:0;
            }

            .zf-tempFrmWrapper {
                padding:10px 15px;
                margin:1px 0;
            }

            .zf-tempFrmWrapper .zf-tempContDiv {
                margin:0;
                padding:0;
            }

            .zf-tempFrmWrapper .zf-labelName {
                font-weight:bold;
                font-size:13px;
                color:#444;
            }

            .zf-form-sBox{
                padding:4px;
                border:1px solid #e5e5e5;
                font-size:13px;
            }

            .zf-name .zf-tempContDiv span, .zf-phone .zf-tempContDiv span, .zf-time .zf-tempContDiv span{
                float: left;
                display:block;
            }

            .zf-name .zf-tempContDiv span{
                margin-bottom:5px;
                margin-left: 4%;
            }
            .zf-name .zf-tempContDiv span.last{
                margin-right:0;
            }
            .zf-name .zf-tempContDiv span label{
                display: block;
                padding-top:3px;
            }
            .zf-name .zf-tempContDiv input[type="text"] {
                width:100%;
            }


            .zf-phone .zf-tempContDiv span label, .zf-date .zf-tempContDiv span label, .zf-time .zf-tempContDiv span label, .zf-address .zf-tempContDiv span label, .zf-geolocation .zf-tempContDiv span label, .zf-name .zf-tempContDiv span label{
                font-size:11px;
                padding-top:3px;
            }
            .zf-phone .zf-tempContDiv label, .zf-date .zf-tempContDiv label, .zf-time .zf-tempContDiv label, .zf-address .zf-tempContDiv label, .zf-name .zf-tempContDiv span label {
                color:#888888;
            }
            .zf-phone .zf-tempContDiv span label {
                display: block;
                padding-top:3px;
                text-align:center;
            }
            .zf-phone .zf-tempContDiv .zf-symbols {
                padding-top:5px;
            }


            .zf-currency .zf-tempContDiv span{
                display:inline-block;
            }
            .zf-currency .zf-tempContDiv span label {
                display: block;
                padding-top:3px;
            }
            .zf-currency .zf-tempContDiv .zf-symbol {
                font-size: 14px;
                margin-left:5px;
                margin-top: 4px;
                width:auto;
                font-weight:bold;
            }

            .zf-decesion .zf-tempContDiv{
                width:100% !important;
                margin-top:4px;
            }
            .zf-decesion input[type="checkbox"] {
                display: block;
                height: 13px;
                margin: 0;
                padding: 0;
                width: 13px;
                float:left;
                margin-top:4px;
            }
            .zf-decesion label {
                display: block;
                line-height:21px;
                margin: 0px 0 0 25px !important;
                padding-bottom: 0 !important;
                width:95% !important;
                float:none !important;
                line-height:21px !important;
                text-align:left !important;
            }

            .zf-tempContDiv input[type="file"]{
                outline:none;
                border:1px solid #ccc;
                margin:0 auto;
                padding:5px;
                width:auto;
            }

            .zf-note .zf-labelName{
                padding-top:7px;
            }
            .zf-templateWrapper .zf-note{
                overflow:hidden;
            }

            .zf-date .zf-tempContDiv span label {
                display: block;
                padding-top:3px;
                text-align:left;
            }

            .zf-subDate{
                margin-right:10px;
            }
            .zf-subDate label{
                text-align:left !important;
            }

            .zf-time .zf-tempContDiv span label {
                display: block;
                padding-top:3px;
                text-align:center;
            }

            .zf-time .zf-tempContDiv .zf-form-sBox{
                min-width:58px;
            }

            .zf-time .zf-tempContDiv .zf-symbols {
                padding-top:5px;
            }

            .zf-tempContDiv input[type="checkbox"], .zf-tempContDiv input[type="radio"] {
                display: block;
                height: 13px;
                margin: 4px 0 0;
                padding: 0;
                width: 13px;
            }

            .zf-radio .zf-overflow, .zf-checkbox .zf-overflow{
                padding-left:2px !important;
            }

            .zf-sideBySide .zf-tempContDiv span {
                margin: 0 15px 5px 0;
                padding:0;
                width:auto;
                float: left;
                display:block;
            }
            .zf-sideBySide .zf-tempContDiv span input[type="checkbox"] {
                display: block;
                width: 13px;
                height: 13px;
                padding: 0;
                margin-top:3px;
                float:left;
            }
            .zf-sideBySide .zf-tempContDiv span input[type="radio"] {
                display: block;
                width: 13px;
                height: 13px;
                margin-top:4px;
                padding: 0;
                float:left;
            }
            .zf-sideBySide .zf-tempContDiv span label {
                line-height:21px;
                display: block;
                margin: 0 0 0 20px;
                padding: 0 0 5px;
            }

            .zf-mSelect select{
                font-size:13px;
            }

            .zf-fmFooter {
                margin:0;
                padding:25px;
                text-align:center;
            }

            /****************Field Small/Medium/Large Starts Here****************/
            .zf-large .zf-tempContDiv .zf-form-sBox{
                width:100%;
            }


            .zf-name .zf-tempContDiv .zf-form-sBox{
                width:100%;
            }

            .zf-namesmall .zf-nameWrapper{
                width: 50%;
            }
            .zf-namesmall .zf-tempContDiv span{
                width:48%;
            }

            .zf-namesmall .zf-oneType .zf-salutationWrapper span{
                width:63%;
            }
            .zf-namesmall .zf-oneType .zf-salutationWrapper .zf-salutation{
                width: 33%;
            }

            .zf-namesmall .zf-twoType .zf-salutationWrapper span{
                width:34%;
                margin-left:3%;
            }
            .zf-namesmall .zf-twoType .zf-salutationWrapper .zf-salutation{
                width:26%;
            }

            .zf-namesmall .zf-threeType .zf-nameWrapper span{
                width:32%;
                margin-left:2%;
            }

            .zf-namesmall .zf-threeType .zf-salutationWrapper span{
                width:100%;
                margin-left: 0px;
                float:none;
                margin-left: 0;
            }
            .zf-namesmall .zf-threeType .zf-salutationWrapper .zf-salutation{
                width:50%;
            }


            .zf-namesmall .zf-tempContDiv span:first-child{
                margin-left:0;
            }

            .zf-leftAlign .zf-namesmall .zf-threeType .zf-salutationWrapper span, .zf-rightAlign .zf-namesmall	.zf-threeType .zf-salutationWrapper span{
                width:100%;
                margin-left: 0px;
                float:none;
                margin-left: 0;
            }
            .zf-leftAlign .zf-namesmall .zf-threeType .zf-salutationWrapper .zf-salutation, .zf-rightAlign .zf-namesmall .zf-threeType .zf-salutationWrapper .zf-salutation{
                width: 50%;
            }




            .zf-namemedium .zf-nameWrapper{
                width: 75%;
            }

            .zf-namemedium .zf-tempContDiv span{
                width:49%;
                margin-left:2%;
            }



            .zf-namemedium .zf-oneType .zf-salutationWrapper span{
                width:73%;
            }
            .zf-namemedium .zf-oneType .zf-salutationWrapper .zf-salutation{
                width: 25%;
            }

            .zf-namemedium .zf-twoType .zf-salutationWrapper span{
                width:38%;
                margin-left:2%;
            }
            .zf-namemedium .zf-twoType .zf-salutationWrapper .zf-salutation{
                width:20%;
            }


            .zf-namemedium .zf-threeType .zf-nameWrapper span{
                width:32%;
                margin-left:2%;
            }


            .zf-namemedium .zf-threeType .zf-salutationWrapper span{
                width:25%;
                margin-left:2%;
            }

            .zf-namemedium .zf-threeType .zf-salutationWrapper .zf-salutation{
                width:19%;
            }

            .zf-namemedium .zf-tempContDiv span:first-child{
                margin-left:0;
            }

            .zf-namelarge .zf-tempContDiv span{
                width:23.5%;
                margin-left:2%;
                margin-right: 0;
                margin-bottom: 0;
            }
            .zf-namelarge .zf-twoType .zf-nameWrapper span{
                width:49%;
                margin-left:2%;
            }
            .zf-namelarge .zf-threeType .zf-nameWrapper span{
                width:32%;
                margin-left:2%;
            }


            .zf-namelarge .zf-twoType .zf-salutationWrapper span{
                width:40%;
                margin-left:2%;
            }
            .zf-namelarge .zf-twoType .zf-salutationWrapper .zf-salutation{
                width: 16%;
            }

            .zf-namelarge .zf-threeType .zf-salutationWrapper span{
                width:26%;
                margin-left:2%;
            }
            .zf-namelarge .zf-threeType .zf-salutationWrapper .zf-salutation{
                width: 16%;
            }

            .zf-namelarge .zf-oneType .zf-salutationWrapper span{
                width:73%;
                margin-left:2%;
            }
            .zf-namelarge .zf-oneType .zf-salutationWrapper .zf-salutation{
                width:25%;
            }

            .zf-namelarge .zf-tempContDiv span:first-child {
                margin-left:0 !important;
            }



            .zf-csmall	 .zf-tempContDiv input[type="text"] {
                width:43%;
            }
            .zf-cmedium .zf-tempContDiv input[type="text"] {
                width:67%;
            }
            .zf-clarge	 .zf-tempContDiv input[type="text"] {
                width:91%;
            }

            .zf-nsmall .zf-tempContDiv input[type="text"] {
                width:50%;
            }
            .zf-nmedium .zf-tempContDiv input[type="text"] {
                width:75%;
            }
            .zf-nlarge .zf-tempContDiv input[type="text"] {
                width:100%;
            }

            .zf-addrsmall .zf-tempContDiv .zf-addrCont{
                width:50%;
            }
            .zf-addrmedium .zf-tempContDiv .zf-addrCont{
                width:75%;
            }
            .zf-addrlarge .zf-tempContDiv .zf-addrCont{
                width:100%;
            }


            /****************Field Small/Medium/Large Ends Here****************/

            .zf-topAlign .zf-tempFrmWrapper .zf-labelName {
                padding-bottom:8px;
                display:block;
            }

            .zf-topAlign .zf-threeColumns .zf-labelName, .zf-topAlign .zf-twoColumns .zf-labelName, .zf-topAlign .zf-oneColumns .zf-labelName, .zf-topAlign .zf-sideBySide .zf-labelName{
                padding-bottom:8px;
            }

            .zf-leftAlign {
                display:block;
            }
            .zf-leftAlign .zf-tempFrmWrapper .zf-labelName {
                float:left;
                width:30%;
                line-height:20px;
                margin-right:15px;
            }
            .zf-leftAlign .zf-tempFrmWrapper .zf-tempContDiv {
                margin-left: 35%;
            }

            .zf-leftAlign .zf-slider .zf-tempContDiv{
                margin-top:6px;
            }

            .zf-leftAlign .zf-decesion .zf-tempContDiv, .zf-rightAlign .zf-decesion .zf-tempContDiv{
                margin-left:0 !important;
            }

            .zf-rightAlign {
                display:block;
            }
            .zf-rightAlign .zf-tempFrmWrapper .zf-labelName {
                float:left;
                width:30%;
                line-height: 20px;
                text-align:right;
                margin-right:15px;
            }
            .zf-rightAlign .zf-tempFrmWrapper .zf-tempContDiv {
                margin-left: 35%;
            }
            .zf-matrixTable{
                font-size:13px;
                overflow-x: scroll;
                padding-bottom: 15px !important;
            }
            .zf-matrixTable table th, .zf-matrixTable table td{
                padding:10px;
            }
            .zf-matrixTable thead th, .zf-matrixTable table td{
                text-align:center;
            }
            .zf-matrixTable table td input[type="radio"], .zf-matrixTable table td input[type="checkbox"]{
                display:inline-block;
            }
            .zf-matrixTable tbody th{
                font-weight:normal;
                font-size: 13px;
                text-align: left;
            }
            .zf-matrixTable thead th {
                font-weight:600;
                font-size: 13px;
            }

            /****************Form Top Align Starts Here****************/

            .zf-termsContainer{
                margin:0;
                padding:0;
            }
            .zf-termsContainer .zf-termsMsg {
                border: 1px solid #E1E1E1;
                max-height: 250px;
                min-height:70px;
                overflow-y:scroll;
                padding:10px;
                margin-bottom:6px;
            }
            .zf-termsContainer .zf-termScrollRemove {
                border: 1px solid #E1E1E1;
                padding:10px;
                margin-bottom:6px;
            }
            .zf-termsAccept{
                margin-top:2px !important;
            }
            .zf-termsAccept input[type="checkbox"]{
                margin-top:2px !important;
                float:left;
            }
            .zf-termsAccept label{
                margin-left: 20px;
                font-size: 13px;
                float: none;
                display: block;
            }

        </style>
    </head>
    <body>
        <%@include file = "panner.jsp" %>
        <!-- Main of the Page -->
        <div class="zf-templateWidth">
            <form action='https://forms.zohopublic.com/nguyensyquanganh123/form/ContactUs1/formperma/GgEENu6jjHGB5cV7o-_0QvsQ39XK4lO3ghmYfKqNFDk/htmlRecords/submit' name='form' method='POST' onSubmit='javascript:document.charset = "UTF-8"; return zf_ValidateAndSubmit();' accept-charset='UTF-8' enctype='multipart/form-data' id='form'>
                <input type="hidden" name="zf_referrer_name" value="">
                <!-- To Track referrals , place the referrer name within the " " in the above hidden input field -->
                <input type="hidden" name="zf_redirect_url" value="">
                <!-- To redirect to a specific page after record submission , place the respective url within the " " in the above hidden input field -->
                <input type="hidden" name="zc_gad" value="">
                <!-- If GCLID is enabled in Zoho CRM Integration, click details of AdWords Ads will be pushed to Zoho CRM -->
                <div class="zf-templateWrapper">
                    <!-- Template Header Starts Here -->
                    <ul class="zf-tempHeadBdr">
                        <li class="zf-tempHeadContBdr">
                            <h2 class="zf-frmTitle"><em>Leave a feedback</em></h2>
                            <p class="zf-frmDesc">Your email address will not be published. Required fields are marked *</p>
                            <div class="zf-clearBoth"></div>
                        </li>
                    </ul>
                    <!-- Template Header Ends Here -->
                    <!-- Template Container Starts Here -->
                    <div class="zf-subContWrap zf-leftAlign">
                        <ul>
                            <!-- Name Starts Here -->
                            <li class="zf-tempFrmWrapper zf-name zf-namemedium">
                                <label class="zf-labelName">Name</label>
                                <div class="zf-tempContDiv zf-twoType">
                                    <div class="zf-nameWrapper">
                                        <span>
                                            <input type="text" maxlength="255" name="Name_First" fieldType=7 placeholder=""/>
                                            <label>First Name</label>
                                        </span>
                                        <span>
                                            <input type="text" maxlength="255" name="Name_Last" fieldType=7 placeholder=""/>
                                            <label>Last Name</label>
                                        </span>
                                        <div class="zf-clearBoth"></div>
                                    </div>
                                    <p id="Name_error" class="zf-errorMessage" style="display:none;">Invalid value</p>
                                </div>
                                <div class="zf-clearBoth"></div>
                            </li>
                            <li>
                                <!-- Star Rating -->
                            </li>

                            <!-- Email Starts Here -->
                            <li class="zf-tempFrmWrapper zf-large">
                                <label class="zf-labelName">Email <em class="zf-important">*</em></label>
                                <div class="zf-tempContDiv">
                                    <span>
                                        <input fieldType=9  type="text" maxlength="255" name="Email" checktype="c5" value="" placeholder=""/>
                                    </span>
                                    <p id="Email_error" class="zf-errorMessage" style="display:none;">Invalid value</p>
                                </div>
                                <div class="zf-clearBoth"></div>
                            </li>
                            <!-- Email Ends Here -->
                            <!-- Multiple Line Starts Here -->
                            <li class="zf-tempFrmWrapper zf-large">
                                <label class="zf-labelName">Your reviews <em class="zf-important">*</em></label>
                                <div class="zf-tempContDiv">
                                    <span>
                                        <textarea name="opinion" cols="30" rows="5" placeholder="Your opinion..."></textarea>

                                    </span>
                                    <p id="MultiLine_error" class="zf-errorMessage" style="display:none;">Invalid value</p>
                                </div>
                                <div class="zf-clearBoth"></div>
                            </li>
                            <!-- Multiple Line Ends Here -->
                        </ul>
                    </div>
                    <!-- Template Container Ends Here -->
                    <ul>
                        <li class="zf-fmFooter">
                            <div class="btn-group">
                                <button type="submit" class="btn submit">Submit</button>
                                <button class="btn cancel">Cancel</button>
                            </div>
                        </li>
                    </ul>
                </div>

            </form>
        </div>
        <%@include file = "footer.jsp" %>   
        <!-- include jQuery -->
        <script src="js/jquery.js"></script>
        <!-- include jQuery -->
        <script src="js/plugins.js"></script>
        <!-- include jQuery -->
        <script src="js/jquery.main.js"></script>
    </body>
</html>
