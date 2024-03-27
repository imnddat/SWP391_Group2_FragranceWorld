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
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
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
        // Xử lý dữ liệu gửi từ biểu mẫu HTML
        // Lấy dữ liệu từ trường name
        Part namePart = request.getPart("name");
        InputStream nameStream = namePart.getInputStream();
        BufferedReader nameReader = new BufferedReader(new InputStreamReader(nameStream));
        String name = nameReader.readLine();
        
        //description
        Part descriptionPart = request.getPart("description");
        InputStream descriptionStream = descriptionPart.getInputStream();
        BufferedReader descriptionReader = new BufferedReader(new InputStreamReader(descriptionStream));
        String description = descriptionReader.readLine();
        
        //code
        Part codePart = request.getPart("code");
        InputStream codeStream = codePart.getInputStream();
        BufferedReader codeReader = new BufferedReader(new InputStreamReader(codeStream));
        String code = codeReader.readLine();
        
        // Lấy dữ liệu từ trường brand
        Part brandPart = request.getPart("brand");
        InputStream brandStream = brandPart.getInputStream();
        BufferedReader brandReader = new BufferedReader(new InputStreamReader(brandStream));
        String brandValue = brandReader.readLine();
        int brandId = Integer.parseInt(brandValue);
       
        // Lấy dữ liệu từ trường gender
        Part genderPart = request.getPart("gender");
        InputStream genderStream = genderPart.getInputStream();
        BufferedReader genderReader = new BufferedReader(new InputStreamReader(genderStream));
        String genderValue = genderReader.readLine();
        int genderId = Integer.parseInt(genderValue);
        
        // Lấy dữ liệu từ trường scent
        Part scentPart = request.getPart("scent");
        InputStream scentStream = scentPart.getInputStream();
        BufferedReader scentReader = new BufferedReader(new InputStreamReader(scentStream));
        String scent = scentReader.readLine();
        System.out.println(brandId + genderId + name + code + scent);
        String defaultImg = "";

        // Xử lý tệp hình ảnh
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        InputStream fileContent = filePart.getInputStream();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String filePath = uploadPath + File.separator + fileName;
        Files.copy(fileContent, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
        defaultImg = "images/" + fileName; // Lưu đường dẫn của hình ảnh vào cơ sở dữ liệu

        // Tạo đối tượng sản phẩm mới
        Products product = new Products();
        product.setNameProduct(name);
        product.setDescription(description);
        product.setCodeProduct(code);

        Brand brand = new Brand();
        brand.setId(brandId);
        product.setBrand(brand);

        Gender gender = new Gender();
        gender.setId(genderId);
        product.setGender(gender);

        product.setScent(scent);
        product.setDefaultImg(defaultImg);

        ProductDAO pd = new ProductDAO();
        pd.addProduct(product);

        response.sendRedirect("listproduct");
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
