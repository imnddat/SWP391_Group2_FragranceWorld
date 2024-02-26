/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

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
                        rs.getString("name"),
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

    /**
     * get user from User table Using name and password
     *
     * @param userName is an String
     * @param password is an String
     * @return <code>User</code> object.
     * @throws java.lang.Exception
     */
    public User getUserLogin(String userName, String password) throws Exception {
        Connection conn = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;

        String sql = "SELECT * FROM [User] WHERE username = ? and password = ? ";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, userName);
            pre.setString(2, password);
            rs = pre.executeQuery();
            if (rs.next()) {
                User loginUser = new User(rs.getInt("id"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getInt("roleID"),
                        rs.getInt("banned"));
                return loginUser;
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

    /**
     * get user from User table using userId
     *
     * @param userId is an int
     * @return <code>User</code> object.
     * @throws java.lang.Exception
     */
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
                        rs.getString("name"),
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

    /**
     * get user from User table using userMail
     *
     * @param userMail is an String
     * @return <code>User</code> object.
     */
    public User getUserByMail(String userMail) throws Exception {
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
                        rs.getString("name"),
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

    /**
     * update a user from User table
     *
     * @param updatedUser is a <code>User</code> object
     * @return a int.
     */
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
                + "      ,[name] = ?\n"
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

    /**
     * add a user to User table
     *
     * @param newUser is an <code>User</code> object
     * @return a int.
     */
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

    /**
     * delete a user from User table
     *
     * @param user is an <code>User</code> object
     * @return a int.
     */
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
                    updatedUser.setName(rs.getString("name"));
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
            // You should handle closing resources properly, preferably in a try-with-resources block
        }

        return updatedUser;
    }

//    public static void main(String[] args) throws Exception {
//        UserDAO dao = new UserDAO();
//        for (User u : dao.getTrueAllUserPaging(1, "userMail", "fpt", "sortMail", "asc")) {
//            System.out.println(u.getUserMail());
//        }
//    }
}
