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
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getInt("phone"),
                        rs.getInt("roleID"),
                        rs.getInt("banner")));
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
     * get user from User table Using mail and password
     *
     * @param userMail is an String
     * @param password is an String
     * @return <code>User</code> object.
     * @throws java.lang.Exception
     */
    /*   @Override*/
    public User getUserLogin(String email, String password) throws Exception {
        Connection conn = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;

        String sql = "SELECT * FROM [User] WHERE email = ? and password = ? ";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, email);
            pre.setString(2, password);
            rs = pre.executeQuery();
            if (rs.next()) {
                User loginUser = new User(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getInt("phone"),
                        rs.getInt("roleID"),
                        rs.getInt("banner"));
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
//    @Override
    public User getUserById(int id) throws Exception {
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
            pre.setInt(1, id);
            rs = pre.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getInt("phone"),
                        rs.getInt("roleID"),
                        rs.getInt("banner"));
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
     * @param email
     * @return <code>User</code> object.
     * @throws java.lang.Exception
     */
    // @Override
    public User getUserByMail(String email) throws Exception {
        Connection conn = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;

        String sql = "SELECT * FROM [User] WHERE userMail = ?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, email);
            rs = pre.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getInt("phone"),
                        rs.getInt("roleID"),
                        rs.getInt("banner"));
            }
        } catch (SQLException ex) {
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
     * @throws java.lang.Exception
     */
    public int updateUser(User updatedUser) throws Exception {
        Connection conn = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;

        String sql = " UPDATE [User] set username = ?, "
                + "[password] = ?,  "
                + "email = ?, "
                + "name = ?, "
                + "address = ?, "
                + "phone = ?, "
                + "roleID = ?, "
                + "banner = ? "
                + "where id = ?";
        int check = 0;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, updatedUser.getUsername());
            pre.setString(2, updatedUser.getPassword());
            pre.setString(3, updatedUser.getEmail());
            pre.setString(4, updatedUser.getName());
            pre.setString(5, updatedUser.getAddress());
            pre.setInt(6, updatedUser.getPhone());
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
    //@Override
    public int addUser(User newUser) throws Exception {
        Connection conn = null;
        ResultSet rs = null;
        /* Result set returned by the sqlserver */
        PreparedStatement pre = null;
        /* Prepared statement for executing sql queries */

        String sql = "INSERT INTO [User](userName,[password],roleId,userMail,gender,userMobile,[status])"
                + "values(?,?,?,?,?,?,?)";
        int check = 0;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, newUser.getUserName());
            pre.setString(2, newUser.getPassword());
            pre.setInt(3, 1);
            pre.setString(4, newUser.getUserMail());
            pre.setBoolean(5, newUser.isGender());
            pre.setString(6, newUser.getUserMobile());
            pre.setBoolean(7, false);
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

    public HashMap<String, Integer> getUserCountByRole() throws Exception {
        HashMap<String, Integer> map = new HashMap();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pre = null;
        String sql = "SELECT userRoleName, COUNT(userRoleId) AS number "
                + "FROM [UserRole] AS a JOIN [User] AS b ON a.userRoleId = b.roleId "
                + "GROUP BY a.userRoleId,a.userRoleName ";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                map.put(rs.getString("userRoleName"), rs.getInt("number"));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return map;
    }

   

    /**
     * Get filtered and sort Users paginated
     *
     * @param page
     * @param gender
     * @param role
     * @param status
     * @param sortCriteria
     * @param sort
     * @return
     * @throws Exception
     */
  
    public ArrayList<User> getFilteredUserPaging(int page, int gender, int role, int status, String sortCriteria, String sort) throws Exception {
        ArrayList<User> newUserList = new ArrayList();
        /*Database Connection*/
        Connection conn = null;
        /*Result Set got from executing sql query*/
        ResultSet rs = null;
        /*Prepared Statement for executing query*/
        PreparedStatement pre = null;
        /*Set filter depends on the criteria*/
        String filter = "";
        if (gender != -1) {
            filter += " WHERE gender = ?";
            if (role != -1) {
                filter += " AND roleId = ?";
            }
            if (status != -1) {
                filter += " AND [status] = ?";
            }
        } else if (role != -1) {
            filter += "WHERE roleId = ?";
            if (status != -1) {
                filter += " AND [status] = ?";
            }
        } else if (status != -1) {
            filter += "WHERE [status] = ?";
        }
        /**
         * Sort
         */
        switch (sortCriteria) {
            case "sortId":
                sort = " Order By userId " + sort;
                break;
            case "sortName":
                sort = " Order By userName " + sort;
                break;
            case "sortGender":
                sort = " Order By gender " + sort;
                break;
            case "sortMail":
                sort = " Order By userMail " + sort;
                break;
            case "sortMobile":
                sort = " Order By userMobile " + sort;
                break;
            case "sortRole":
                sort = " Order By roleId " + sort;
                break;
            case "sortStatus":
                sort = " Order By status " + sort;
                break;
            default:
                sort = " Order By userId ASC";
        }

        /*Set page boundaries*/
        String pageBoundary = "";

        if (page > 0) {
            pageBoundary = "  WHERE A.num BETWEEN ? AND ?";
        }

        /*SQL query with the criteria*/
        String sql = "  SELECT * FROM (SELECT ROW_NUMBER()  OVER(" + sort + ") as num\n"
                + "				  ,[userId]\n"
                + "				  ,[userName]\n"
                + "				  ,[password]\n"
                + "				  ,[roleId]\n"
                + "				  ,[profilePic]\n"
                + "				  ,[userMail]\n"
                + "				  ,[gender]\n"
                + "				  ,[userMobile]\n"
                + "				  ,[status]\n"
                + "				  FROM [QuizSystem].dbo.[User]\n"
                + filter + ") A\n" + pageBoundary;

        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            int parameterCount = 1;
            /*Set filter parrameter*/
            if (gender != -1) {
                pre.setInt(parameterCount++, gender);
            }
            if (role != -1) {
                pre.setInt(parameterCount++, role);
            }
            if (status != -1) {
                pre.setInt(parameterCount++, status);
            }
            /*Set paging parameter*/
            if (page > 0) {
                pre.setInt(parameterCount++, (page - 1) * 7 + 1);
                pre.setInt(parameterCount, page * 7);
            }

            rs = pre.executeQuery();
            while (rs.next()) {
                newUserList.add(new User(rs.getInt("userId"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("userMail"),
                        rs.getBoolean("gender"),
                        rs.getString("userMobile"),
                        rs.getBoolean("status")));
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

//    public static void main(String[] args) throws Exception {
//        UserDAOImpl dao = new UserDAOImpl();
//        for (User u : dao.getTrueAllUserPaging(1, "userMail", "fpt", "sortMail", "asc")) {
//            System.out.println(u.getUserMail());
//        }
//    }
}
