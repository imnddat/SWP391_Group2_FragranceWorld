/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BrandDAO;
import DAO.ProductDAO;
import Model.Brand;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;

/**
 *
 * @author Thinkpad
 */
public class ListProductViewController extends HttpServlet {

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
            out.println("<title>Servlet ListProductViewController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListProductViewController at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        int pageSize = 5;
        String[] brandsss = req.getParameterValues("brands");//[3,5,6]
        //--> bi?n string (3,5,6)
        String service = req.getParameter("service");
        String sorort = req.getParameter("sort");
        String sortString = "";
        switch (sorort) {
            case "1":
                sortString = "order by nameProduct asc";
                break;
            default:
                throw new AssertionError();
        }
        Vector<Brand> brands = (new BrandDAO()).getAll();
        req.setAttribute("allBrands", brands);

        if (session.getAttribute("numberProductsInCart") == null) {
            session.setAttribute("numberProductsInCart", 0);
        }

        if (service == null) {
            service = "listAllProducts";
        }
        if (service.equals("searchByKeywords")) {
            String keywords = req.getParameter("keywords");
            String sortBy = req.getParameter("sortBy");
            String filterByPrice = req.getParameter("filterByPrice");
            String filterByBrand = req.getParameter("filterByBrand");

            if (filterByPrice == null) {
                filterByPrice = "price-all";
            }

            if (filterByBrand == null) {
                filterByBrand = "brand-all";
            }

            Vector<Product> productsAfterFilterByKeywords = (new ProductDAO()).getProductsByKeywords(keywords);
            Vector<Product> productsAfterFilterByPrice;
            Vector<Product> productsAfterFilterByBrand;

            req.setAttribute("keywords", keywords);
            //filter by price
//            productsAfterFilterByPrice = (new ProductDAO()).filterByPrice(filterByPrice, productsAfterFilterByKeywords);
//            req.setAttribute("filterByPrice", filterByPrice);
//
//            //filter by brand
//            productsAfterFilterByBrand = (new ProductDAO()).filterByBrand(filterByBrand, productsAfterFilterByPrice);
//            req.setAttribute("filterByBrand", filterByBrand);
//
//            if (sortBy == null || sortBy.equals("unsorted")) {
//                req.setAttribute("allProducts", productsAfterFilterByBrand);
//                req.setAttribute("sortBy", "unsorted");
//
//            } else if (sortBy.equals("priceLowHigh") || sortBy.equals("priceHighLow") || sortBy.equals("latest")) {
//                Vector<Product> productsAfterFilter = (new ProductDAO()).sortProducts(productsAfterFilterByBrand, sortBy);
//
//                req.setAttribute("allProducts", productsAfterFilter);
//                req.setAttribute("sortBy", sortBy);
//            }
            req.getRequestDispatcher("index.jsp").forward(req, resp);
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
