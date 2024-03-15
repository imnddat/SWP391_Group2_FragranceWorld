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
import java.util.Arrays;
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String xpage = req.getParameter("page")== null ||req.getParameter("page")== "" ? "1" : req.getParameter("page");
        //
        //    HttpSession session = req.getSession();
        //   String service = req.getParameter("service");
        ProductDAO dao = new ProductDAO();

        //searchby name
        String searchbyName = req.getParameter("searchbyName") == null ? "" : req.getParameter("searchbyName");
        //Vector<Product> searchbyNames = dao.getSearchName(searchbyName);

        //sortby
        String sortType = req.getParameter("sortType") == null ? "" : req.getParameter("sortType");
        // ArrayList<Product> sortby = dao.getSearchListProductbySearch(sortType);
        //    req.setAttribute("sortby", sortby);

        //checkbox price
        String filter = req.getParameter("filter");
        double minP = 0;
        double maxP = 99999;
        filter = "";
        switch (filter) {
            case "price-10-100":
                minP = 10;
                maxP = 100;
                // set lại min vag max
                break;
            case "price-100-250":
                minP = 100;
                maxP = 250;
                break;
            case "price-250-500":
                minP = 250;
                maxP = 500;
                break;
            case "price-500up":

                minP = 500;
                maxP = 99999;
                break;
            default:
                minP = 0;
                maxP = 99999;
                break;
        }

        //checkbox Brand
        String[] id_raw = req.getParameterValues("idbrands");
        ArrayList<String> bvalues = new ArrayList<>();

        int[] idbrands = null;
        if (id_raw != null) {
            idbrands = new int[id_raw.length];
            for (int i = 0; i < idbrands.length; i++) {
                idbrands[i] = Integer.parseInt(id_raw[i]);
                bvalues.add(id_raw[i]);
            }
        }

        req.setAttribute("bvalues", bvalues);
        // ProductDAO pb = new ProductDAO();
        //ArrayList<Product> listcheckbrand = pb.checkBoxBrand(idbrands);
        //req.setAttribute("listcheckbrand", listcheckbrand);
        BrandDAO bd = new BrandDAO();
        ArrayList<Brand> listbrand = bd.getAll();
        boolean[] cid = new boolean[listbrand.size()];
        for (int i = 0; i < cid.length; i++) {
            if (ischeck(listbrand.get(i).getId(), idbrands)) {
                cid[i] = true;
            } else {
                cid[i] = false;
            }

        }
        req.setAttribute("listbrand", listbrand);
        req.setAttribute("cid", cid);

        //  String paramndex = req.getParameter("index")== null ? "1" : req.getParameter("index");
        //String genderSearch = req.getParameter("id");
        //search gender
        String genderSearch = req.getParameter("id") == null ? "" : req.getParameter("id");
        //search capcity
        String volumeSearchCapacity = req.getParameter("volumeSearchCapacity") == null ? "" : req.getParameter("volumeSearchCapacity");
        //search Scent
        String productSearchScent = req.getParameter("productSearchScent") == null ? "" : req.getParameter("productSearchScent");//chu
        //search by from
        String brandSortMakebyFrom = req.getParameter("brandSortMakebyFrom") == null ? "" : req.getParameter("brandSortMakebyFrom");//chu
        // search by brand
        String brandSort = req.getParameter("brandSort") == null ? "" : req.getParameter("brandSort");//chu

        try {
            //phan trang

            ArrayList<Product> list1 = dao.getALLProductByGender(genderSearch, volumeSearchCapacity, productSearchScent, brandSortMakebyFrom, brandSort, sortType, idbrands, searchbyName, minP, maxP);

//            list1 = dao.getListByPage(list1, bid, bid);
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
            req.setAttribute("volumeSearchCapacity", volumeSearchCapacity);
            req.setAttribute("productSearchScent", productSearchScent);
            req.setAttribute("brandSortMakebyFrom", brandSortMakebyFrom);
            req.setAttribute("brandSort", brandSort);
            req.setAttribute("sortType", sortType);
            req.setAttribute("idbrands", idbrands);
            req.setAttribute("searchbyName", searchbyName);

            req.getRequestDispatcher("listProductView.jsp").forward(req, resp);

            System.out.println("Value of 'page' parameter: " + req.getParameter("page"));
            System.out.println("Value of 'searchbyName' parameter: " + req.getParameter("searchbyName"));
            System.out.println("Value of 'sortType' parameter: " + req.getParameter("sortType"));
            System.out.println("Value of 'filter' parameter: " + req.getParameter("filter"));
            System.out.println("Value of 'idbrands' parameter: " + Arrays.toString(req.getParameterValues("idbrands")));
            System.out.println("Value of 'id' parameter: " + req.getParameter("id"));
            System.out.println("Value of 'volumeSearchCapacity' parameter: " + req.getParameter("volumeSearchCapacity"));
            System.out.println("Value of 'volumeSort' parameter: " + req.getParameter("volumeSort"));
            System.out.println("Value of 'productSearchScent' parameter: " + req.getParameter("productSearchScent"));
            System.out.println("Value of 'brandSortMakebyFrom' parameter: " + req.getParameter("brandSortMakebyFrom"));
            System.out.println("Value of 'brandSort' parameter: " + req.getParameter("brandSort"));
        } catch (Exception ex) {
            resp.getWriter().print(ex.getMessage());
            ex.printStackTrace();
        }

    }

    private boolean ischeck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
            return false;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
