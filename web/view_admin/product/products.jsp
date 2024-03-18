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
         <style>
            #wrapper{
                margin-left: 10%;
                margin-right: 10%;
                font-family: arial;
                text-align: center;
            }
            img{
                width: 20%
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
        <div id="wrapper">
            <h1>Product Management</h1>

            <form>
                Gender: <select name="key1" >
                    <option value="0" ${param.key1 == '0' ? 'selected' : ''}>All</option>
                    <c:forEach items="${requestScope.genders}" var="g">
                        <option value="${g.id}" ${param.key1 == g.id ? 'selected' : ''}>${g.gendername}</option>    
                    </c:forEach>
                </select> <br>
                Brand: <select name="key2" >
                    <option value="0" ${param.key2 == '0' ? 'selected' : ''}>All</option>
                    <c:forEach items="${requestScope.brands}" var="b">
                        <option value="${b.id}" ${param.key2 == b.id ? 'selected' : ''}>${b.name}</option>    
                    </c:forEach>
                </select> <br>
                <input type="submit" value="Search">
            </form>
            
            <a href="addproduct">Add a new product</a>       
            <table border="1px solid">
                <tr>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Code</th>
                    <th>Scent</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${requestScope.products}" var="p">
                    <c:set var="id" value="${p.id}"/>
                    <tr>
                        <td>${p.nameProduct}</td>
                        <td><img src="${p.defaultImg}" alt="alt"/></td>
                        <td>${p.codeProduct}</td><!-- comment -->
                        <td>${p.scent}</td>
                        <td>
                            <a href="updateproduct?id=${id}">Update</a> 
                            <a href="#" onclick="doDelete('${id}')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>    
        </div>

    </body>
</html>
