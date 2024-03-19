<%-- 
    Document   : saleevent
    Created on : Mar 14, 2024, 2:30:45 PM
    Author     : NguyenDucDat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Fragrance World</h1>
            <div class="nav">
                <a href="dashboard">Dashboard</a>
                <span> | </span>
                <span> Sale event</span>
            </div>
        </div>

        <a href="#">Add new sale event</a>

        <div class="content">
            <div class="content_search">
                <form>

                </form>
            </div>
            <div class="content_table">
                <table>
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Date</th>

                    </tr>
                    <c:forEach items="${requestScope.ls}" var="s" varStatus="loop">
                        <tr>
                            <td>${loop.index}</td>
                            <td>${s.title}</td>
                            <td>${s.eventcontent}</td>
                            <td>
                                <fmt:formatDate value="${s.startdate}" pattern="dd/MM/yyyy"/> - <fmt:formatDate value="${s.endate}" pattern="dd/MM/yyyy"/>
                            </td>

                        </tr>
                    </c:forEach>

                </table>
            </div>

        </div>
    </body>
</html>
