<%-- 
    Document   : addproduct
    Created on : Mar 14, 2024, 4:50:24 AM
    Author     : NguyenDucDat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add Product</h1>
        <form action="addproduct" method="post" enctype="multipart/form-data">
            Name: <input type="text" name="name"> <br>
            Description: <input type="text" name="description"> <br>
            Code: <input type="text" name="code"> <br>
            Brand: 
            <select name="brand">
                <c:forEach items="${requestScope.brands}" var="b">
                    <option value="${b.id}">${b.name}</option>    
                </c:forEach>
            </select> <br>
            Gender: 
            <select name="gender">
                <c:forEach items="${requestScope.genders}" var="g">
                    <option value="${g.id}">${g.gendername}</option>    
                </c:forEach>
            </select> <br>
            Scent: <input type="text" name="scent"> <br>
            Image: <input type="file" name="image"> <br>
            <input type="submit" value="Add">
        </form>

    </body>
</html>
