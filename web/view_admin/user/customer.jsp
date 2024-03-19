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
            /* Thiết lập kiểu cho phần tìm kiếm */
            .content_search {
                text-align: center; /* Căn giữa nội dung trong phần tìm kiếm */
                margin-bottom: 20px; /* Khoảng cách với phần bảng */
            }

            .content_search form {
                display: inline-block; /* Hiển thị form dưới dạng khối */
            }

            .content_search input[type="text"],
            .content_search input[type="radio"],
            .content_search input[type="submit"] {
                margin-bottom: 10px; /* Khoảng cách giữa các thành phần */
            }

            .content_search label {
                margin-right: 10px; /* Khoảng cách giữa nhãn và ô nhập liệu */
            }
            /* Thiết lập kiểu cho phần bảng */
            .content_table {
                text-align: center; /* Căn giữa nội dung trong phần bảng */
            }

            .content_table table {
                margin: 0 auto; /* Căn giữa bảng */
                width: 90%; /* Độ rộng của bảng */
                max-width: 1000px; /* Độ rộng tối đa của bảng */
            }

            .content_table th,
            .content_table td {
                padding: 8px; /* Khoảng cách nội dung và viền của các ô */
                border: 1px solid #ddd; /* Viền của các ô */
            }

            .content_table th {
                background-color: #f2f2f2; /* Màu nền của các ô tiêu đề */
            }


        </style>
    </head>
    <body>
        <div class="header">
            <h1>Fragrance World</h1>
            <div class="nav">
                <a href="dashboard">Dashboard</a>
                <span> | </span>
                <span>Customer Management</span>
            </div>
        </div>

        <div class="content">
            <div class="content_search">
                <form>
                    <input type="text" placeholder="Input username/fullname" name="key"><br>
                    <label>Customer status:</label>
                    <label>Banned:</label>
                    <input type="radio" name="status" value="True">
                    <label>Not Banned:</label>
                    <input type="radio" name="status" value="False"> <br>

                    <input class="btn btn-primary" type="submit" value="Search">
                </form>
            </div>

            <div class="content_table">
                <table class="table table-sm">
                    <tr>
                        <th>#</th>

                        <th>UserName</th>

                        <th>Full Name</th>

                        <th>Banned</th>
                    </tr>
                    <c:forEach items="${requestScope.ulist}" var="u" varStatus="loop">
                        <c:set var="id" value="${u.id}"/>
                        <tr>
                            <td>${loop.index}</td>

                            <td><a href="customerprofile?id=${id}">${u.username}</a></td>

                            <td>${u.fullname}</td>

                            <td><input type="checkbox" ${u.banned == true ? "checked": ""} class="banCheckbox" data-user-id="${u.id}"></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>


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
