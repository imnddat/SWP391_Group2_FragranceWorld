package Controller;

import DAO.ProductDetailDAO;
import Model.Brand;
import Model.Gender;
import Model.ImageProduct;
import Model.Product;
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
 * @author admin
 */
public class ProductDetailController extends HttpServlet {

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
        ProductDetailDAO dao = new ProductDetailDAO();
        List<List<String>> result;

        String spid = request.getParameter("productId");
        int pid = -1;
        try {
            pid = Integer.parseInt(spid);
        } catch (NumberFormatException e) {
            // do nothing
            return;
        }
        Product p = dao.getProduct(pid);
        Brand b = dao.getBrand(p.getBrandID());
        Gender g = dao.getGender(p.getGenderID());
        List<ImageProduct> i = dao.getImageProduct(pid);
        List<Volume> v = dao.getVolume(p.getId());
        Vector<Product> product = (new ProductDetailDAO()).getLastProduct();
        //bestseller
        request.setAttribute("MaxPriceProducts", product);
        //bestseller
////        int salePercent = dao.getSaleProduct(pid);
//        if(salePercent != 1){
//            double salePrice = v.get(0).getPrice() - v.get(0).getPrice()*salePercent/100;
//            request.setAttribute("salePrice", salePrice);
//        }
        request.setAttribute("product", p);
        request.setAttribute("volume", v);
        request.setAttribute("price", v.get(0).getPrice());
        request.setAttribute("priceId", v.get(0).getId());
//        request.setAttribute("salePercent", salePercent);
        request.setAttribute("brand", b.getName());
        request.setAttribute("gender", g.getGender());
        request.setAttribute("scent", p.getScent());
        request.setAttribute("image", getPath(i));
        request.getRequestDispatcher("productdetail.jsp").forward(request, response);
    }

    public static double convertToDecimal(int number) {
        if (number == 0) {
            return 1;
        }
        int digits = (int) Math.log10(number) + 1;
        double result = (double) number / Math.pow(10, digits);
        return result;
    }

    public List<String> getPath(List<ImageProduct> list) {
        List<String> paths = new ArrayList<>();

        for (ImageProduct imageProduct : list) {
            String path = imageProduct.getPath();
            // Remove all occurrences of the character "
            path = path.replace("\"", "");
            paths.add(path);
        }

        return paths;
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
        processRequest(request, response);
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
        processRequest(request, response);
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
