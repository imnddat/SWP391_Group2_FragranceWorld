package Controller;

import DAO.UserDAO;
import Model.User;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author THAISON
 */
public class EditUserProfile extends HttpServlet {

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
            out.println("<title>Servlet EditUserProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditUserProfile at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(false); // Lấy session hiện tại (nếu tồn tại)
        int userId = -1;
        if (session != null) {
            User user = (User) session.getAttribute("currentUser"); // Lấy đối tượng User từ session
            if (user != null) {
                userId = user.getId(); // Lấy userId từ đối tượng User
                // Bây giờ bạn có thể sử dụng userId ở đây cho các mục đích của mình
                // ======Lấy dữ liệu từ request=======
                String username = request.getParameter("username");
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                //System.out.println(username);
                // Kiểm tra tính hợp lệ của dữ liệu
                //boolean isValid = checkDataValidity(username, fullName, email, phone, address);
                JsonObject jsonResponse = new JsonObject();
                UserDAO dao = new UserDAO();
                boolean updatesuccess = true;
                
                
                try {
                    //                System.out.println("username: "+username);
//                System.out.println("username2: "+user.getUsername());
                    if (!checkUsernameValid(user, username, jsonResponse, dao)) {                       
                        updatesuccess = false;
                        username = user.getUsername();
                    }
                } catch (Exception ex) {
                    Logger.getLogger(EditUserProfile.class.getName()).log(Level.SEVERE, null, ex);
                }
                //=======================fullname============================
                if (!checkFullnameValid(user, fullName, jsonResponse, dao)) {                                          
                        updatesuccess = false;                   
                        fullName = user.getName();
                }
                //=======================email============================
                if (!checkEmailValid(user, email, jsonResponse, dao)) {                                    
                        updatesuccess = false;                   
                        email = user.getEmail();
                }
                //=======================email============================
                try {                   
                    if (!checkPhoneValid(user, phone, jsonResponse, dao)) {                   
                        updatesuccess = false;
                        phone = user.getPhone();
                    }
                } catch (Exception ex) {
                    Logger.getLogger(EditUserProfile.class.getName()).log(Level.SEVERE, null, ex);
                }
                //=======================adđress============================
                if (!checkAddressValid(user, address, jsonResponse, dao)) {                                       
                        updatesuccess = false;                  
                        address = user.getAddress();
                }
                
                if(user.getUsername().equals(username) && user.getName().equals(fullName) 
                        && user.getEmail().equals(email) && user.getPhone().equals(phone) 
                        && user.getAddress().equals(address)){
                    updatesuccess = false;
                }
                            
                User userUpdate = new User(userId, username, email, fullName, address, phone);
                //System.out.println(userUpdate);

                try {
                    dao.editUserProfile(userUpdate);
                    session.setAttribute("currentUser", dao.getUserById(userId));
                } catch (Exception ex) {
                    Logger.getLogger(EditUserProfile.class.getName()).log(Level.SEVERE, null, ex);
                }
                if (updatesuccess) {
                    response.getWriter().write("Update successful");
                } else {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(jsonResponse.toString());
                }
                //end
            }
        }

        //response.sendRedirect(request.getContextPath()+"/profilesetting");
    }

//    private boolean checkDataValidity(String username, String fullName, String email, String phone, String address) {
//        // Thực hiện kiểm tra tính hợp lệ của từng dữ liệu
//        boolean isUsernameValid = checkUsernameValid(username);
//        boolean isFullNameValid = checkFullnameValid(fullName);
//        boolean isEmailValid = checkEmailValid(email);
//        boolean isPhoneValid = checkPhoneValid(phone);
//        boolean isAddressValid = checkAddressValid(address);
//
//        // Trả về true nếu tất cả dữ liệu đều hợp lệ, ngược lại trả về false
//        return isUsernameValid && isFullNameValid && isEmailValid && isPhoneValid && isAddressValid;
//    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private boolean checkUsernameValid(User user, String username, JsonObject jsonResponse, UserDAO dao) throws Exception {
        if(user.getUsername().equals(username)){
            return true;
        }
        if (username == null || username.trim().isEmpty()) {
            jsonResponse.addProperty("usernamealert", "username cannot be empty");
            return false;
        } else if (dao.getUserByUsername(username) != null) {
            jsonResponse.addProperty("usernamealert", "username is already used");
            return false;
        }
        //nếu trống thì false
        jsonResponse.addProperty("usernamealert", "Update successfully!");
        return true;
    }

    private boolean checkFullnameValid(User user, String fullName, JsonObject jsonResponse, UserDAO dao) {
        if(user.getName().equals(fullName)){
            return true;
        }
        if (fullName == null || fullName.trim().isEmpty()) {
            jsonResponse.addProperty("fullNamealert", "fullName not valid!");
            return false;
        }
        jsonResponse.addProperty("fullNamealert", "Update successfully!");
        return true;
    }

    private boolean checkEmailValid(User user, String email, JsonObject jsonResponse, UserDAO dao) {
        String mailRegex = "^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$";
        if(user.getEmail().equals(email)){
            return true;
        }
        if (email == null || email.trim().isEmpty() || !email.matches(mailRegex)) {
            jsonResponse.addProperty("emailalert", "email not valid!");
            return false;
        } else if(dao.getUserByMail(email)!=null){
            jsonResponse.addProperty("emailalert", "email is already used!");
            return false;
        }
        
        jsonResponse.addProperty("emailalert", "Update successfully!");
        return true;
    }

    private boolean checkPhoneValid(User user, String phone, JsonObject jsonResponse, UserDAO dao) throws Exception {
        String moblieRegex = "^(09|03|07|08|05)+([0-9]{8})$";
        if(user.getPhone().equals(phone)){
            return true;
        }
        if (phone == null || phone.trim().isEmpty() || !phone.matches(moblieRegex)) {
            jsonResponse.addProperty("phonealert", "phone not valid!");
            return false;
        } else if(dao.getUserByMobile(phone)!=null){
            jsonResponse.addProperty("phonealert", "phone is already used!");
            return false;
        }
        
        jsonResponse.addProperty("phonealert", "Update successfully!");
        return true;
    }

    private boolean checkAddressValid(User user, String address, JsonObject jsonResponse, UserDAO dao) {
        if(user.getAddress().equals(address)){
            return true;
        }
        if (address == null || address.trim().isEmpty()) {
            jsonResponse.addProperty("addressalert", "address not valid!");
            return false;
        }
        
        jsonResponse.addProperty("addressalert", "Update successfully!");
        return true;
    }

}
