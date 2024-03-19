<%-- 
    Document   : addstaff
    Created on : Mar 14, 2024, 2:33:57 AM
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
            .content_add{
                padding: 5px;

            }
            .content_add label{
                margin-right: 5px;
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

            .content_add form {
                max-width: 400px;
                margin: 0 auto;
            }

            .content_add input[type="text"],
            .content_add input[type="password"],
            .content_add input[type="date"],
            .content_add input[type="email"],
            .content_add input[type="tel"],
            .content_add select {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            .content_add input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            /* Tùy chỉnh cho các dòng xuống hàng */
            .content_add br {
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
                <span>Add New Staff</span>
            </div>
        </div>

        <div class="content">
            <h2>Add New Staff</h2>
            <div class="content_add">
                <form action="addstaff" method="post">
                    Username: <input type="text" name="username"> <br>
                    Password: <input type="password" name="password"> <br> 
                    Position: 
                    <select name="key">   
                        <c:forEach items="${requestScope.position}" var="c">
                            <option value="${c.id}">${c.pname}</option>    
                        </c:forEach>
                    </select> <br>
                    Full Name: <input type="text" name="fullname"> <br>
                    DOB: <input type="date" name="dob"> <br>
                    Address: <input type="text" name="address"> <br>
                    Email: <input type="email" name="email"> <br>
                    Phone: <input type="tel" name="phone"> <br>
                    <input type="submit" value="Add">
                </form>
            </div>
        </div>


    </body>
</html>
