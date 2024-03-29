<%-- 
    Document   : dashboard
    Created on : Mar 19, 2024, 12:05:35 AM
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
                display: flex;
            }
            .content_user, .content_prodcut{
                width: 50%;
            }
            
            a{
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Fragrance World</h1>
            <div class="nav">
                <span>Dashboard</span>

            </div>
        </div>

        <div class="content">
            <div class="content_user">
                <h2>User Management</h2>
                <h3>Customer</h3>
                <ul>
                    <li><a href="listcustomer">List of customers</a></li>
                </ul>
                <h3>Staff</h3>
                <ul>
                    <li><a href="liststaff">List of Staff</a></li>
                    <li><a href="addstaff">Add a new Staff</a></li>
                </ul>
            </div>
            <div class="content_prodcut">
                <h2>Product Management</h2>
                <h3>Product</h3>
                <ul>
                    <li><a href="listproduct">List of product</a></li>
                    <li><a href="addproduct">Add product</a></li>
                    <li><a href="#">Warehouse</a></li>
                </ul>
                <h3>Sale event</h3>
                <ul>
                    <li><a href="listsaleevent">List of promotional programs</a></li>
                    <li><a href="#">Add promotion</a></li>
                    <li><a href="#">Set product discounts</a></li>
                </ul>
            </div>
        </div>
    </body>
</html>
