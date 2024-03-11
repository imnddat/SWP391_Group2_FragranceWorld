/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import DAO.UserDAO;
import Model.Cart;
import Model.Item;
import Model.Product;
import Model.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author THAISON
 */
public class ManageWishlist extends HttpServlet {

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
            out.println("<title>Servlet ManageWishlist</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageWishlist at " + request.getContextPath() + "</h1>");
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
//        HttpSession session = request.getSession();
//        UserDAO userDao = new UserDAO();
//        ArrayList<Item> wishlist = null;
//        User user = (User) session.getAttribute("currentUser");
//        if (user != null) {
//            try {
//                wishlist = userDao.getUserWishList(user.getId());
//                session.setAttribute("wishlist", wishlist);
//                session.setAttribute("wishlistsize", wishlist.size());
//            } catch (SQLException ex) {
//                Logger.getLogger(ManageWishlist.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        } else {
//            session.setAttribute("wishlist", wishlist);
//            session.setAttribute("wishlistsize", "0");
//        }
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("currentUser");
        String action = request.getParameter("action");
        if (action != null) {
            session.removeAttribute("wishlist");
            session.removeAttribute("wishlistsize");
            if(user != null){
                UserDAO userDao = new UserDAO();
                userDao.updateUserWishlist(user.getId(), 0, "", "deleteAll");
            }
        } else {
            request.getRequestDispatcher("wishlist.jsp").forward(request, response);
        }
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
        Object o = session.getAttribute("wishlist");
        Cart cart = new Cart();

        if (o != null) {
            cart = new Cart((List) o);
        }

        String pQuantity = request.getParameter("quantity");
        String pId = request.getParameter("id");
        String pPrice = request.getParameter("price");
        String pVolume = request.getParameter("volume");

        int id, quantity;
        double price;
        User user = (User) session.getAttribute("currentUser");
        UserDAO userDao = new UserDAO();
        ProductDAO pd = new ProductDAO();
        try {
            id = Integer.parseInt(pId);
            quantity = Integer.parseInt(pQuantity);
            if (pVolume == null) {
                pVolume = "30";
                price = pd.getProductPrice(id, pVolume);
            } else {
                price = Double.parseDouble(pPrice);
            }

            Product p = pd.getProductsById(id);
            //double price = p.getPrice();
            if (quantity == 0) {
                cart.removeItem(id);
                if (user != null) {
                    userDao.updateUserWishlist(user.getId(), id, pVolume, "remove");
                }
            } else {
                Item item = new Item(p, quantity, price, pVolume);
                if (cart.addItem(item) && user != null) {
                    userDao.updateUserWishlist(user.getId(), id, pVolume, "add");
                }
            }
        } catch (Exception e) {
            quantity = 1;
        }
        List<Item> list = cart.getItemList();
        session.setAttribute("wishlist", list);
        session.setAttribute("wishlistsize", list.size());

        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("wishlistsize", list.size());

        // Chuyển đổi danh sách sản phẩm thành mảng JSON
        JsonArray wishlist = new JsonArray();
        for (Item item : list) {
            JsonObject itemObject = new JsonObject();
            itemObject.addProperty("productImg", item.getProduct().getDefaultImg());
            itemObject.addProperty("productName", item.getProduct().getNameProduct());
            itemObject.addProperty("productPrice", item.getPrice());
            itemObject.addProperty("productQuantity", item.getQuantity());
            itemObject.addProperty("productVolume", item.getVolume());
            //itemObject.addProperty("totalIteamPrice", item.getTotal(item.getQuantity(), item.getPrice()));
            wishlist.add(itemObject);
        }
        jsonResponse.add("wishlist", wishlist);

        // Trả về dữ liệu JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());

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
