<%-- 
    Document   : addproduct
    Created on : Mar 14, 2024, 4:50:24 AM
    Author     : NguyenDucDat
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8">
        <!-- set the viewport width and initial-scale on mobile devices -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                margin: 0 auto;
                width: 50%; /* Điều chỉnh kích thước phần nội dung */
                padding: 20px;
            }

            form {
                border: 1px solid #ccc;
                padding: 20px;
                background-color: #f9f9f9;
            }

            label {
                display: inline-block;
                width: 100px; /* Điều chỉnh kích thước của nhãn */
                font-weight: bold;
            }

            input[type="text"],
            input[type="file"],
            select {
                width: calc(100% - 120px); /* Tính toán chiều rộng của input để căn chỉnh với nhãn */
                padding: 5px;
                margin-bottom: 10px;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 10px;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            .btn-primary {
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

            /* Tuỳ chỉnh cho các phần tử không phải input */
            select {
                width: calc(100% - 120px);
                padding: 5px;
                margin-bottom: 10px;
            }

            /* Định dạng cho các thẻ label */
            label {
                display: inline-block;
                width: 100px;
                font-weight: bold;
            }

        </style>
    </head>
    <body>
        <div class="header">
            <h1>Fragrance World</h1>
            <div class="nav">
                <a href="dashboard">Dashboard</a>
                <span> | </span>
                <a href="listproduct">Product Management</a>
                <span> | </span>
                <span>Add New Product</span>
            </div>
        </div>
        <div class="content">
            <form action="addproduct" method="post" enctype="multipart/form-data">
                <label>Name Product: </label>
                <input type="text" name="name"> <br>
                <label>Description: </label>
                <input type="text" name="description"> <br>
                <label>Code: </label>
                <input type="text" name="code"> <br>
                <label>Brand: </label>
                <select name="brand">
                    <c:forEach items="${requestScope.brands}" var="b">
                        <option value="${b.getId()}">${b.name}</option>    
                    </c:forEach>
                </select> <br>  
                <label>Gender: </label>
                <select name="gender">
                    <c:forEach items="${requestScope.genders}" var="g">
                        <option value="${g.id}">${g.gendername}</option>    
                    </c:forEach>
                </select> <br>
                <label>Scent: </label>
                <input type="text" name="scent"> <br>
                <label>Image: </label>
                <input type="file" name="image"> <br>
                <input class="btn btn-primary" type="submit" value="Add">
            </form>
        </div>

    </body>
</html>
