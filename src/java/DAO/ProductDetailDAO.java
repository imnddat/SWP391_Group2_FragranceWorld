/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Brand;
import Model.Gender;
import Model.ImageProduct;
import Model.Product;
import Model.Volume;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class ProductDetailDAO extends DBConnection {

    public ProductDetailDAO() {
        super("jdbc:sqlserver://localhost:1433;databaseName=SWPgroup2", "sa", "123456");
    }

    public List<List<String>> executeSQL(String query) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Connection con = getConnection();
        List<List<String>> resultList = new ArrayList<>();

        try {
            stm = con.prepareStatement(query);
            rs = stm.executeQuery();

            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            while (rs.next()) {
                List<String> row = new ArrayList<>();
                for (int i = 1; i <= columnCount; i++) {
                    row.add(rs.getString(i));
                }
                resultList.add(row);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultList;
    }

    public Product getProduct(int id) {
        List<List<String>> result = executeSQL("select [id],[description],[genderID],[nameProduct],[codeProduct],[discount],[scent],[brandID],[defaultImg] from [Products] where id = " + id);

        if (result != null && !result.isEmpty()) {
            List<String> row = result.get(0); // Assuming only one row is returned for the given ID
            int productId = getInt(row.get(0));
            String description = row.get(1);
            int genderID = getInt(row.get(2));
            String nameProduct = row.get(3);
            String codeProduct = row.get(4);
            int discount = getInt(row.get(5));
            String scent = row.get(6);
            int brandID = getInt(row.get(7));
            String defaultImg = row.get(8);

            return new Product(productId, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg);
        } else {
            return null; // Return null if no product found for the given ID
        }
    }

    public List<Volume> getVolume(int productId) {
        List<List<String>> result = executeSQL("SELECT [id],[capacity],[productID],[price],[stock],[sold] FROM [Volume] WHERE productID = " + productId);

        if (result != null && !result.isEmpty()) {
            List<Volume> volumeList = new ArrayList<>();
            for (List<String> row : result) {
                int id = getInt(row.get(0)); // Assuming id is at index 0
                String capacity = row.get(1); // Assuming capacity is at index 1
                int productID = getInt(row.get(2)); // Assuming productID is at index 2
                double price = Double.parseDouble(row.get(3)); // Assuming price is at index 3
                int stock = getInt(row.get(4)); // Assuming stock is at index 4
                int sold = getInt(row.get(5)); // Assuming sold is at index 5

                // Construct a Volume object and add it to the list
                Volume volume = new Volume(id, capacity, productID, price, stock, sold);
                volumeList.add(volume);
            }
            return volumeList;
        }
        return null;
    }

    public Brand getBrand(int brandId) {
        List<List<String>> result = executeSQL("SELECT [id], [name], [makebyFrom] FROM [Brand] WHERE id = " + brandId);

        if (result != null && !result.isEmpty()) {
            List<String> row = result.get(0); // Assuming only one row is returned for the given brandId
            int id = getInt(row.get(0)); // Assuming id is at index 0
            String name = row.get(1); // Assuming name is at index 1
            String makebyFrom = row.get(2); // Assuming makebyFrom is at index 2

            // Construct and return the Brand object
            return new Brand(id, name, makebyFrom);
        }
        return null; // Return null if no brand is found for the given ID
    }

    public List<ImageProduct> getImageProduct(int productId) {
        List<List<String>> result = executeSQL("SELECT [id], [path], [productID] FROM [ImageProduct] WHERE productID = " + productId);

        List<ImageProduct> imageProductList = new ArrayList<>();

        if (result != null && !result.isEmpty()) {
            for (List<String> row : result) {
                int id = getInt(row.get(0)); // Assuming id is at index 0
                String path = row.get(1); // Assuming path is at index 1
                int productID = getInt(row.get(2)); // Assuming productID is at index 2

                // Construct an ImageProduct object and add it to the list
                ImageProduct imageProduct = new ImageProduct(id, path, productID);
                imageProductList.add(imageProduct);
            }
        }
        return imageProductList; // Return the list of ImageProduct objects
    }

    public Gender getGender(int genderId) {
        List<List<String>> result = executeSQL("SELECT [id], [gender] FROM [Gender] WHERE id = " + genderId);

        if (result != null && !result.isEmpty()) {
            List<String> row = result.get(0); // Assuming only one row is returned for the given genderId
            int id = getInt(row.get(0)); // Assuming id is at index 0
            String gender = row.get(1); // Assuming gender is at index 1

            // Construct and return the Gender object
            return new Gender(id, gender);
        }
        return null; // Return null if no gender is found for the given ID
    }

    public Vector<Product> getLastProduct() {
    PreparedStatement stm = null;
    ResultSet rs = null;
    Vector<Product> products = new Vector<>();
    String sql = "SELECT TOP(10) * FROM Products p " +
                 "LEFT JOIN Volume pr ON p.id = pr.productID " +
                 "WHERE capacity = 30 " +
                 "ORDER BY pr.price DESC";
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
        // Đóng kết nối và các tài nguyên khác ở đây
    }
    return null;
}


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

    public int getInt(String i) {
        try {
            int r = Integer.parseInt(i);
            return r;
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
