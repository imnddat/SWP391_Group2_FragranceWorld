/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.UserDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import ultil.SendMail;

/**
 *
 * @author Thinkpad
 */
public class ResetPasswordController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        // Lấy email từ người dùng nhập
        String email = request.getParameter("email");

        // Kiểm tra xem email có được nhập hay không
        if (email == null || email.isEmpty()) {
            // Email chưa được nhập
            // Hiển thị thông báo lỗi và chuyển hướng người dùng lại trang quên mật khẩu
            HttpSession session = request.getSession();
            session.setAttribute("resetError", "Vui lòng nhập địa chỉ email.");
            response.sendRedirect("ForgotPassword.jsp");
        } else {
            // Email đã được nhập
            // Kiểm tra email xem có tồn tại trong cơ sở dữ liệu không
            UserDAO dao = new UserDAO();
            if (dao.checkEmailExists(email)) {
                // Tạo mã OTP ngẫu nhiên
                String otp = generateOTP();
//                long currentTimeMillis = System.currentTimeMillis();
//                long expiryTimeMillis = currentTimeMillis + 15 * 60 * 1000; // 15 phút
//                Timestamp expiryTime = new Timestamp(expiryTimeMillis);
//                // Lưu mã OTP và thời gian hết hạn vào cơ sở dữ liệu
//                dao.saveOTP(email, otp, expiryTime);
//                // Gửi email chứa mã OTP
//                sendOTPByEmail(email, otp);
                
                // Lưu mã OTP vào cơ sở dữ liệu
                dao.saveOTP(email, otp);

                // Gửi email chứa mã OTP
                sendOTPByEmail(email, otp);

                // Lưu email và thông báo thành công vào session để hiển thị trên trang khác
                HttpSession session = request.getSession();
                session.setAttribute("resetEmail", email);
                session.setAttribute("resetMessage", "Đã gửi mã OTP đến địa chỉ email của bạn.");

                // Chuyển hướng người dùng đến trang nhập mã OTP
                response.sendRedirect("enterotp.jsp");
            } else {
                // Email không tồn tại trong cơ sở dữ liệu
                // Hiển thị thông báo lỗi và chuyển hướng người dùng lại trang quên mật khẩu
                HttpSession session = request.getSession();
                session.setAttribute("resetError", "Email không tồn tại trong hệ thống.");
                response.sendRedirect("ForgotPassword.jsp");
            }
        }
    }
            }

          

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         processRequest(request, response);
    }
    
      // Phương thức để tạo mã OTP ngẫu nhiên
    private String generateOTP() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        int otpLength = 6; // Độ dài mã OTP

        StringBuilder otp = new StringBuilder(otpLength);
        Random random = new Random();

        for (int i = 0; i < otpLength; i++) {
            int index = random.nextInt(characters.length());
            char digit = characters.charAt(index);
            otp.append(digit);
        }

        return otp.toString();
    }

    // Phương thức để gửi mã OTP qua email
    private void sendOTPByEmail(String email, String otp) {
    String host = "smtp.gmail.com";
    String port = "587";
    String username = "minhnhnhe172717@fpt.edu.vn"; 
    String password = "phpi lkzz oesd kevx"; 

    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.port", port);

    Session session = Session.getInstance(props, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });

    try {
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        message.setSubject("OTP Change Password");
        message.setText("Your OTP: " + otp);
        Transport.send(message);
        System.out.println("Email sent successfully");
    } catch (MessagingException e) {
        e.printStackTrace();
    }
    }
    
    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
