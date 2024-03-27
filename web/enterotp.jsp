

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Enter OTP</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f9; /* Light background color */
                display: flex;
                justify-content: center;
                align-items: flex-start; /* Changed from center to flex-start */
                height: 90vh; /* Reduced height to shift up */
                margin: 0;
                padding-top: 40px; /* Added top padding to shift the form up a bit */
            }
            .form-container {
                width: 350px;
                background-color: #fff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            h2 {
                color: #4CAF50; /* Greenish color for heading */
                margin-bottom: 20px;
            }
            label {
                display: block;
                margin-bottom: 10px;
                color: #333; /* Dark gray color */
            }
            input[type="text"], input[type="submit"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin: 10px 0;
                border-radius: 4px;
                border: 1px solid #ddd;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                cursor: pointer;
                border: none;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            a {
                color: #007bff;
                text-decoration: none;
                margin-top: 20px;
                display: inline-block;
            }
            a:hover {
                text-decoration: underline;
            }
            p {
                color: #ff0000; /* Red color for error messages */
            }
        </style>
    </head>
    <body>
      
                <div class="form-container">
                    <h2>Enter OTP to Reset Password</h2>
                    <% String error = (String) request.getAttribute("error");
   if (error != null) { %>
                    <p style="color: red;"><%= error %></p>
                    <% } %>

                    <form action="verifyotp" method="post">
                        <input type="email" name="email" placeholder="Your Email" required />
                        <input type="text" name="otp" placeholder="Enter OTP" required />
                        <input type="password" name="newPassword" placeholder="New Password" required />
                        <button type="submit">Verify OTP and Reset Password</button>
                    </form>

                    <p>${sessionScope.resetMessage}</p>
                    <p>${sessionScope.resetError}</p>

                    <a href="ForgotPassword.jsp">Back to Forgot Password</a>
                </div>
          
      
    </body>
</html>
