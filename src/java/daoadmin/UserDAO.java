/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoadmin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modeladmin.Role;
import modeladmin.Position;
import modeladmin.User;

/**
 *
 * @author NguyenDucDat
 */
public class UserDAO extends DBContext {

    public Role getRoleByRoleId(int roleId) {
        String sql = "select * from Role where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role r = new Role(rs.getInt("id"), rs.getString("name"));
                return r;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Position> getAllPosition() {
        List<Position> list = new ArrayList<>();
        String sql = "select * from Position";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Position p = new Position(rs.getInt("id"), rs.getString("pname"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Position getPositionByPositionId(int positionId) {
        String sql = "select * from Position where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, positionId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Position r = new Position(rs.getInt("id"), rs.getString("pname"));
                return r;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<User> getAllCustomer() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[positionID]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[address]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[roleID]\n"
                + "      ,[banned]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[User]\n"
                + "  where roleID = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                Position p = getPositionByPositionId(rs.getInt("positionID"));
                u.setPosition(p);
                u.setFullname(rs.getString("fullname"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                Role r = getRoleByRoleId(rs.getInt("roleID"));
                u.setRole(r);
                u.setBanned(rs.getBoolean("banned"));
                u.setStatus(rs.getBoolean("status"));
                list.add(u);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<User> getAllStaff() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[positionID]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[address]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[roleID]\n"
                + "      ,[banned]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[User]\n"
                + "  where roleID = 2";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                Position p = getPositionByPositionId(rs.getInt("positionID"));
                u.setPosition(p);
                u.setFullname(rs.getString("fullname"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                Role r = getRoleByRoleId(rs.getInt("roleID"));
                u.setRole(r);
                u.setBanned(rs.getBoolean("banned"));
                u.setStatus(rs.getBoolean("status"));
                list.add(u);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public User getUserById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[positionID]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[address]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[roleID]\n"
                + "      ,[banned]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[User]\n"
                + "  where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                Position p = getPositionByPositionId(rs.getInt("positionID"));
                u.setPosition(p);
                u.setFullname(rs.getString("fullname"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                Role r = getRoleByRoleId(rs.getInt("roleID"));
                u.setRole(r);
                u.setBanned(rs.getBoolean("banned"));
                u.setStatus(rs.getBoolean("status"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<User> searchCustomer(String key, String status) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[positionID]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[address]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[roleID]\n"
                + "      ,[banned]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[User]\n"
                + "  where roleID = 1 and 1=1";
        if (key != null && !key.equals("")) {
            sql += " and username like '%" + key + "%' or fullname like '%" + key + "%'";
        }
        if (status != null && !status.equals("")) {
            sql += " and banned = ?";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (status != null && !status.equals("")) {
                st.setBoolean(1, Boolean.parseBoolean(status));
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                Position p = getPositionByPositionId(rs.getInt("positionID"));
                u.setPosition(p);
                u.setFullname(rs.getString("fullname"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                Role r = getRoleByRoleId(rs.getInt("roleID"));
                u.setRole(r);
                u.setBanned(rs.getBoolean("banned"));
                u.setStatus(rs.getBoolean("status"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> searchStaff(String key, int pid, String status) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[positionID]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[address]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[roleID]\n"
                + "      ,[banned]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[User]\n"
                + "  where roleID = 2 and 1=1";
        if (key != null && !key.equals("")) {
            sql += " and (username like '%" + key + "%' or fullname like '%" + key + "%')";
        }
        if (pid != 0) {
            sql += " and positionID=" + pid;
        }
        if (status != null && !status.equals("")) {
            sql += " and status = ?";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (status != null && !status.equals("")) {
                st.setBoolean(1, Boolean.parseBoolean(status));
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                Position p = getPositionByPositionId(rs.getInt("positionID"));
                u.setPosition(p);
                u.setFullname(rs.getString("fullname"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                Role r = getRoleByRoleId(rs.getInt("roleID"));
                u.setRole(r);
                u.setBanned(rs.getBoolean("banned"));
                u.setStatus(rs.getBoolean("status"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean updateBanUser(int id, boolean status) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [banned] = ?\n"
                + " WHERE id = ?";
        if (status) {
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setBoolean(1, true);
                st.setInt(2, id);
                try {
                    //st.execute();
                    System.out.println(st.execute());
                } catch (SQLException e) {
                    System.out.println("Loiiiiiii");
                }

                return true;
            } catch (SQLException e) {
                System.out.println("loi1");
            }
        } else {
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setBoolean(1, false);
                st.setInt(2, id);
                try {
                    //st.execute();
                    System.out.println(st.execute());
                } catch (SQLException e) {
                    System.out.println("Loiiiiiii2222222");
                }
                return true;
            } catch (SQLException e) {
                System.out.println("loi2");
            }
        }
        return false;
    }

    public boolean updateStatusUser(int id, boolean status) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [status] = ?\n"
                + " WHERE id = ?";
        if (status) {
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setBoolean(1, true);
                st.setInt(2, id);
                try {
                    st.execute();

                } catch (SQLException e) {
                    System.out.println("Loiiiiiii");
                }

                return true;
            } catch (SQLException e) {
                System.out.println("loi1");
            }
        } else {
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setBoolean(1, false);
                st.setInt(2, id);
                try {
                    st.execute();

                } catch (SQLException e) {
                    System.out.println("Loiiiiiii2222222");
                }
                return true;
            } catch (SQLException e) {
                System.out.println("loi2");
            }
        }
        return false;
    }

    public void addStaff(User u) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[positionID]\n"
                + "           ,[fullname]\n"
                + "           ,[dob]\n"
                + "           ,[address]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[roleID]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setInt(3, u.getPosition().getId());
            st.setString(4, u.getFullname());
            st.setDate(5, u.getDob());
            st.setString(6, u.getAddress());
            st.setString(7, u.getEmail());
            st.setString(8, u.getPhone());
            st.setInt(9, u.getRole().getId()); 
            st.setBoolean(10, u.isStatus()); 
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        UserDAO st = new UserDAO();
//        List<Position> list = st.getAllPosition();
//        for (Position c : list) {
//            System.out.println(c);
//        }
        st.updateBanUser(1, true);
        //System.out.println(st.getUserById(1));
    }
}
