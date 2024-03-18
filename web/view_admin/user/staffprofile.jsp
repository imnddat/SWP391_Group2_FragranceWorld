<%-- 
    Document   : staffprofile
    Created on : Feb 29, 2024, 12:30:59 PM
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
        <h1>Staff Profile</h1>
        <c:set var="s" value="${requestScope.staff}"></c:set>
        
        Username: ${s.username}<br>
        Position: ${s.getPosition().getPname()}<br>
        Password: ${s.password}<br>
        Full Name: ${s.fullname}<br>
        Email: ${s.email}<br>
        Address: ${s.address}<br> 
        Phone number: ${s.phone}
    </body>
</html>
