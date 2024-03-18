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
            #wrapper{
                margin-left: 10%;
                margin-right: 10%;
                font-family: arial;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <h1>Staff Management</h1>

        <form>
            Position:
            <select name="key1">
                <option value="0" ${empty param.key1 || param.key1 == '0' ? 'selected' : ''}>All Position</option>
                <c:forEach items="${requestScope.position}" var="c">
                    <option value="${c.id}" ${param.key1 == c.id ? 'selected' : ''}>${c.pname}</option>    
                </c:forEach>
            </select> <br><!-- comment -->
            Staff status: &nbsp;&nbsp;   <!-- comment -->
            Active: <input type="radio" name="status" value="True"> &nbsp;&nbsp;<!-- comment -->
            Not Active: <input type="radio" name="status" value="False"> <br><!-- comment -->
            <input type="text" placeholder="Nhap username/fullname" name="key"><br><!-- comment -->
            <input type="submit" value="Search">

        </form>

        <a href="addstaff">Add a new staff</a>

        <table border="1px solid">
            <tr>
                <th>UserName</th>
                <th>Position</th>
                <th>Full Name</th>
                <th>Status</th>

            </tr>
            <c:forEach items="${requestScope.slist}" var="s">
                <c:set var="id" value="${s.id}"/>
                <tr>
                    <td><a href="staffprofile?id=${id}">${s.username}</a></td>
                    <td>${s.getPosition().getPname()}</td>
                    <td>${s.fullname}</td>
                    <td><input type="checkbox" ${s.status == true ? "checked": ""} class="statusCheckbox" data-user-id="${s.id}"></td>
                </tr>
            </c:forEach>
        </table>
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
