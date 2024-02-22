/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

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

        String sql = "DELETE FROM [dbo].[Products]\n" +
"      WHERE id = ?";
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

//    public Vector<Product> filterByPrice(String filter, Vector<Product> products) {
//        Vector<Product> productsAfterFilter = new Vector<>();
//
//        switch (filter) {
//            case "price-500-750":
//                productsAfterFilter = filterPrice(500, 750, products);
//                break;
//            case "price-750-1000":
//                productsAfterFilter = filterPrice(750, 1000, products);
//                break;
//            case "price-1000-1500":
//                productsAfterFilter = filterPrice(1000, 1500, products);
//                break;
//            case "price-1500up":
//                productsAfterFilter = filterPrice(1500, Double.MAX_VALUE, products);
//                break;
//            default:
//                return products;
//        }
//
//        return productsAfterFilter;
//    }
//
//    public Vector<Product> filterByBrand(String filter, Vector<Product> products) {
//        Vector<Product> productsAfterFilter = new Vector<>();
//
//        if (filter.equals("brand-all")) {
//            return products;
//        }
//        String[] filterSplits = filter.split("[-]");
//        int brandId = Integer.parseInt(filterSplits[1]);
//        productsAfterFilter = filterBrand(brandId, products);
//
//        return productsAfterFilter;
//    }
//
//    private Vector<Product> filterPrice(double min, double max, Vector<Product> products) {
//        Vector<Product> productsAfterFilter = new Vector<>();
//
//        for (Product product : products) {
//            if (product.getPrice() < max && product.getPrice() > min) {
//                productsAfterFilter.add(product);
//            }
//        }
//        return productsAfterFilter;
//    }
//
//    private Vector<Product> filterBrand(int id, Vector<Product> products) {
//
//        Vector<Product> productsAfterFilter = new Vector<>();
//        for (Product product : products) {
//            if (product.getBrand_id() == id) {
//                productsAfterFilter.add(product);
//            }
//        }
//        return productsAfterFilter;
//    }

}
