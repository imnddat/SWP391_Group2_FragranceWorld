<%-- 
    Document   : addstaff
    Created on : Mar 14, 2024, 2:33:57 AM
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
        <h1>Add a new staff</h1>
        
        <form action="addstaff" method="post">
            Username: <input type="text" name="username"> <br>
            Password: <input type="password" name="password"> <br> 
            Position: 
            <select name="key">   
                <c:forEach items="${requestScope.position}" var="c">
                        <option value="${c.id}">${c.pname}</option>    
                </c:forEach>
            </select> <br>
            Full Name: <input type="text" name="fullname"> <br>
            DOB: <input type="date" name="dob"> <br>
            Address: <input type="text" name="address"> <br>
            Email: <input type="email" name="email"> <br>
            Phone: <input type="tel" name="phone"> <br>
            <input type="submit" value="Add">
        </form>
    </body>
</html>
