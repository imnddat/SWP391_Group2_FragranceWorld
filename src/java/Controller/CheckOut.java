/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.OrderDAO;
import Model.Cart;
import Model.Order;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CheckOut extends HttpServlet {

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
            out.println("<title>Servlet CheckOut</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOut at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Object o = session.getAttribute("currentUser");
        Object list = session.getAttribute("cart");
        if (o == null) {
//            Kiểm tra người dùng có đăng nhập hay không
//            System.out.println("");
            response.sendRedirect("login");
            return;
        } else {
            User u = (User) o;
            request.setAttribute("name", u.getName());
            request.setAttribute("address", u.getAddress());
            request.setAttribute("email", u.getEmail());
            request.setAttribute("phone", u.getPhone());
        }
        if (list == null) {
            request.setAttribute("subtotal", 0);
            request.setAttribute("ordertotal", 0);
        } else {
            Cart cart = new Cart((List) list);
            request.setAttribute("subtotal", cart.getTotalMoney());
            session.setAttribute("ordertotal", cart.getTotalMoney());
        }
        request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
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
        Object list = session.getAttribute("cart");
        int orderId;

        if (list != null) {
            Cart cart = new Cart((List) list);
            OrderDAO order = new OrderDAO();
            String name = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String note = request.getParameter("note");
            String address = request.getParameter("address");
            String payment = request.getParameter("paymentOption");
            User user = (User)session.getAttribute("currentUser");
            Order orderr = new Order(user.getId(),(double)session.getAttribute("ordertotal"), address, name, phone, email, note);
            if(payment.equalsIgnoreCase("VN Pay")){
                //PaymentServlet ps = new PaymentServlet();
                //ps.doPost(request, response);
                session.setAttribute("orderObject", orderr);
                session.setAttribute("order_name", name);
                session.setAttribute("order_email", email);
                session.setAttribute("order_phone", phone);
                session.setAttribute("order_note", note);
                session.setAttribute("order_address", address);
                response.sendRedirect("payment");
                return;
            }
            orderId = order.createOrder(orderr, cart, payment);
            session.setAttribute("orderid", orderId);
            request.setAttribute("orderid", orderId);
        } else {
            System.out.println("Cart is empty!");
        }
        request.getRequestDispatcher("OrderCompleted.jsp").forward(request, response);
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
