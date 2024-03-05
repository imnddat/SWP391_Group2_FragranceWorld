/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Gender;
import Model.Brand;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Comparator;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Product;
import Model.Volume;
import java.util.ArrayList;

/**
 *
 * @author Thinkpad
 */
public class ProductDAO extends DBConnection {

    public Vector<Product> getAll() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "select * from [Products]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");

                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                rs.close();
                connection.close();

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public int insertProduct(Product p) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        int generatedId = -1;

        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([description]\n"
                + "           ,[genderID]\n"
                + "           ,[nameProduct]\n"
                + "           ,[codeProduct]\n"
                + "           ,[discount]\n"
                + "           ,[scent]\n"
                + "           ,[brandID]\n"
                + "           ,[defaultImg]\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, p.getDescription());
            stm.setInt(2, p.getGenderID());
            stm.setString(3, p.getNameProduct());
            stm.setString(4, p.getCodeProduct());
            stm.setInt(5, p.getDiscount());
            stm.setString(6, p.getScent());
            stm.setInt(7, p.getBrandID());
            stm.setString(8, p.getDefaultImg());
            stm.executeUpdate();

            //get generatedId
            rs = stm.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                rs.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return generatedId;
    }

    public void updateProduct(Product p, int pid) {
        PreparedStatement stm = null;

        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [description] = ?\n"
                + "      ,[nameProduct] = ?\n"
                + "      ,[codeProduct] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[scent] = ?\n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, p.getDescription());
            stm.setString(3, p.getNameProduct());
            stm.setString(4, p.getCodeProduct());
            stm.setInt(5, p.getDiscount());
            stm.setString(6, p.getScent());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public int deletetProduct(int id) {
        int n = 0;
        PreparedStatement stm = null;
        ResultSet rs = getData("select * from [dbo].[OrderDetails] where [productID] = " + id);

        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE id = ?";
        try {
            if (!rs.next()) {
                stm = connection.prepareStatement(sql);
                stm.setInt(1, id);

                n = stm.executeUpdate();
            }

        } catch (SQLException ex) {
            n = -1;
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return n;
    }

    public Product getProductsById(int productId) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product product = null;
        String sql = "select * from [Products] where id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");

                product = new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg);
            }
            return product;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                rs.close();
                connection.close();

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    //search by name
    public Vector<Product> getProductsByKeywords(String s) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "select * from [Products] where [nameProduct] like ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + s + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");

                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                rs.close();
                connection.close();

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
//lay gia tri volumes cho homepage

    public Vector<Product> getProductMaxPrice() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "SELECT top(10) *\n"
                + " FROM Products p\n"
                + " left JOIN Volume pr ON p.id = pr.productID where capacity = 30\n"
                + " ORDER BY pr.price DESC";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");

                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);

                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, listV));
            }
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                stm.close();
                rs.close();
                connection.close();

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
    //hotsale.jsp

    public Vector<Product> getProductHotSale() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "SELECT top(3) * FROM Products p\n"
                + "left JOIN Volume pr ON p.id = pr.productID where capacity = 50\n"
                + "ORDER BY pr.price DESC";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");

                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);

                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, listV));
            }
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                stm.close();
                rs.close();
                connection.close();

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
//search by brand

    public Vector<Product> getProductByBrand() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "SELECT * FROM Products p\n"
                + "JOIN Volume pr ON p.id = pr.productID where brandID = ?";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");

                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);
                ArrayList<Brand> listB = getProductByBrandId(id);

                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, listV, listB));
            }
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                stm.close();
                rs.close();
                connection.close();

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    //search by gender
    public Vector<Product> getProductByGender() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "SELECT * FROM Products p\n"
                + "JOIN Volume pr ON p.id = pr.productID where genderID = ?";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");

                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);
                ArrayList<Brand> listB = getProductByBrandId(id);
                ArrayList<Gender> listG = getProductByGenderId(id);
                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, listV, listB, listG));
            }
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                stm.close();
                rs.close();
                connection.close();

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    //lay gia tri volumes cho homepage
    public ArrayList<Volume> getVolumesByProductId(int pid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Volume> volume = new ArrayList<>();
        String sql = "select * from [Volume] where productID=" + pid;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String capacity = rs.getString("capacity");
                int productID = rs.getInt("productID");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                int sold = rs.getInt("sold");

                volume.add(new Volume(id, capacity, productID, price, stock, sold));
            }
            return volume;

        } catch (SQLException ex) {
            Logger.getLogger(VolumeDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    //search by brands
    public ArrayList<Brand> getProductByBrandId(int pid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Brand> brand = new ArrayList<>();
        String sql = "select * from Products where brandID =" + pid;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String capacity = rs.getString("capacity");
                int productID = rs.getInt("productID");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                int sold = rs.getInt("sold");

                brand.add(new Brand(id, sql, capacity));
            }
            return brand;

        } catch (SQLException ex) {
            Logger.getLogger(VolumeDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
    //search by Gender

    public ArrayList<Gender> getProductByGenderId(int gid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Gender> gender = new ArrayList<>();
        String sql = "select * from Products where genderID = " + gid;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String genders = rs.getString("gender");

                gender.add(new Gender(id, genders));
            }
            return gender;

        } catch (SQLException ex) {
            Logger.getLogger(GenderDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ArrayList<Product> GetListProduct(String search, String brandid, String priceFrom, String priceTo,
            String sortType, int index, int pageSize) {

        String sql = "select * from Products p\n"
                + "  join Volume v on p.id = v.productID\n"
                + "  where v.price between ? and ? and p.nameProduct like ? and p.brandID = ? and p.genderID = ? \n"
                + sortType
                + " offset 20 rows fetch next 20 rows only ";
        try {
            ArrayList<Product> list = new ArrayList<>();
            PreparedStatement stm = connection.prepareStatement(sql);
           
            stm.setDouble(1, Double.valueOf(priceFrom));
            stm.setDouble(2, Double.valueOf(priceTo));
            stm.setString(3, "%" + search + "%");
            stm.setInt(4, Integer.valueOf(brandid));
            stm.setInt(5, (index-1)*pageSize);
            stm.setInt(6, pageSize); 
            ResultSet rs = stm.executeQuery();
            
            while (rs.next()) {
                Product u = new Product();
                list.add(u);
            }
            return list;
        } catch (Exception e) {
            
        }
        return null;

    }

//DetailProductController QAnh
    public Product getProductById(String id) {
        try {

            String sql = "SELECT * FROM Products WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
//    public static void main(String[] args) {
//        //trace log
//        System.out.println(new ProductDAO().getProductsByKeywords(s));
//    }
//  public Vector<Product> sortProducts(Vector<Product> products, String sortBy) {
//        if (sortBy.equals("priceLowHigh")) {
//            products.sort(Comparator.comparing(Product::getPrice));
//        }
//
//        if (sortBy.equals("priceHighLow")) {
//            products.sort(Comparator.comparing(Product::getPrice, Comparator.reverseOrder()));
//        }
//
//        if (sortBy.equals("latest")) {
//            products.sort(Comparator.comparing(Product::getRelease_date, Comparator.reverseOrder()));
//        }
//        return products;
//    }
}
