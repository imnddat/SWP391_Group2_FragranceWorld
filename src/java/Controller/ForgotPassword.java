
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import DAO.UserDAO; 
import static ultil.EmailUtils.generateOTP;
import ultil.SendMail; 



public class ForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to forgot password form
        request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDAO dao = new UserDAO();
        boolean result = dao.sendOTP(email);

        if (result) {
            // Forward to enter OTP page
            request.setAttribute("message", "OTP sent to your email. Please check your inbox.");
            request.getRequestDispatcher("enterotp.jsp").forward(request, response);
        } else {
            // Show error message
            request.setAttribute("error", "Failed to send OTP. Please try again or contact support.");
            request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
        }
    }
}

