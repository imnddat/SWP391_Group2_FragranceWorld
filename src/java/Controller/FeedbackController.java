/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.FeedbackDAO;
import Model.User;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.Base64;
import Model.Feedback;
import java.sql.Date;
import java.text.SimpleDateFormat;
import org.apache.commons.compress.utils.IOUtils;

/**
 *
 * @author Thinkpad
 */
public class FeedbackController extends HttpServlet {

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
            out.println("<title>Servlet FeedbackController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Feedback.jsp").forward(request, response);
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
        User acc = (User) request.getSession().getAttribute("acc");
        FeedbackDAO dao = new FeedbackDAO();

//        Part p = request.getPart("image");
//        InputStream inputStream = p.getInputStream();
//        byte[] imageBytes = IOUtils.toByteArray(inputStream);
//        String imageString = Base64.getEncoder().encodeToString(imageBytes);
//        Feedback x = (Feedback)session.getAttribute("") ;       
//        dao.updateImg(imageString, x.getUserID());       
        if (acc == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            // Retrieve feedback information from the request parameters
            String review = request.getParameter("review");
            String feedbackDate = request.getParameter("feedbackDate");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Định dạng của ngày trong tham số request
//            Date feedbackDate = null;
//            try {
//                feedbackDate = sdf.parse(feedbackDateStr);
//            } catch (ParseException e) {
//                e.printStackTrace(); // Xử lý ngoại lệ nếu có lỗi khi phân tích chuỗi thành ngày
//            }
            int star = Integer.parseInt(request.getParameter("star"));
            int userID = acc.getId(); // Assuming acc.getId() returns the user ID
            int orderID = Integer.parseInt(request.getParameter("orderID"));
            int productID = Integer.parseInt(request.getParameter("productID"));
            String img = request.getParameter("img");
           // Feedback feedback = new Feedback(review, feedbackDate, star, userID, orderID, productID, img);
           // dao.addReview(feedback);
        }
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
