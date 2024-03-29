package Controller;

import DAO.UserDAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.Constants;
import Model.User;
import Model.UserGoogleDTO;
import jakarta.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginGoogleHandler extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {      
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDTO user = getUserInfo(accessToken);
        System.out.println(user);
        // xu li login
        HttpSession session = request.getSession();
        JsonObject jsonResponse = new JsonObject();
        String email = user.getEmail();
        String fullname = user.getName();
        UserDAO udao = new UserDAO();
        User user1=null;
        System.out.println("2 email:"+email);
        System.out.println("3 fullname: "+fullname);
        try {
            //kiem tra xem user có trong database chua
             user1 = udao.getUserByMail(email);
        } catch (Exception ex) {
            Logger.getLogger(LoginGoogleHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("3:" + user1);
        
        if (session.getAttribute("currentUser") != null) {
            //xóa tất cả session!
            session.invalidate();
            session = request.getSession();
        }
        
        if(user1==null){
            User u = new User(null, null, email, fullname, null, null);
            try {
                udao.createUser(u);
            } catch (Exception ex) {
                System.out.println("không add được user");
                Logger.getLogger(LoginGoogleHandler.class.getName()).log(Level.SEVERE, null, ex);
            }
            session.setAttribute("currentUser", u);
            response.sendRedirect(request.getContextPath()+"/HomeController");
        }else{
            if (user1.getBanned() == 1) {
                jsonResponse.addProperty("errorMessage", "Access denied!");
                request.getRequestDispatcher("loginpage.jsp").forward(request, response);
            } else {
                session.setAttribute("currentUser", user1);
                if (user1.getRoleID() == 1) {
                    //chuyển hướng đến trang addmin
                    //response.sendRedirect("adminHome");
                    //request.getRequestDispatcher("adminHome.jsp").forward(request, response);
                } else if (user1.getRoleID() == 3) {
                    response.sendRedirect(request.getContextPath() + "/HomeController");
                    //jsonResponse.addProperty("redirectURL", request.getContextPath() + "/HomeController");
                    //request.getRequestDispatcher("view/homePage.jsp").forward(request, response);
                }
            }
        }
        //request.getRequestDispatcher("/HomeController").forward(request, response);
        

//        request.setAttribute("id", userGoogleDTO.getId());
//        request.setAttribute("name", userGoogleDTO.getName());
//        request.setAttribute("email", userGoogleDTO.getEmail());

       }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form()
                        .add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI)
                        .add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE)
                        .build()).execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);

        return googlePojo;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
