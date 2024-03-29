<%-- 
    Document   : staff
    Created on : Feb 22, 2024, 7:48:19 AM
    Author     : NguyenDucDat
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .content_search{
                padding: 5px;

            }
            .content_search label{
                margin-right: 5px;
            }
            .content_table{
                margin-top: 10px;
            }

            label{
                margin-top: 3px;
                margin-bottom: 3px;
            }

            table a{
                text-decoration: none;
            }

        </style>
    </head>
    <body>
        <div class="header">
            <h1>Fragrance World</h1>
            <div class="nav">
                <a href="dashboard">Dashboard</a>
                <span> | </span>
                <span>Staff Management</span>
            </div>
        </div>
        <div class="content">
            <div class="content_search">
                <form>
                    <input type="text" placeholder="Nhap username/fullname" name="key"><br>
                    
                    <label> Position:</label>
                    <select name="key1">
                        <option value="0" ${empty param.key1 || param.key1 == '0' ? 'selected' : ''}>All Position</option>
                        <c:forEach items="${requestScope.position}" var="c">
                            <option value="${c.id}" ${param.key1 == c.id ? 'selected' : ''}>${c.pname}</option>    
                        </c:forEach>
                    </select> <br>
                    
                    <label> Staff status:</label>
                    <label> Active:</label> 
                    <input type="radio" name="status" value="True"> 
                    <label> Not Active:</label>
                    <input type="radio" name="status" value="False"> <br>
                    
                    <input class="btn btn-primary" type="submit" value="Search">

                </form>
            </div>

            <a href="addstaff">Add a new staff</a>

            <div class="content_table">
                <table class="table table-sm">
                    <tr>
                        <th>#</th>
                        <th>UserName</th>
                        <th>Position</th>
                        <th>Full Name</th>
                        <th>Status</th>

                    </tr>
                    <c:forEach items="${requestScope.slist}" var="s" varStatus="loop">
                        <c:set var="id" value="${s.id}"/>
                        <tr>
                            <td>${loop.index}</td>
                            <td><a href="staffprofile?id=${id}">${s.username}</a></td>
                            <td>${s.getPosition().getPname()}</td>
                            <td>${s.fullname}</td>
                            <td><input type="checkbox" ${s.status == true ? "checked": ""} class="statusCheckbox" data-user-id="${s.id}"></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

        </div>

        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".statusCheckbox").change(function () {
                    var userId = $(this).data("user-id");
                    var isChecked = $(this).prop("checked");

                    // Send AJAX request to servlet
                    $.ajax({
                        type: "GET",
                        url: "userstatus",
                        data: {userId: userId, isChecked: isChecked},
                        success: function (response) {
                            // Handle the response if needed
                            console.log(response);
                        },
                        error: function (error) {
                            console.log("Error:", error);
                        }
                    });
                });
            });
        </script>
    </body>
</html>
