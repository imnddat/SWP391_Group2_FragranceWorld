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
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class Register extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");

        
         UserDAO userDAO = new UserDAO();
        String mess = "";
        String username = request.getParameter("username").trim();
        String pass = request.getParameter("password").trim();
        String confirmPass = request.getParameter("confirmPass").trim();
        String email = request.getParameter("email").trim();
        String name = request.getParameter("name").trim();
        String address = request.getParameter("address").trim();
        String phone = request.getParameter("phone").trim();
        String dob = request.getParameter("dob").trim();

        //check blank input fields
        if (username.length() == 0 || pass.length() == 0
                || name.length() == 0
                || email.length() == 0 || phone.length() == 0
                || dob.length() == 0) {
            mess = "You have to input all information!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        //check max length
        if (username.length() > 63 || pass.length() > 255
                || name.length() > 255
                || email.length() > 255
                || phone.length() > 10) {
            mess = "Your input have reached max length!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        //check if comfirm pass is the same as pass
        if (!pass.equals(confirmPass)) {
            mess = "The confirm-password is not match with the password!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        //check validate mail
        String mailRegex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
        if (!email.matches(mailRegex)) {
            mess = "The Email is invalid !";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        //check if this email already existed in the system
        if (userDAO.getUserByMail(email) != null) {
            mess = "This email have already been used!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
         if (userDAO.checkUsernameExists(username)) {
        // Username đã tồn tại, trả về thông báo lỗi
         mess = "This username is already taken. Please choose another one.";
        request.setAttribute("mess", mess);
        request.getRequestDispatcher("register.jsp").forward(request, response);
        return;
    }

        try {
            //check if this Moblie already existed in the system
            if (userDAO.getUserByMobile(phone) != null) {
                mess = "The phone number is already been used";
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
        } catch (Exception ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }

        //check if the moblie is in right fomat and length
        String moblieRegex = "(09|03|07|08|05)+([0-9]{8})";
        if (!phone.matches(moblieRegex) || phone.length() != 10) {
            mess = "The phone number is invalid";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        String user = new UserDAO().getUserRegister(username, pass, email, name, address, phone, dob);
        request.setAttribute("registrationSuccess", "Please check your email!");
        // Forward to a JSP page for display
        request.getRequestDispatcher("message.jsp").forward(request, response);
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
