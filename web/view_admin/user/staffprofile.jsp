<%-- 
    Document   : staffprofile
    Created on : Feb 29, 2024, 12:30:59 PM
    Author     : NguyenDucDat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><!-- comment -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script><!-- comment -->
        <style>
            .header{
                text-align: center;
                margin-left: 10%;
                margin-right: 10%;
                padding: 10px;
            }

            .nav{
                font-size: 20px;
                background-color: rgb(245, 245, 245);
                padding: 5px;
            }

            .nav a{
                margin:0px 10px 0px 10px;
                text-decoration: none;
                font-weight: bold
            }

            .nav span{
                margin:0px 10px 0px 10px;
            }

            .content{
                margin-left: 10%;
                margin-right: 10%;
            }

            .content {
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            .content h2 {
                margin-bottom: 20px;
            }

            .content div {
                max-width: 400px;
                margin: 0 auto;
            }

            .content div label {
                display: block;
                margin-bottom: 5px;
            }

            .content div input {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            /* Tùy chỉnh cho dòng xuống hàng */
            .content div br {
                display: none;
            }

        </style>
    </head>
    <body>

        <div class="header">
            <h1>Fragrance World</h1>
            <div class="nav">
                <a href="dashboard">Dashboard</a>
                <span> | </span>
                <a href="liststaff">Staff Management</a>
                <span> | </span>
                <span>Profile Staff</span>
            </div>
        </div>

        <div class="content">
            <h2>Profile Staff</h2>
            <div class="content">
                <c:set var="s" value="${requestScope.staff}"></c:set>
                    <label>Username:</label>
                    <input value="${s.username}">
                <br>
                <label>Position:</label>
                <input value="${s.getPosition().getPname()}">
                <br>
                <label>Password:</label>
                <input value="${s.password}">
                <br>
                <label>Full Name:</label>
                <input value="${s.fullname}">
                <br>
                <label>Address:</label>
                <input value="${s.address}">
                <br>
                <label>Phone number:</label>
                <input value="${s.phone}">

            </div>
        </div>
    </body>
</html>
