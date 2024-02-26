/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.UserDAO;
import Model.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thinkpad
 */
public class ChangePasswordController extends HttpServlet {
   
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
            UserDAO userDAO = new UserDAO();
            
            String password = "";
            if (request.getParameter("oldPassword")==null){
                sendDispatcher(request, response, "ChangePassword.jsp");
            } else password = request.getParameter("oldPassword").trim();  /*Old password , get from request*/
            
            String newPassword = "";   
            if (request.getParameter("newPassword")==null){
                sendDispatcher(request, response, "ChangePassword.jsp");
            } else newPassword = request.getParameter("newPassword").trim();  /*New password , get from request*/
            User currUser = (User) request.getSession().getAttribute("currUser");   /*Current User from session*/
            /**
             * If the user enter the wrong old password: redirect back to 
             * changePassword.jsp and include a message
             */
            if (!currUser.getPassword().equals(password)) {
                request.setAttribute("message", "Old Password incorrect.");
                request.setAttribute("color", "red");
                sendDispatcher(request, response, "ChangePassword.jsp");
            } 
            /**
             * If the user enter the new password too long: redirect back to 
             * changePassword.jsp and include a message
             */
            else if (newPassword.length()>255){
                request.setAttribute("message", "New Password is too long.");
                request.setAttribute("color", "red");
                sendDispatcher(request, response, "ChangePassword.jsp");
            }
            /**
             * If the new password is the same as the old password: redirect back to 
             * changePassword.jsp and include a message
             */
            else if (newPassword.equals(password)){
                request.setAttribute("message", "New Password can't be same as old password.");
                request.setAttribute("color", "red");
                sendDispatcher(request, response, "ChangePassword.jsp");
            }
            /**
             * Else: process to change password, redirect back to 
             * changePassword.jsp and include a message
             */
            else {
                currUser.setPassword(newPassword);
                int i = userDAO.updateUser(currUser);
                if (i != 0) {
                    request.setAttribute("message", "Password changed successfully.");
                    request.setAttribute("color", "green");
                    sendDispatcher(request, response, "ChangePassword.jsp");
                } else {
                    request.setAttribute("message", "Password changed failed.");
                    request.setAttribute("color", "red");
                    sendDispatcher(request, response, "ChangePassword.jsp");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(ChangePasswordController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMess", ex.toString());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        
    }

    /**
     * Forward the request to the destination, catch any unexpected exceptions and log it
     * @param request   Request of the servlet
     * @param response  Response of the servlet
     * @param path      Forward address
     */
    public void sendDispatcher(HttpServletRequest request, HttpServletResponse response, String path) {
        try {
            RequestDispatcher rd = request.getRequestDispatcher(path);
            rd.forward(request, response);

        } catch (ServletException | IOException ex) {
            Logger.getLogger(ChangePasswordController.class
                    .getName()).log(Level.SEVERE, null, ex);
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

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
