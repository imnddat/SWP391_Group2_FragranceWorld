/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlleradmin;

import daoadmin.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import modeladmin.Position;
import modeladmin.Role;
import modeladmin.User;

/**
 *
 * @author NguyenDucDat
 */
public class AddStaff extends HttpServlet {

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
            out.println("<title>Servlet AddStaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddStaff at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        UserDAO sd = new UserDAO();
        List<Position> listp = sd.getAllPosition();
        request.setAttribute("position", listp);
        request.getRequestDispatcher("./view_admin/user/addstaff.jsp").forward(request, response);
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
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String fullname = request.getParameter("fullname").trim();
        String dob_raw = request.getParameter("dob").trim();
        String address = request.getParameter("address").trim();
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();
        String pid_raw = request.getParameter("key");
        System.out.println(username + password + fullname);
        Date dob;
        int pid;
        UserDAO ud = new UserDAO();
        String mess = "";

        //check blank input fields
        if (username.length() == 0 || password.length() == 0
                || fullname.length() == 0
                || email.length() == 0 || phone.length() == 0
                || dob_raw.length() == 0) {
            mess = "You have to input all information!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("./view_admin/user/addstaff.jsp").forward(request, response);
            return;
        }
        //check max length
        if (username.length() > 63 || password.length() > 255
                || fullname.length() > 255
                || email.length() > 255
                || phone.length() > 10) {
            mess = "Your input have reached max length!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("./view_admin/user/addstaff.jsp").forward(request, response);
            return;
        }
//        //check if comfirm pass is the same as pass
//        if (!password.equals(confirmPass)) {
//            mess = "The confirm-password is not match with the password!";
//            request.setAttribute("mess", mess);
//            request.getRequestDispatcher("register.jsp").forward(request, response);
//            return;
//        }

        //check validate mail
        String mailRegex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
        if (!email.matches(mailRegex)) {
            mess = "The Email is invalid !";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("./view_admin/user/addstaff.jsp").forward(request, response);
            return;
        }

        //check if this email already existed in the system
        if (ud.checkEmailInDatabase(email)) {
            mess = "This email have already been used!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("./view_admin/user/addstaff.jsp").forward(request, response);
            return;
        }
        // Check if this username already existed in the system
        if (ud.checkUsernameInDatabase(username)) {
            mess = "This username has already been used!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("./view_admin/user/addstaff.jsp").forward(request, response);
            return;
        }
        
        // Check if this phone number already existed in the system
        if (ud.checkPhoneInDatabase(phone)) {
            mess = "This phone number has already been used!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("./view_admin/user/addstaff.jsp").forward(request, response);
            return;
        }

        try {
            pid = Integer.parseInt(pid_raw);
            dob = Date.valueOf(dob_raw);
            User u = new User(pid, username, password, new Position(pid, ""), fullname, dob, address, email, phone, new Role(2, ""), true, true);
            ud.addStaff(u);
            response.sendRedirect("liststaff");
        } catch (Exception e) {
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
