/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
//import Model.SystemEmail;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thinkpad
 */
public class ResetPasswordController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String otp = request.getParameter("otp");
       // String userMail = request.getParameter("userMail");
       String email = (String) session.getAttribute("email");
        String newPassword = request.getParameter("newPassword");
        String confirmnewPassword = request.getParameter("confirmnewPassword");

        UserDAO dao = new UserDAO();
    if (!newPassword.equals(confirmnewPassword)) {
            session.setAttribute("message", "New password and confirm new password do not match.");
            response.sendRedirect("ResetPassword.jsp");
        }else{
           session.setAttribute("message", "Vui Lòng nhập otp");
            response.sendRedirect("enterotp.jsp");
        }
    
        // Kiểm tra OTP có hợp lệ và đúng với email tương ứng
        String emailotp = dao.getEmailByOTP(otp);
        if (emailotp != null && dao.checkOTPMatchesEmail(emailotp, otp)) {
            // Chuyển hướng người dùng đến trang resetPassword.jsp để đặt mật khẩu mới
            session.setAttribute("emailotp", emailotp); // Lưu email vào session
            response.sendRedirect("ResetPassword.jsp");
        } else {
            // Xử lý trường hợp OTP không hợp lệ hoặc không tìm thấy email
            session.setAttribute("message", "OTP không hợp lệ hoặc đã hết hạn. Vui lòng thử lại.");
            response.sendRedirect("ResetPassword.jsp");
        }
        
    if (email != null && newPassword != null) {
        
        dao.updatePassword(email, newPassword); 
        dao.resetOTP(email);
        session.setAttribute("message", "Mật khẩu đã được đặt lại thành công. Vui lòng đăng nhập.");
        response.sendRedirect("loginpage.jsp");
    } 
    
    else {
        session.setAttribute("message", "Error.");
        response.sendRedirect("ForgotPassword.jsp");
    }
        
        
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
