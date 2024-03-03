/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import Model.Cart;
import Model.Item;
import Model.Product;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
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
 * @author THAISON
 */
public class ManageCart extends HttpServlet {

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
            out.println("<title>Servlet AddToCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCart at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
        //response.sendRedirect(request.getContextPath() + "/view/shoppingCart.jsp");
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
        Cart cart = new Cart();
        Object o = session.getAttribute("cart");

        if (o != null) {
            cart = new Cart((List) o);
        }

        String pQuantity = request.getParameter("quantity");
        String pId = request.getParameter("id");
        String pPrice = request.getParameter("price");
        String pVolume = request.getParameter("volume");
        
        System.out.println("volume111:    "+pVolume);
        
        int id, quantity;
        double price;
        try {
            id = Integer.parseInt(pId);
            quantity = Integer.parseInt(pQuantity);
            price = Double.parseDouble(pPrice);

            ProductDAO pd = new ProductDAO();
            Product p = pd.getProductsById(id);
            //double price = p.getPrice();
            if (quantity == 0) {
                cart.removeItem(id);
            } else {
                Item item = new Item(p, quantity, price, pVolume);
                cart.addItem(item);
            }
        } catch (Exception e) {
            quantity = 1;
        }

        for (Item i : cart.getItemList()) {
            System.out.println(i);
        }

        double totalMoney = cart.getTotalMoney();
        List<Item> list = cart.getItemList();
        session.setAttribute("cart", list);
        session.setAttribute("cartsize", list.size());
        session.setAttribute("totalMoney", totalMoney);

        //String targetJSP = "view/homePage.jsp";
        //request.getRequestDispatcher("view/homePage.jsp").forward(request, response);
        //response.sendRedirect(request.getContextPath());
        // Chuẩn bị dữ liệu phản hồi JSON
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("totalMoney", totalMoney);
        jsonResponse.addProperty("cartsize", list.size());

        // Chuyển đổi danh sách sản phẩm thành mảng JSON
        JsonArray cartArray = new JsonArray();
        for (Item item : list) {
            JsonObject itemObject = new JsonObject();
            itemObject.addProperty("productImg", item.getProduct().getDefaultImg());
            itemObject.addProperty("productName", item.getProduct().getNameProduct());
            itemObject.addProperty("productPrice", item.getPrice());
            itemObject.addProperty("productQuantity", item.getQuantity());
            itemObject.addProperty("productVolume", item.getVolume());
            //itemObject.addProperty("totalIteamPrice", item.getTotal(item.getQuantity(), item.getPrice()));
            cartArray.add(itemObject);
        }
        jsonResponse.add("cart", cartArray);

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
