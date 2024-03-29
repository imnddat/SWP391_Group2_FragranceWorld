/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoadmin;

import Model.Sale;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modeladmin.Brand;
import modeladmin.Gender;
import modeladmin.Products;
import modeladmin.SaleEvent;

/**
 *
 * @author NguyenDucDat
 */
public class ProductDAO extends DBContext {

    //get all gender
    public List<Gender> getAllGender() {
        List<Gender> list = new ArrayList<>();
        String sql = "select * FROM [dbo].[Gender] ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Gender g = new Gender(rs.getInt("id"), rs.getString("gender"));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Get Gender by id
    public Gender getGenderById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[gender]\n"
                + "  FROM [dbo].[Gender]\n"
                + "  where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Gender g = new Gender(rs.getInt("id"), rs.getString("gender"));
                return g;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //Get all brand
    public List<Brand> getAllBrand() {
        List<Brand> list = new ArrayList<>();
        String sql = "select * FROM [dbo].[Brand]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand(rs.getInt("id"), rs.getString("name"), rs.getString("makebyFrom"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Get brand by id
    public Brand getBrandById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[makebyFrom]\n"
                + "  FROM [dbo].[Brand]\n"
                + "  where id  = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Brand b = new Brand(rs.getInt("id"), rs.getString("name"), rs.getString("makebyFrom"));
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //Get all product
    public List<Products> getAllProduct() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[description]\n"
                + "      ,[genderID]\n"
                + "      ,[nameProduct]\n"
                + "      ,[codeProduct]\n"
                + "      ,[scent]\n"
                + "      ,[brandID]\n"
                + "      ,[defaultImg]\n"
                + "  FROM [dbo].[Products]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products b = new Products();
                b.setId(rs.getInt("id"));
                b.setDescription(rs.getString("description"));
                Gender g = getGenderById(rs.getInt("genderID"));
                b.setGender(g);
                b.setNameProduct(rs.getString("nameProduct"));
                b.setCodeProduct(rs.getString("codeProduct"));
                b.setScent(rs.getString("scent"));
                Brand p = getBrandById(rs.getInt("brandID"));
                b.setBrand(p);
                b.setDefaultImg(rs.getString("defaultImg"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    //get product by id
    public Products getProductById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[description]\n"
                + "      ,[genderID]\n"
                + "      ,[nameProduct]\n"
                + "      ,[codeProduct]\n"
                + "      ,[scent]\n"
                + "      ,[brandID]\n"
                + "      ,[defaultImg]\n"
                + "  FROM [dbo].[Products]\n"
                + "  where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Products b = new Products();
                b.setId(rs.getInt("id"));
                b.setDescription(rs.getString("description"));
                Gender g = getGenderById(rs.getInt("genderID"));
                b.setGender(g);
                b.setNameProduct(rs.getString("nameProduct"));
                b.setCodeProduct(rs.getString("codeProduct"));
                b.setScent(rs.getString("scent"));
                Brand p = getBrandById(rs.getInt("brandID"));
                b.setBrand(p);
                b.setDefaultImg(rs.getString("defaultImg"));
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //search product
    public List<Products> search(int gid, int bid) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[description]\n"
                + "      ,[genderID]\n"
                + "      ,[nameProduct]\n"
                + "      ,[codeProduct]\n"
                + "      ,[scent]\n"
                + "      ,[brandID]\n"
                + "      ,[defaultImg]\n"
                + "  FROM [dbo].[Products]\n"
                + "  where 1=1";

        if (gid != 0) {
            sql += " and genderID=" + gid;
        }
        if (bid != 0) {
            sql += " and brandID=" + bid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products b = new Products();
                b.setId(rs.getInt("id"));
                b.setDescription(rs.getString("description"));
                Gender g = getGenderById(rs.getInt("genderID"));
                b.setGender(g);
                b.setNameProduct(rs.getString("nameProduct"));
                b.setCodeProduct(rs.getString("codeProduct"));
                b.setScent(rs.getString("scent"));
                Brand p = getBrandById(rs.getInt("brandID"));
                b.setBrand(p);
                b.setDefaultImg(rs.getString("defaultImg"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // add a new product
    public void addProduct(Products p) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([description]\n"
                + "           ,[genderID]\n"
                + "           ,[nameProduct]\n"
                + "           ,[codeProduct]\n"
                + "           ,[scent]\n"
                + "           ,[brandID]\n"
                + "           ,[defaultImg])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getDescription());
            st.setInt(2, p.getGender().getId());
            st.setString(3, p.getNameProduct());
            st.setString(4, p.getCodeProduct());
            st.setString(5, p.getScent());
            st.setInt(6, p.getBrand().getId());
            st.setString(7, p.getDefaultImg());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //delete product
    public void deleteProduct(int id) {
        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //update product
    //sale event
    public List<SaleEvent> getAllSaleEvent() {
        List<SaleEvent> list = new ArrayList<>();
        String sql = "SELECT [sid]\n"
                + "      ,[title]\n"
                + "      ,[eventcontent]\n"
                + "      ,[startdate]\n"
                + "      ,[enddate]\n"
                + "  FROM [dbo].[SaleEvent]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SaleEvent se = new SaleEvent();
                se.setSid(rs.getInt("sid"));
                se.setTitle(rs.getString("title"));
                se.setEventcontent(rs.getString("eventcontent"));
                se.setStartdate(rs.getDate("startdate"));
                se.setEnddate(rs.getDate("enddate"));
                list.add(se);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get sale event by id
    public SaleEvent getSaleEventById(int sid) {
        String sql = "SELECT [sid]\n"
                + "      ,[title]\n"
                + "      ,[eventcontent]\n"
                + "      ,[startdate]\n"
                + "      ,[enddate]\n"
                + "  FROM [dbo].[SaleEvent]\n"
                + "  where sid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                SaleEvent s = new SaleEvent(rs.getInt("sid"), rs.getString("title"), rs.getString("eventcontent"), rs.getDate("startdate"), rs.getDate("enddate"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //create new sale event
    public void addNewSaleEvent(SaleEvent s) {
        String sql = "INSERT INTO [dbo].[SaleEvent]\n"
                + "           ([title]\n"
                + "           ,[eventcontent]\n"
                + "           ,[startdate]\n"
                + "           ,[enddate])\n"
                + "     VALUES (?,?,?,?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s.getTitle());
            st.setString(2, s.getEventcontent());
            st.setDate(3, s.getStartdate());
            st.setDate(4, s.getEnddate());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //delete product
    public void deleteSaleEvent(int sid) {
        String sql = "DELETE FROM [dbo].[SaleEvent]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //update sale event
    public void updateSaleEvent(SaleEvent s) {
        String sql = "UPDATE [dbo].[SaleEvent]\n"
                + "   SET [title] = ?\n"
                + "      ,[eventcontent] = ?\n"
                + "      ,[startdate] = ?\n"
                + "      ,[enddate] = ?\n"
                + " WHERE sid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s.getTitle());
            st.setString(2, s.getEventcontent());
            st.setDate(3, s.getStartdate());
            st.setDate(4, s.getEnddate());
            st.setInt(5, s.getSid());
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //search sale event
    public List<SaleEvent> searchSaleEvent(String key, Date from, Date to) {
        List<SaleEvent> list = new ArrayList<>();
        String sql = "SELECT [sid]\n"
                + "      ,[title]\n"
                + "      ,[eventcontent]\n"
                + "      ,[startdate]\n"
                + "      ,[enddate]\n"
                + "  FROM [dbo].[SaleEvent]\n"
                + "  where 1 = 1 ";
        if (key != null && !key.equals("")) {
            sql += " and title like N'%" + key + "%'";
        }
        if (from != null) {
            sql += " and startdate>='" + from + "'";
        }
        if (to != null) {
            sql += " and startdate<='" + to + "'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SaleEvent se = new SaleEvent();
                se.setSid(rs.getInt("sid"));
                se.setTitle(rs.getString("title"));
                se.setEventcontent(rs.getString("eventcontent"));
                se.setStartdate(rs.getDate("startdate"));
                se.setEnddate(rs.getDate("enddate"));
                list.add(se);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get list product by sid
    public List<Products> getListProductSale(int sid) {
        List<Products> list = new ArrayList<>();
        String sql = "select p.*, s.* \n"
                + "from Products p\n"
                + "join Sale s on p.id = s.productID\n"
                + "where s.sid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Sale s = new Sale();
                s.setProductID(rs.getInt("productID"));
               
                Products product = new Products();
                product.setNameProduct(rs.getString("nameProduct"));
                product.setCodeProduct(rs.getString("codeProduct"));
                product.setDefaultImg(rs.getString("defaultImg"));
                int discount = rs.getInt("discount");
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();
        List<Products> listp = pd.getAllProduct();
        for (Products products : listp) {
            System.out.println(products);
        }
    }
}
