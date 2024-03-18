<%-- 
    Document   : customerprofile
    Created on : Feb 27, 2024, 2:37:54 PM
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
        <h1>Customer Profile</h1>
        <c:set var="u" value="${requestScope.customer}"></c:set>

        Username:${u.username} <br>
        Password:${u.password} <br>
        Full Name:${u.fullname} <br>
        Email:${u.email} <br>
        Address:${u.address} <br> 
        Phone number:${u.phone}

    </body>
</html>
