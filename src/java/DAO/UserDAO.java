/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Item;
import Model.Product;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import ultil.MD5;
import ultil.SendMail;

/**
 *
 * @author Thinkpad
 */
public class UserDAO extends DBConnection {

    public ArrayList<User> getUserAllUser() throws Exception {
        ArrayList<User> newUserList = new ArrayList();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pre = null;
        String sql = "SELECT * FROM [User]";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                newUserList.add(new User(rs.getInt("id"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("fullname"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getInt("roleID"),
                        rs.getInt("banned")));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return newUserList;
    }

    
    public User getUserLogin(String username, String password) throws Exception {
        try {
            // Thực hiện truy vấn để lấy thông tin người dùng từ bảng
            String query = "SELECT * FROM [dbo].[User] WHERE username = ? AND password = ?";
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, username);
                  preparedStatement.setString(2, MD5.getMd5(password));

                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    // Nếu có kết quả từ truy vấn, tạo đối tượng User và trả về
                    if (resultSet.next()) {
                        User user = new User();
                        user.setId(resultSet.getInt("id"));
                        user.setUsername(resultSet.getString("username"));
                        user.setPassword(resultSet.getString("password"));
                        user.setEmail(resultSet.getString("email"));
                        user.setName(resultSet.getString("fullname"));
                        user.setAddress(resultSet.getString("address"));
                        user.setPhone(resultSet.getString("phone"));
                        user.setRoleID(resultSet.getInt("roleID"));
                        user.setBanned(resultSet.getInt("banned"));
                        return user;
                    }
                }
            }
        } catch (SQLException e) {
//            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, e);
        }

        return null; // Trả về null nếu không tìm thấy người dùng
    }

    
    public String getUserRegister(String username, String pass, String email, String name, String address, String phone, String dob) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            String password = MD5.getMd5(pass);
            //chuan bi string sql
            String sql = " INSERT INTO [dbo].[User]([username],[password],[email],[fullname],[address],[phone],[roleID],[banned],[dob])\n"
                    + "     VALUES ( ?,?,?, ?,?,?, '3', '0', ? )";
            conn = new DBConnection().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            //set bien dungs voiw thuw tu bien trong string tren
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, name);
            ps.setString(5, address);
            ps.setString(6, phone);
            ps.setString(7, dob);

            //goi cau lenh execute
            ps.executeUpdate();

            SendMail.send(email, "Verify new user", "<h2>Welcome to my system</h2>"
                    + "<a href=\"http://localhost:9999/FragranceWorld/verify-user?username="
                    + username + " \" > Click here to verify your account!</a> ");
            return username;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

//     public static void main(String[] args) {
//        // Thử gọi hàm getUserRegister với các giá trị thích hợp để kiểm tra
//        String username = "testuser";
//        String password = "testpass";
//        String email = "test@example.com";
//        String name = "Test User";
//        String address = "123 Test St";
//        String phone = "1234567890";
//
//        // Gọi hàm getUserRegister và kiểm tra kết quả
//        UserDAO us = new UserDAO();
//        String result = us.getUserRegister(username, name, email, name, address, phone);
//        if (result != null) {
//            System.out.println("User registered successfully with username: " + result);
//        } else {
//            System.out.println("Failed to register user.");
//        }
//        }
    
    public boolean checkOldPassword(String username, String oldPassword) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM [dbo].[User] u where u.username = ? and u.password = ? ";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, MD5.getMd5(oldPassword)); // Sử dụng MD5 để mã hóa mật khẩu cũ
            rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
  
//    public static void main(String[] args) {
//        // Thay đổi giá trị username và oldPassword tùy ý
//        String username = "thinh123456";
//        String oldPassword = "123456";
//
//        // Tạo một đối tượng của lớp chứa hàm checkOldPassword
//        UserDAO yourClassName = new UserDAO(); // Thay YourClassName bằng tên lớp chứa hàm checkOldPassword
//
//        // Gọi hàm checkOldPassword và in kết quả
//        boolean passwordIsValid = yourClassName.checkOldPassword(username, oldPassword);
//        if (passwordIsValid) {
//            System.out.println("Mật khẩu cũ hợp lệ.");
//        } else {
//            System.out.println("Mật khẩu cũ không hợp lệ.");
//        }
//    }

   

    public void changePassword1(String username, String newPassword) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = " UPDATE [dbo].[User] SET [password] = ? WHERE username = ? ";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, MD5.getMd5(newPassword)); // Mã hóa mật khẩu mới
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
     public void updatePassword(String email, String newPassword) {
         Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = " UPDATE [dbo].[User] SET [password] = ? WHERE email = ?";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, MD5.getMd5(newPassword)); // Mã hóa mật khẩu mới
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    

    public boolean checkEmailExists(String email) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = " SELECT COUNT(*) FROM [dbo].[User] WHERE email = ? ";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean checkOTP(String email, String otp) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = " SELECT COUNT(*) FROM [dbo].[User] WHERE email = ? AND otp = ? ";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, otp);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void saveOTP(String email, String otp) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = " UPDATE [dbo].[User] SET [otp] = ? WHERE email = ? ";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, otp);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void resetOTP(String email) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = " UPDATE [dbo].[User] SET [otp] = ? WHERE email = ? ";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getEmailByOTP(String otp) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = " SELECT [email] FROM [dbo].[User] where otp = ? ";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, otp);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("email");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkOTPMatchesEmail(String email, String otp) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = " SELECT [otp] FROM [dbo].[User] where email = ? ";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                String storedOTP = rs.getString("otp");
                return otp.equals(storedOTP);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Phương thức để gửi mã OTP qua email
    private void sendOTPByEmail(String email, String otp) {
        String host = "smtp.gmail.com";
        String port = "587";
        String username = "ThinhLCTHE173302@fpt.edu.vn";
        String password = "Thinhmache123@#";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("OTP Change Password");
            message.setText("Your OTP: " + otp);
            Transport.send(message);
            System.out.println("Email sent successfully");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public User getUserByMobile(String phone) throws Exception {
        Connection conn = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        String sql = " SELECT * FROM [User] WHERE phone = ? ";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, phone);
            rs = pre.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("fullname"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getInt("roleID"),
                        rs.getInt("banned"));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return null;
    }
    

 
    public User getUserById(int userId) throws Exception {
        Connection conn = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;

        String sql = "SELECT * FROM [User] WHERE id = ?";
        User user = null;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, userId);
            rs = pre.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt("id"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("fullname"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getInt("roleID"),
                        rs.getInt("banned"));
                return user;
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return null;
    }

    public User getUserByMail(String userMail)  {
        Connection conn = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;

        String sql = "SELECT * FROM [User] WHERE email = ? ";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, userMail);
            rs = pre.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("id"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("fullname"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getInt("roleID"),
                        rs.getInt("banned"));
            }
        } catch (SQLException ex) {
        } 
        return null;
    }

    public int updateUser(User updatedUser) throws Exception {
        Connection conn = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;

        String sql = " UPDATE [dbo].[User]\n"
                + "   SET [username] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[fullname] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[roleID] = ?\n"
                + "      ,[banned] = ?\n"
                + " WHERE id = ?";
        int check = 0;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, updatedUser.getUsername());
            pre.setString(2, updatedUser.getPassword());
            pre.setString(3, updatedUser.getEmail());
            pre.setString(4, updatedUser.getName());
            pre.setString(5, updatedUser.getAddress());
            pre.setString(6, updatedUser.getPhone());
            pre.setInt(7, updatedUser.getRoleID());
            pre.setInt(8, updatedUser.getBanned());
            pre.setInt(9, updatedUser.getId());
            check = pre.executeUpdate();
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }

        return check;
    }

 
    public int addUser(User newUser) throws Exception {
        Connection conn = null;
        ResultSet rs = null;
        /* Result set returned by the sqlserver */
        PreparedStatement pre = null;
        /* Prepared statement for executing sql queries */

        String sql = "INSERT INTO [dbo].[User]([username],[password],[email],[roleID],[banned])"
                + "values(?,?,?,?,?,?,?,?,?)";
        int check = 0;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, newUser.getUsername());
            pre.setString(2, newUser.getPassword());
            pre.setString(3, newUser.getEmail());
            pre.setInt(4, 1);
            pre.setInt(5, newUser.getBanned());
            check = pre.executeUpdate();
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }

        return check;
    }

   
    public int deleteUser(User user) throws Exception {
        Connection conn = null;
        ResultSet rs = null;
        /* Result set returned by the sqlserver */
        PreparedStatement pre = null;
        /* Prepared statement for executing sql queries */

        String sql = " delete from [User] where id = ?";

        int check = 0;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, user.getId());
            check = pre.executeUpdate();
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return check;

    }

//    public HashMap<String, Integer> getUserCountByRole() throws Exception {
//        HashMap<String, Integer> map = new HashMap();
//        Connection conn = null;
//        ResultSet rs = null;
//        PreparedStatement pre = null;
//        String sql = "SELECT userRoleName, COUNT(userRoleId) AS number "
//                + "FROM [UserRole] AS a JOIN [User] AS b ON a.userRoleId = b.roleId "
//                + "GROUP BY a.userRoleId,a.userRoleName ";
//        try {
//            conn = getConnection();
//            pre = conn.prepareStatement(sql);
//            rs = pre.executeQuery();
//            while (rs.next()) {
//                map.put(rs.getString("userRoleName"), rs.getInt("number"));
//            }
//        } catch (Exception ex) {
//            throw ex;
//        } finally {
//            closeResultSet(rs);
//            closePreparedStatement(pre);
//            closeConnection(conn);
//        }
//        return map;
//    }
    public User updateProfileUser(String name, String dob, String email, String phone, String address, String username) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User updatedUser = null;
        try {
            String sql = "update Users set [name] = ?, dob = ?, email = ?, phone = ?, address = ?, [username] = ? update_at = CURRENT_TIMESTAMP where [username] = ?";
            connection = new DBConnection().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, dob);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, username);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // If the update was successful, retrieve the updated user information
                String selectSql = "select * from Users where username = ?";
                ps = connection.prepareStatement(selectSql);
                ps.setString(1, name);
                rs = ps.executeQuery();

                if (rs.next()) {
                    // Create a User object with the updated information
                    updatedUser = new User();
                    updatedUser.setName(rs.getString("fullname"));
                    updatedUser.setDob(rs.getString("dob"));
                    updatedUser.setEmail(rs.getString("email"));
                    updatedUser.setPhone(rs.getString("phone"));
                    updatedUser.setAddress(rs.getString("address"));
                    updatedUser.setUsername(rs.getString("username"));
                }

                rs.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources (Connection, PreparedStatement, etc.)
        }

        return updatedUser;
    }

    public void createUser(User user) {
        String query = "INSERT INTO [dbo].[User]([username],[password],[email],[fullname],[address],[phone],[roleID],[banned]) "
                + "VALUES (?,?,?,?,?,?,3,0)";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getName());
            preparedStatement.setString(5, user.getAddress());
            preparedStatement.setString(6, user.getPhone());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<Item> getUserWishList(int userId) throws Exception {
        ProductDAO pdao = new ProductDAO();
        ArrayList<Item> itemList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String query = "SELECT p.*, w.volume FROM Wishlist w JOIN Products p ON w.productID = p.id WHERE w.userID = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int productId = resultSet.getInt("id");
                Product product = pdao.getProductsById(productId);
                String volume = resultSet.getString("volume");
                Double price = pdao.getProductPrice(productId, volume);
                Item item = new Item(product, price, volume);

                // Thêm các thuộc tính sản phẩm khác nếu cần
                itemList.add(item);
            }
            return itemList;
        } catch (SQLException e) {
            System.out.println("loi khi lay wishlist");
            // Xử lý ngoại lệ hoặc throw lại nếu cần thiết
            throw e;
        } finally {
            closeResultSet(resultSet);
            closePreparedStatement(preparedStatement);
            closeConnection(connection);
        }
    }

    public boolean updateUserWishlist(int userId, int productId, String volume, String action) {
        LocalDate date = LocalDate.now();
        if (action.equalsIgnoreCase("deleteAll")) {
            removeAllUserWishlist(userId);
        } else if (action.equalsIgnoreCase("add")) {
            addUserWishlist(userId, productId, volume, date);
        } else if (action.equalsIgnoreCase("remove")) {
            removeUserWishlist(userId, productId);
        }
        return false;
    }

    public boolean removeAllUserWishlist(int userId) {
        // Chuỗi SQL để xóa tất cả Wishlist của một người dùng
        String deleteSQL = "DELETE FROM Wishlist WHERE userId = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(deleteSQL)) {
            // Thiết lập tham số cho câu lệnh SQL
            preparedStatement.setInt(1, userId);

            // Thực hiện câu lệnh xóa
            preparedStatement.executeUpdate();

            // Kiểm tra xem có bản ghi nào bị xóa không
            return true;
        } catch (SQLException e) {
            e.printStackTrace(); // Hoặc xử lý lỗi theo nhu cầu của bạn
            return false;
        }
    }

    public boolean addUserWishlist(int userId, int productId, String volume, LocalDate date) {
        // Chuỗi SQL để thêm mới một mục vào Wishlist
        String insertSQL = "INSERT INTO Wishlist (userID, productID, favoriteDate, volume) VALUES (?, ?, ?, ?)";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(insertSQL)) {
            // Thiết lập tham số cho câu lệnh SQL
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, productId);
            preparedStatement.setDate(3, java.sql.Date.valueOf(date));
            preparedStatement.setString(4, volume);

            // Thực hiện câu lệnh INSERT
            int rowsAffected = preparedStatement.executeUpdate();

            // Trả về true nếu có ít nhất một dòng được thêm vào bảng
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("không thêm được sản phẩm vào wishlist"); // Hoặc xử lý lỗi theo nhu cầu của bạn
            return false;
        }
    }

    public boolean removeUserWishlist(int userId, int productId) {
        // Chuỗi SQL để xóa một mục từ Wishlist
        String deleteSQL = "DELETE FROM Wishlist WHERE userID = ? AND productID = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(deleteSQL)) {
            // Thiết lập tham số cho câu lệnh SQL
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, productId);

            // Thực hiện câu lệnh DELETE
            int rowsAffected = preparedStatement.executeUpdate();

            // Trả về true nếu có ít nhất một dòng bị xóa
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Hoặc xử lý lỗi theo nhu cầu của bạn
            return false;
        }
    }

//    public static void main(String[] args) throws Exception {
//        UserDAO dao = new UserDAO();
//        User u = new User(null, null, "hanoi@gmail2.com", "hai chieu", null, null);
//        System.out.println(dao.getUserByMail("hanoi@gmail.com"));
//        dao.createUser(u);
//        //System.out.println(dao.getUserLogin("son", "123"));
//    }
}
