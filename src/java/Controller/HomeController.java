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
        ArrayList<Brand> brands = null;
        try {
            brands = (new BrandDAO()).getAll();
        } catch (Exception ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("allBrands", brands);
        
        if (service == null) {
            service = "listAllProducts";
        }

        if (service.equals("listAllProducts")) {
            //search
            String keywords = request.getParameter("keywords")==null?"":request.getParameter("keywords");
            Vector<Product> products = (new ProductDAO()).getProductsByKeywords(keywords);
            Vector<Product> productsold = (new ProductDAO()).getProductBySold(keywords);
        //    Vector<Product> productstar = (new ProductDAO()).getProductBySold(keywords);
            Vector<Product> productsale = (new ProductDAO()).getProductBySale(keywords);
            
            
            request.setAttribute("allProducts", products);
            request.setAttribute("productbySold", productsold);
            request.setAttribute("productbySale", productsale);
            
            Vector<Product> product = (new ProductDAO()).getProductMaxPrice();
            //bestseller
            request.setAttribute("MaxPriceProducts", product);
            Vector<Product> producthotsale = null;
            try {
                producthotsale = (new ProductDAO()).getProductHotSaleTopGirl();
            } catch (Exception ex) {
                Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
            }
            Vector<Product> producthotsaletopboy = null;
            try {
                producthotsaletopboy = (new ProductDAO()).getProductHotSaleTopBoy();
            } catch (Exception ex) {
                Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
            }
            Vector<Product> producthotsale1 = null;
            try {
                producthotsale1 = (new ProductDAO()).getProductHotSale1();
            } catch (Exception ex) {
                Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
            }
            //Hotsale
            request.setAttribute("HotSaleProducts", producthotsale);
            request.setAttribute("HotSaleProductstopboy", producthotsaletopboy);
            request.setAttribute("HotSaleProducts1", producthotsale1);
            request.getRequestDispatcher("home.jsp").forward(request, response);

        }
         
        //lay brandTab tab trang
//        String id_raw = request.getParameter("id");
//         int id;
//         if (id_raw == null) {
//            id = 1;
//        } else {
//             id = Integer.parseInt(id_raw);
//        }
//          ProductDAO dao = new ProductDAO();
//        ArrayList<Product> list1 = dao.getProductByBrand(id);
//        int page, numberpage = 3;
//        int size = list1.size();
//        int num = (size % 3==0 ? (size/3) : ((size/3))+1);
//        String xpage= request.getParameter("page");
//        if (xpage == null) {
//            page = 1;
//        }else{
//          page = Integer.parseInt(xpage);
//        }
//        int start,end;
//        start = (page - 1)*numberpage;
//        end = Math.min(page*numberpage,size );
//       ArrayList<Product> list = dao.getListByPage(list1,start,end);
//        
//        request.setAttribute("data", list);
//        request.setAttribute("page", page);
//        request.setAttribute("num", num);
//        request.setAttribute("id", id);
      //  request.getRequestDispatcher("listProductView.jsp").forward(request, response);
         
         
        
        
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
