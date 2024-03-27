<%-- 
    Document   : addsaleevent
    Created on : Mar 26, 2024, 11:43:19 PM
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
                margin-top: 20px;
            }

            .content h2 {
                color: #333;
            }

            .content_form {
                margin-top: 10px;
            }

            .content_form label {
                font-weight: bold;
            }

            .content_form input[type="text"],
            .content_form textarea,
            .content_form input[type="date"] {
                width: 100%;
                padding: 5px;
                margin-bottom: 10px;
            }

            .content_form input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
            }

            .content_form input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Fragrance World</h1>
            <div class="nav">
                <a href="dashboard">Dashboard</a>
                <span> | </span>
                <a href="listsaleevent">Sale Event Management</a>
                <span> | </span>
                <span>Add new Sale Event</span>
            </div>
        </div>
        <div class="content">
            <h2>Add new Sale Event</h2>
            <div class="content_form">
                <form action="addsaleevent" method="post">
                    <label>Title: </label>
                    <input type="text" name="title"><br>
                    <label>Content: </label>
                    <textarea name="content" rows="3"></textarea><br>
                    <label>Start Date: </label>
                    <input type="date" name="startdate"><br>
                    <label>End Date: </label>
                    <input type="date" name="enddate"><br>
                    <input class="btn btn-primary" type="submit" value="Add">
                </form>
            </div>
        </div>
    </body>
</html>
