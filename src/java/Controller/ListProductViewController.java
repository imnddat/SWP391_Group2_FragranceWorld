/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BrandDAO;
import DAO.ProductDAO;
import Model.Brand;
import Model.Product;
import Model.Volume;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
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
        String xpage = req.getParameter("page");
        HttpSession session = req.getSession();
        ProductDAO dao = new ProductDAO();
        String search = req.getParameter("search");
        String brandid = req.getParameter("brandid");
        String priceFrom = req.getParameter("priceFrom");
        String priceTo = req.getParameter("priceTo");
        String sortType = req.getParameter("sortType");
        ArrayList<Product> searchlist = dao.getSearchListProductbySearch(search, brandid, priceFrom, priceTo, sortType);
        //Brand searchbyBrand = dao.getBrandByProductId(id);
        req.setAttribute("searchlist", searchlist);
       
        
        
      //  String paramndex = req.getParameter("index")== null ? "1" : req.getParameter("index");
        //String genderSearch = req.getParameter("id");
        //search gender
        String genderSearch = req.getParameter("id") == null ? "" : req.getParameter("id");//[3,5,6]
        //search capcity
        String volumeSearchCapacity = req.getParameter("volumeSearchCapacity") == null ? "" : req.getParameter("volumeSearchCapacity");//[3,5,6]
        //neu nhu search mac dinh la capacity = 30
        String volumeSort = req.getParameter("volumeSort") == null ? "30" : req.getParameter("volumeSort");//[3,5,6]
        //search Scent
        String productSearchScent = req.getParameter("productSearchScent") == null ? "" : req.getParameter("productSearchScent");//chu
        //search by from
        String brandSortMakebyFrom = req.getParameter("brandSortMakebyFrom") == null ? "" : req.getParameter("brandSortMakebyFrom");//chu
        // search by brand
        String brandSort = req.getParameter("brandSort") == null ? "" : req.getParameter("brandSort");//[3,5,6]
       
//        int bid = 0,cid=0,eid=0,gid=0,kid=0,aid=0;
//        try {
//            bid = Integer.parseInt(genderSearch);
//            cid = Integer.parseInt(volumeSearchCapacity);
//            eid = Integer.parseInt(volumeSort); 
//            gid = Integer.parseInt(productSearchScent);
//            kid = Integer.parseInt(brandSortMakebyFrom);
//            aid = Integer.parseInt(brandSort);
//        } catch (NumberFormatException e) {
//        }

        try {
            //phan trang
            
            ArrayList<Product> list1 = dao.getALLProductByGender(genderSearch, volumeSearchCapacity, volumeSort, productSearchScent, brandSortMakebyFrom, brandSort);
//            ArrayList<Product> listc = dao.getALLProductByGender(cid);
//            ArrayList<Product> liste = dao.getALLProductByGender(eid);
//            ArrayList<Product> listg = dao.getALLProductByGender(gid);
//            ArrayList<Product> listk = dao.getALLProductByGender(kid);
//            ArrayList<Product> lista = dao.getALLProductByGender(aid);
//            ArrayList<Product> list1 = new ArrayList<>();
//            list1 = dao.getListByPage(list1, bid, bid)

            int page = 0, numberpage = 3;
            int size = list1.size();
            int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1);
            System.out.println(size);

            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numberpage;
            end = Math.min(page * numberpage, size);
            ArrayList<Product> listProduct = dao.getListByPage(list1, start, end);
          
            System.out.println(start + " " + end);
            req.setAttribute("listProduct", listProduct);
            req.setAttribute("page", page);
            req.setAttribute("num", num);
            req.setAttribute("id", genderSearch);

            req.getRequestDispatcher("listProductView.jsp").forward(req, resp);

        } catch (Exception ex) {
            System.out.println("product error: " + ex.getMessage());
            resp.sendRedirect("/ListProductViewController");
        }

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
