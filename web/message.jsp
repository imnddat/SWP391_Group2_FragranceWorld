<%-- 
    Document   : message.jsp
    Created on : Mar 13, 2024, 12:42:26 AM
    Author     : Thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Success</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        .success-message {
            text-align: center;
            margin-top: 50px;
        }
        .sticker {
            display: inline-block;
            background-color: #4CAF50; /* Green background */
            color: white;
            padding: 20px;
            border-radius: 50%; /* Makes it circular */
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2); /* Drop shadow */
            font-size: 2em;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="success-message">
        <div class="sticker">
            <i class="fas fa-check-circle"></i>
        </div>
        <p><%= request.getAttribute("registrationSuccess") %></p>
    </div>
</body>
</html>
