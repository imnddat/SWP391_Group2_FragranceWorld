/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlleradmin;

import daoadmin.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import modeladmin.Brand;
import modeladmin.Gender;
import modeladmin.Products;

/**
 *
 * @author NguyenDucDat
 */
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO pd = new ProductDAO();
        List<Brand> listb = pd.getAllBrand();
        for (Brand brand : listb) {
            System.out.println(brand);
        }
        List<Gender> listg = pd.getAllGender();
        request.setAttribute("genders", listg);
        request.setAttribute("brands", listb);
        request.getRequestDispatcher("./view_admin/product/addproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract form data
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String code = request.getParameter("code");
        int brandId = Integer.parseInt(request.getParameter("brand"));
        int genderId = Integer.parseInt(request.getParameter("gender"));
        String scent = request.getParameter("scent");
        Part imagePart = request.getPart("image");
        InputStream imageStream = imagePart.getInputStream();
        String imageName = imagePart.getSubmittedFileName();

        // Create a Products object
        Products product = new Products();
        product.setNameProduct(name);
        product.setDescription(description);
        product.setCodeProduct(code);
        product.setScent(scent);

        Brand brand = new Brand();
        brand.setId(brandId);
        product.setBrand(brand);

        Gender gender = new Gender();
        gender.setId(genderId);
        product.setGender(gender);

        // Save image file
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String imagePath = uploadPath + File.separator + imageName;
        Files.copy(imageStream, Paths.get(imagePath), StandardCopyOption.REPLACE_EXISTING);
        product.setDefaultImg("images/" + imageName);

        // Use ProductDAO to add the product to the database
        ProductDAO pd = new ProductDAO();
        pd.addProduct(product);

        // Redirect the user to a success page or a relevant page
        response.sendRedirect("listproduct");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
