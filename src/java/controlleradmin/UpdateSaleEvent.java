/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controlleradmin;

import daoadmin.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import modeladmin.SaleEvent;

/**
 *
 * @author NguyenDucDat
 */
public class UpdateSaleEvent extends HttpServlet {
   
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateSaleEvent</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSaleEvent at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String id_raw = request.getParameter("id");
        int sid;
        ProductDAO pd = new ProductDAO();
        try {
            sid = Integer.parseInt(id_raw);
            SaleEvent s = pd.getSaleEventById(sid);
            System.out.println(s);
            request.setAttribute("event", s);
            request.getRequestDispatcher("./view_admin/product/updatesaleevent.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
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
        request.setCharacterEncoding("UTF-8");
        
        String title=request.getParameter("title");
        String eventcontent=request.getParameter("content");
        String startdate_raw = request.getParameter("startdate");
        String enddate_raw = request.getParameter("enddate");
        String sid_raw = request.getParameter("sid");
        System.out.println(title + eventcontent + startdate_raw + enddate_raw + sid_raw);
        int sid;
        Date startdate, enddate;
        ProductDAO pd = new ProductDAO();
        try {
            sid = Integer.parseInt(sid_raw);
            startdate = Date.valueOf(startdate_raw);
            enddate = Date.valueOf(enddate_raw);
            SaleEvent s = new SaleEvent();
            s.setTitle(title);
            s.setEventcontent(eventcontent);
            s.setStartdate(startdate);
            s.setEnddate(enddate);
            s.setSid(sid);
            
            pd.updateSaleEvent(s);
            
            response.sendRedirect("listsaleevent");
        } catch (NumberFormatException e) {
            System.out.println(e);
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