/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BrandDAO;
import DAO.ProductDAO;
import DAO.UserDAO;

import DAO.VolumeDAO;
import Model.Brand;
import Model.Item;
import Model.Product;
import Model.User;
import Model.Volume;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thinkpad
 */
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDAO userDao = new UserDAO();
        ArrayList<Item> wishlist = null;
        User user = (User) session.getAttribute("currentUser");
        //System.out.println("userid: "+ user.getId());
        if (user != null) {
            try {
                wishlist = userDao.getUserWishList(user.getId());
                session.setAttribute("wishlist", wishlist);
                session.setAttribute("wishlistsize", wishlist.size());
            } catch (SQLException ex) {
                Logger.getLogger(ManageWishlist.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
        
        String service = request.getParameter("service");
        Vector<Brand> brands = (new BrandDAO()).getAll();
        request.setAttribute("allBrands", brands);

        if (session.getAttribute("numberProductsInCart") == null) {
            session.setAttribute("numberProductsInCart", 0);
        }

        if (service == null) {
            service = "listAllProducts";
        }

        if (service.equals("listAllProducts")) {
            //search
            String keywords = request.getParameter("keywords")==null?"":request.getParameter("keywords");
            Vector<Product> products = (new ProductDAO()).getProductsByKeywords(keywords);
            request.setAttribute("allProducts", products);
            Vector<Product> product = (new ProductDAO()).getProductMaxPrice();
            //bestseller
            request.setAttribute("MaxPriceProducts", product);
            Vector<Product> producthotsale = (new ProductDAO()).getProductHotSale();
            //Hotsale
            request.setAttribute("HotSaleProducts", producthotsale);
            request.getRequestDispatcher("home.jsp").forward(request, response);

        }
//        if(service.equals("ListAllVolume")){
//            Vector<Volume> volume = (new VolumeDAO()).getAll();
//            request.setAttribute("allVolume", volume);
//            request.getRequestDispatcher("home.jsp").forward(request, response);
//        }
//       if (service.equals("listProductsMaxPrice")) {
//                   Vector<Product> product = (new ProductDAO()).getProductHotSale();
//            request.setAttribute("HotSaleProducts", product);
//         request.getRequestDispatcher("home.jsp").forward(request, response);
//      }

      

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("home.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
