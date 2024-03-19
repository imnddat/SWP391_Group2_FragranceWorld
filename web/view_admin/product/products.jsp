<%-- 
    Document   : products
    Created on : Mar 14, 2024, 4:24:54 AM
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

            /* Thiết lập kiểu cho khung content */
            .content {
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            /* Thiết lập kiểu cho tiêu đề */
            .content h2 {
                margin-bottom: 20px;
            }

            /* Thiết lập kiểu cho phần tìm kiếm */
            .content_search {
                display: flex; /* Sử dụng flexbox để căn giữa */
                justify-content: center; /* Căn giữa theo chiều ngang */
                margin-bottom: 20px; /* Khoảng cách với phần tiêu đề "Add a new product" */
            }

            /* Thiết lập kiểu cho nhãn và các trường nhập liệu trong phần tìm kiếm */
            .content_search label,
            .content_search select,
            .content_search input[type="submit"] {
                margin-bottom: 10px; /* Khoảng cách giữa các thành phần */
            }

            /* Thiết lập kiểu cho nút tìm kiếm */
            .content_search input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 8px 20px;
                cursor: pointer;
            }

            /* Thiết lập kiểu cho phần thêm sản phẩm */
            .content a {
                display: block;
                margin-bottom: 20px;
                text-decoration: none;
                color: #007bff;
            }

            /* Thiết lập kiểu cho bảng sản phẩm */
            .content_table {
                overflow-x: auto;
            }

            .content_table table {
                width: 100%;
                border-collapse: collapse;
            }

            .content_table th,
            .content_table td {
                padding: 8px;
                border: 1px solid #ddd;
            }

            .content_table th {
                background-color: #f2f2f2;
            }

            .content_table img {
                max-width: 100px;
                height: auto;
                display: block;
                margin: 0 auto;
            }




        </style>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("are U sure to delete product with id =" + id)) {
                    window.location = "deleteproduct?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <div class="header">
            <h1>Fragrance World</h1>
            <div class="nav">
                <a href="dashboard">Dashboard</a>
                <span> | </span>
                <span>Product Management</span>
            </div>
        </div>
        <div class="content">
            <div class="content_search">
                <form>
                    <label>Gender:</label>
                    <select name="key1" >
                        <option value="0" ${param.key1 == '0' ? 'selected' : ''}>All</option>
                        <c:forEach items="${requestScope.genders}" var="g">
                            <option value="${g.id}" ${param.key1 == g.id ? 'selected' : ''}>${g.gendername}</option>    
                        </c:forEach>
                    </select> <br>
                    <label>Brand:</label>
                    <select name="key2" >
                        <option value="0" ${param.key2 == '0' ? 'selected' : ''}>All</option>
                        <c:forEach items="${requestScope.brands}" var="b">
                            <option value="${b.id}" ${param.key2 == b.id ? 'selected' : ''}>${b.name}</option>    
                        </c:forEach>
                    </select> <br>
                    <input class="btn btn-primary" type="submit" value="Search">
                </form>
            </div>

            <a href="addproduct">Add a new product</a>  

            <div class="content_table">
                <table class="table table-sm">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Code</th>
                        <th>Scent</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach items="${requestScope.products}" var="p" varStatus="loop">
                        <c:set var="id" value="${p.id}"/>
                        <tr>
                            <td>${loop.index}</td>
                            <td>${p.nameProduct}</td>
                            <td><img src="${p.defaultImg}" alt="alt"/></td>
                            <td>${p.codeProduct}</td>
                            <td>${p.scent}</td>
                            <td>
                                <a href="updateproduct?id=${id}">Update</a> 
                                <a href="#" onclick="doDelete('${id}')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>    
            </div>

        </div>

    </body>
</html>
