package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */



import DAO.ProductDAO;
import Model.Brand;
import Model.Gender;
import Model.ImageProduct;
import Model.Product;
import Model.Sale;
import Model.Volume;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author Thinkpad
 */
public class DetailProductController extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
            ProductDAO dao = new ProductDAO();
       

        String spid = request.getParameter("productId");
        int pid = -1;
        try {
            pid = Integer.parseInt(spid);
        } catch (NumberFormatException e) {
            // do nothing
            return;
        }
        Product p = dao.getProductsById(pid);
        Brand b = dao.getBrandByProductId(pid);
        Gender g = dao.getGenderByProductId(pid);
        ArrayList<ImageProduct> i = dao.getImageProduct(pid);
        List<Volume> v = dao.getVolumesByProductId(pid);
        Sale s = dao.getSaleByProductId(pid);
        Vector<Product> product = (new ProductDAO()).getLastProduct();
        //bestseller
        request.setAttribute("MaxPriceProducts", product);
        //bestseller
        request.setAttribute("product", p);
        request.setAttribute("volume", v);
        request.setAttribute("price", v.get(0).getPrice());
        request.setAttribute("priceId", v.get(0).getId());
        request.setAttribute("brand", b.getName());
        request.setAttribute("gender", g.getGender());
        request.setAttribute("scent", p.getScent());
        request.setAttribute("discount", s.getDiscount());
        request.setAttribute("image", i.get(pid));
        request.getRequestDispatcher("productdetail.jsp").forward(request, response);
    } 

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
