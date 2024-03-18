<%-- 
    Document   : users
    Created on : Feb 20, 2024, 9:05:57 AM
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
            <h1>Customer Management</h1>
        <form>
            Customer status: &nbsp;&nbsp;   <!-- comment -->
            Banned: <input type="radio" name="status" value="True"> &nbsp;&nbsp;<!-- comment -->
            Not Banned: <input type="radio" name="status" value="False"> <br><!-- comment -->
            <input type="text" placeholder="Nhap username/FullName/email" name="key"><br><!-- comment -->
             
            <input type="submit" value="Search">

        </form>

        <table border="1px">
            <tr>
                
                <th>UserName</th>
                
                <th>Full Name</th>
                
                <th>Banned</th>
            </tr>
            <c:forEach items="${requestScope.ulist}" var="u">
                <c:set var="id" value="${u.id}"/>
                <tr>
                    
                    <td><a href="customerprofile?id=${id}">${u.username}</a></td>
                    
                    <td>${u.fullname}</td>
                    
                    <td><input type="checkbox" ${u.banned == true ? "checked": ""} class="banCheckbox" data-user-id="${u.id}"></td>
                </tr>
            </c:forEach>
        </table>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".banCheckbox").change(function () {
                    var userId = $(this).data("user-id");
                    var isChecked = $(this).prop("checked");

                    // Send AJAX request to servlet
                    $.ajax({
                        type: "GET",
                        url: "userban",
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
